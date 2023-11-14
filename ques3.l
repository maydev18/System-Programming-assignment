/* lexer for if else statements of C/C++. */
%{
    #include <stdio.h>
    #include "ques3.tab.h"
    /* Done by mayank */
%}

letter [A-Za-z_]
digit [0-9]
id  {letter}({letter}|{digit})*
/* Done by mayank */

%%

if          return IF;
else        return ELSE;
{digit}+    return NUM;
/* Done by mayank */
{id}        return ID;
"<="          return LE;
">="          return GE;
/* Done by mayank */
"=="         return EQ;
"!="          return NE;
"||"          return OR;
"&&"          return AND;
/* Done by mayank */

\n          return *yytext;
/* Done by mayank */
[ \t]+      /* ignore whitespace */;

.           return *yytext;

%%