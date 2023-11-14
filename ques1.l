/* Lexer for select statement of SQL with optional WHERE and GROUPBY statements. This is case insensitive */ /* Done by mayank */
%{
#include <stdio.h>
#include "ques1.tab.h"
extern int yylval;
%}

%%
[Ss][Ee][Ll][Ee][Cc][Tt]			return SELECT;
[Ff][Rr][Oo][Mm]					return FROM;
/* Done by mayank */
[Ww][Hh][Ee][Rr][Ee]				return WHERE;
[Aa][Nn][Dd]					    return AND;
/* Done by mayank */
[Oo][Rr]                            return OR;
[Gg][Rr][Oo][Uu][Pp][ ][Bb][Yy]     return GROUP;
"<="|">="|"!="|"<>"|"*"|";"|","|"=" return *yytext;
/* Done by mayank */
[a-zA-Z_][a-zA-Z0-9_]+			    return IDENTIFIER;
/* Done by mayank */
\"[a-zA-Z0-9]+\"                    return LITERAL;
\'[a-zA-Z0-9]\'                     return LITERAL;
[0-9]+                              return NUM;
/* Done by mayank */
\n					                return *yytext;
[ \t]+					/* ignore whitespace */;
%%
