%{

/* An XML scanner that checks for unbalanced tags and syntax errors.
 * If the input XML file is syntactically correct, prints out number of
 * elements.
 */

#include <list>
#include <cstdio>
#include <string>
#include <stdio.h>
#include <stdlib.h>

// If you want to disable DEBUGGING, comment out the next line
// and uncomment the one after.
#define DEBUG(...) fprintf (stdout, __VA_ARGS__)
//#define DEBUG(...)


using namespace std;


// Put here any variables that you may need in the actions.
int nelements = 0;

%}

%option yylineno
%option noyywrap

/* Chars allowable in element and attribute names */
NAME        [a-zA-Z][a-zA-Z0-9:._]*

/* Start conditions */
%x NEWELEMENT

%%
  /* -----------------  RULES ----------------*/


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
