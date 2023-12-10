/* lexer for if else statements of C/C++. */
%{
    #include <stdio.h>
    #include "ques3.tab.h"
%}

letter [A-Za-z_]
digit [0-9]
id  {letter}({letter}|{digit})*

%%

if          return IF;
else        return ELSE;
{digit}+    return NUM;
{id}        return ID;
"<="          return LE;
">="          return GE;
"=="         return EQ;
"!="          return NE;
"||"          return OR;
"&&"          return AND;

\n          return *yytext;
[ \t]+      /* ignore whitespace */;

.           return *yytext;

%%