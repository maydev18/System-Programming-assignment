/* Lexer for 'for loop' of C/C++ */
%{
    #include <stdio.h>
    #include "ques2.tab.h"
%}

letter [A-Za-z_]
digit [0-9]
id  {letter}({letter}|{digit})*

%%

for                                         return FOR;
int|float|double|short|long                 return DATATYPE;
{digit}+                                    return NUM;
{id}                                        return ID;
"<="                                        return LE;
">="                                        return GE;
"=="                                        return EQ;
"!="                                        return NE;
"||"                                        return OR;
"&&"                                        return AND;

\n          return *yytext;
[ \t]+    

.           return *yytext;

%%