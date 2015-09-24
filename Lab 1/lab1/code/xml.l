/**
 * !!! XML Scanner Lex/Flex file !!!
 * Date: Thu Sep  3 10:56:36 MDT 2015
 *
 * This is a simple Lex/Flex file that contains errors, and needs to be finished.
 * The requirements are outlined in the assignment. The hope is that this lab
 * will give every team a small bit of experience using Lex/Flex for their first
 * project: a lexer for the Cool language.
 *
 * To understand how the build process for Lex/Flex works, see the included
 * makefile. I, here, will try and document how this file works, but I don't
 * intend to give a comprehensive tutorial. Instead, I will refer you to the
 * following sources.
 *
 * The Flex manual: http://flex.sourceforge.net/manual/
 *     Not a tutorial, but is not poorly written. Tends to have answers to
 *     questions, I find.
 *
 * This tutorial: http://aquamentus.com/flex_bison.html
 *     I just happened to use it once, and is a reasonable start to things.
 *
 * This PDF: http://epaperpress.com/lexandyacc/download/LexAndYaccTutorial.pdf
 *     A bit more thorough of a tutorial.
 *
 * Maybe I'll add more, maybe not... WHO KNOWS
 *
 *                           ****************
 *
 * So remember that Lex files have three main sections:
 *   1. Definitions. This will control how Flex will compile things, and add
 *      any needed definitions.
 *   2. The actual token list. Each token will have an identifier and a code
 *      block to be run when the code is matched.
 *   3. Verbatim code. This is code that will simply be emitted at the end of the
 *      generated file.
 */


/****************************************************************
                SECTION 1
****************************************************************/
%{

/* An XML scanner that checks for unbalanced tags and syntax errors.
 * If the input XML file is syntactically correct, prints out number of
 * elements.
 */

#include <cstdio>
#include <list>
#include <stdio.h>
#include <stdlib.h>
#include <string>

using namespace std;

// If you want to disable DEBUGGING, comment out the next line
// and uncomment the one after.
#define DEBUG(...) fprintf (stdout, __VA_ARGS__)
//#define DEBUG(...)

// Put here any variables that you may need in the actions.
int nelements = 0;
%}
/****************************************************************/

%option yylineno   /* Gives access to a variable yylineno (guess what that
                      does!) */
%option noyywrap   /* Gives a default implementation to noyywrap, a function that
                      allows lex to "move on" to more files once it has finished.
                       The default is "there is only one file." */


/* Chars allowable in element and attribute names */
NAME        [a-zA-Z][a-zA-Z0-9:._]*

/* Start conditions */
%x NEWELEMENT

%%
/****************************************************************
                SECTION 2: RULES
****************************************************************/

  /* ignore the preamble and any whitespace after it if present.
   * starts with <? and ends in ?>
   */
\<\?.*\?\>[ \t\n\r]*   { /* */ }


  /* Element start tag "<name" */
\<{NAME}      {
                 char* elementname = yytext+1; // skip '<'
                 BEGIN(NEWELEMENT);
                 DEBUG("< (%s) ",elementname);
               }

  /* Element close tag  "</name>" */
\<\/{NAME}\>  {
                 char* elementname = yytext+2; // skip "</"
                 yytext[yyleng-1] = '\0'; // Delete the last char('>')
                 DEBUG("</ (%s) >",elementname);
               }

  /* Start condition for new element tags. Anything that can go
   * between "<elementname" and ">" should be defined here.
   * Also, catch > and /> here.
   */
<NEWELEMENT>{

    /* Element start tag closing ">" */
  \>          { DEBUG("> "); BEGIN(INITIAL); }


    /* Eat up the whitespace in element start tags */
  [ \t\n\r]*   { /* consume the whitespace */ }
    /* Anything that we can't recognize */
  .          {
              printf("\nInvalid character '%s' on line %d\n",yytext,yylineno);
              exit(1);
             }

} /* End of NEWELEMENT start condition */

  /* Keep the indentation for better display */
[ \t\n\r]*     { DEBUG("%s",yytext);}
<<EOF>>      {
               return 0; // to tell the main that we are done.
             }

  /* Here define a rule to match text between elements */
%%
/****************************************************************/

/****************************************************************
                SECTION 3: CODE
****************************************************************/
  // You probably don't need anything here.
