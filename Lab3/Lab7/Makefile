CPP = g++
CFLAGS = -Wall
OBJFLAGS = -c

parser: lex.yy.o parser.lab7.tab.o driver.o

	$(CPP) -o parser driver.o lex.yy.o parser.lab7.tab.o
driver.o: driver.cpp
	$(CPP) $(CFLAGS) $(OBJFLAGS) driver.cpp

parser.lab7.tab.o: parser.lab7.tab.cpp
	$(CPP) $(CFLAGS) $(OBJFLAGS) parser.lab7.tab.cpp

parser.lab7.tab.cpp parser.lab7.tab.h: parser.lab7.ypp
	bison -v --defines=parser.lab7.tab.h parser.lab7.ypp

lex.yy.c: scanner.lab7.lex parser.lab7.tab.h
	flex scanner.lab7.lex

lex.yy.o: lex.yy.c
	$(CPP) $(CFLAGS) $(OBJFLAGS) lex.yy.c

clean:
	rm -f *.o
	rm -f lex.yy.c
	rm -f parser.lab7.tab.*
	rm -f parser
	rm -f *.output	
	
