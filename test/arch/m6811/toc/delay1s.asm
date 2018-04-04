;H.Timer #27			
;generate a delay of 1 sec by having 20ms delays generated 50
;times by output compares interrupts on OC2
TIMES EQU 50 ;number of 20 ms delays
D20MS EQU 40000 ;clock cycles for 20 ms
BELL EQU 7 ;BELL character
SBASE EQU $DFFF
REGS EQU $1000 ;registers and offsets
TCNT EQU $0E
TFLG1 EQU $23
TOC2 EQU $18
TMSK1 EQU $22 ;Timer mask Register
OC2F EQU %01000000 ;Output Compare 2 flag
OC2I EQU %01000000 ;Output Compare Interrupt enable
ORG $0000
COUNT RMB 1 ;count for interrupts
	ORG $00DC ;OC2 interrupt vector table
	JMP OC2ISR
	ORG $C000
START SEI ;disable interrupts
	LDS #SBASE
	LDX #REGS
	LDAA #TIMES ;need TIMES interrupts for
	STAA COUNT ;a 1 sec delay
	LDD TCNT,X ;get 1st TCNT value
	STD TOC2,X
	LDAA #OC2F ;in next 32ms set up interrupt
	STAA TFLG1,X ;system overall
	STAA TMSK1,X
	CLI ;unmask global interrupts
LOOP WAI ;wait for interrupt
	TST COUNT
	BNE LOOP
	LDAA #TIMES ;when loop finished, init COUNT
	STAA COUNT ;again and sound BELL
	LDAA #BELL
	JSR SOUND_BELL
	BRA LOOP ;keep going

;OC2ISR routine-------------------------
OC2ISR DEC COUNT
	LDX #REGS ;set up TOC for next interrupt
	LDD TOC2,X
	ADDD #D20MS ;add D20MS clock cycles
	STD TOC2,X
	LDAA #OC2F ;clear OC2F flag
	STAA TFLG1,X
	RTI

;Interrupt vectors here