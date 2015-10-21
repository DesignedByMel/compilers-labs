all: problem6 problem7

problem6: problem6.o main.o
	clang -o problem6  problem6.o main.o

main.o: main.c
	clang -c -Wall main.c

problem6.o: problem6.ll
	clang -c -Wall problem6.ll

problem7: problem7.o test.o
	clang -o problem7  problem7.o test.o

test.o: test.c
	clang -c -Wall test.c

problem7.o: problem7.ll
	clang -c -Wall problem7.ll

clean:
	rm *.o problem6 problem7
