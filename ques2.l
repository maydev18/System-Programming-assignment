/* Lexer for 'for loop' of C/C++ */
%{
    #include <stdio.h>
    #include "ques2.tab.h"
    /* Done by mayank */
%}

letter [A-Za-z_]
digit [0-9]
/* Done by mayank */
id  {letter}({letter}|{digit})*

%%
/* Done by mayank */
for                                         return FOR;
int|float|double|short|long                 return DATATYPE;
{digit}+                                    return NUM;
/* Done by mayank */
{id}                                        return ID;
"<="                                        return LE;
">="                                        return GE;
/* Done by mayank */
"=="                                        return EQ;
"!="                                        return NE;
"||"                                        return OR;
"&&"                                        return AND;
/* Done by mayank */

\n          return *yytext;
[ \t]+    
/* Done by mayank */
.           return *yytext;

%%