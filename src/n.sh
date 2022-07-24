#!/bin/sh

cd arch/m6800
gcc -O0 -ggdb -Wall -DUSE_PROTOTYPES -DM6800 -I../../../inc/arch/m6800 -I../../../inc/arch/m68xx -I../../../inc/base   -c ../../base/callstac.c -o callstac.o
gcc -O0 -ggdb -Wall -DUSE_PROTOTYPES -DM6800 -I../../../inc/arch/m6800 -I../../../inc/arch/m68xx -I../../../inc/base   -c ../../base/command.c -o command.o
gcc -O0 -ggdb -Wall -DUSE_PROTOTYPES -DM6800 -I../../../inc/arch/m6800 -I../../../inc/arch/m68xx -I../../../inc/base   -c ../../base/cpu.c -o cpu.o
gcc -O0 -ggdb -Wall -DUSE_PROTOTYPES -DM6800 -I../../../inc/arch/m6800 -I../../../inc/arch/m68xx -I../../../inc/base   -c ../../base/fileio.c -o fileio.o
gcc -O0 -ggdb -Wall -DUSE_PROTOTYPES -DM6800 -I../../../inc/arch/m6800 -I../../../inc/arch/m68xx -I../../../inc/base   -c ../m68xx/alu.c -o alu.o
gcc -O0 -ggdb -Wall -DUSE_PROTOTYPES -DM6800 -I../../../inc/arch/m6800 -I../../../inc/arch/m68xx -I../../../inc/base   -c ../m68xx/memory.c -o memory.o
gcc -O0 -ggdb -Wall -DUSE_PROTOTYPES -DM6800 -I../../../inc/arch/m6800 -I../../../inc/arch/m68xx -I../../../inc/base   -c ../m68xx/io.c -o io.o
gcc -O0 -ggdb -Wall -DUSE_PROTOTYPES -DM6800 -I../../../inc/arch/m6800 -I../../../inc/arch/m68xx -I../../../inc/base   -c ../m68xx/reg.c -o reg.o
gcc -O0 -ggdb -Wall -DUSE_PROTOTYPES -DM6800 -I../../../inc/arch/m6800 -I../../../inc/arch/m68xx -I../../../inc/base   -c ../m68xx/opfunc.c -o opfunc.o
gcc -O0 -ggdb -Wall -DUSE_PROTOTYPES -DM6800 -I../../../inc/arch/m6800 -I../../../inc/arch/m68xx -I../../../inc/base   -c instr.c -o instr.o
gcc -O0 -ggdb -Wall -DUSE_PROTOTYPES -DM6800 -I../../../inc/arch/m6800 -I../../../inc/arch/m68xx -I../../../inc/base   -c ireg.c -o ireg.o
gcc -O0 -ggdb -Wall -DUSE_PROTOTYPES -DM6800 -I../../../inc/arch/m6800 -I../../../inc/arch/m68xx -I../../../inc/base   -c optab.c -o optab.o

cd ../../base
gcc -O0 -ggdb -Wall  -I../../inc/base -I../../inc/arch/m68xx  -c -o error.o error.c
gcc -O0 -ggdb -Wall  -I../../inc/base -I../../inc/arch/m68xx  -c -o fprinthe.o fprinthe.c
gcc -O0 -ggdb -Wall  -I../../inc/base -I../../inc/arch/m68xx  -c -o main.o main.c
gcc -O0 -ggdb -Wall  -I../../inc/base -I../../inc/arch/m68xx  -c -o symtab.o symtab.c
gcc -O0 -ggdb -Wall  -I../../inc/base -I../../inc/arch/m68xx  -c -o tty.o tty.c

cd ../boards
gcc -O0 -ggdb -Wall -DUSE_PROTOTYPES -I../../inc/base -I../../inc/arch/m68xx  -c noboard.c -o noboard.o
gcc    -o sim6800 noboard.o ../base/error.o ../base/fprinthe.o ../base/main.o ../base/symtab.o ../base/tty.o ../arch/m6800/callstac.o ../arch/m6800/command.o ../arch/m6800/cpu.o ../arch/m6800/io.o ../arch/m6800/fileio.o ../arch/m6800/memory.o ../arch/m6800/reg.o ../arch/m6800/opfunc.o ../arch/m6800/optab.o ../arch/m6800/instr.o ../arch/m6800/ireg.o

