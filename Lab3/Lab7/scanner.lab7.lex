%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <vector>
#include <iostream>
#include "parser.lab7.tab.h"

extern int yycol;
extern std::vector< std::pair< std::string, double (*)() > > FunctionTable;
extern "C" {int yywrap(){return(1);}}

std::vector< int > ParenCounter;

#ifndef SCANDEBUG
	#define SCANDEBUG 0
#endif

void printdebug(const char *fmt, ...)
{
	char text[1024];
	if (SCANDEBUG)
	{
		if (fmt)
		{
			va_list arg;
			va_start(arg,fmt);
				vsprintf(text,fmt,arg);
			va_end(arg);
				printf("%s",text);
		}
	}
}

bool IsFunction(char *str)
{
	std::vector< std::pair< std::string, double (*)() > >::iterator i;
	for(i = FunctionTable.begin(); i != FunctionTable.end(); i++)
	{
		if (i->first == str)
		{
			return(true);
		}
	}
	return(false);
}

void adjust(void)
{
	for(int i=0; yytext[i] != '\0'; i++)
	{
		if (yytext[i] == '\n'){yycol = 0;}
		else {yycol++;}
	}
}
%}

	/* OPTIONS SECTION */
%option yylineno

%%
	/* RULES SECTION */
"+"	{adjust(); printdebug("+"); return('+');}
"-"	{adjust(); printdebug("-"); return('-');}
"*"	{adjust(); printdebug("*"); return('*');}
"/"	{adjust(); printdebug("/"); return('/');}
"^"	{adjust(); printdebug("^"); return('^');}
"("	{adjust(); ParenCounter.push_back(yylineno); printdebug("("); return('(');}
")"	{adjust();	
		if (ParenCounter.size() > 0){ParenCounter.pop_back();printdebug(")"); return(')');} 
		else {std::cerr << "Error: unmatched parenthesis on line " << yylineno;}
	}
"=" {adjust();printdebug("="); return('=');}
"\n" {adjust();printdebug("\n"); return('\n');}
[a-zA-Z_][a-zA-Z0-9_]*	{adjust();yylval.Name = strdup(yytext); 
						if (IsFunction(yytext)){printdebug("FUNCTION(%s)",yytext); return FUNCTION;}
						else {printdebug("IDENTIFIER(%s)",yytext); return IDENTIFIER;}
						}
[0-9]+\.[0-9]*			{adjust();yylval.Value = atof(yytext); printdebug("CONSTANT(%f)",yylval.Value); return CONSTANT;}
[0-9]*\.				{adjust();yylval.Value = atof(yytext); printdebug("CONSTANT(%f)",yylval.Value); return CONSTANT;}
[0-9]+					{adjust();yylval.Value = atof(yytext); printdebug("CONSTANT(%f)",yylval.Value); return CONSTANT;}

<<EOF>>					{if (ParenCounter.size() != 0){std::cerr << "Error: unmatched parenthesis on line " << ParenCounter[ParenCounter.size() - 1];}}

[ \t]					{adjust();printdebug("%s",yytext); continue;}
.						{adjust();std::cerr << "Error (" << yylineno << ":" << yycol << "): unknown input " << yytext << std::endl;}

