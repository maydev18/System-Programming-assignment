/* Lexer for select statement of SQL with optional WHERE and GROUPBY statements. This is case insensitive */
%{
#include <stdio.h>
#include "ques1.tab.h"
extern int yylval;
%}

%%
[Ss][Ee][Ll][Ee][Cc][Tt]			return SELECT;
[Ff][Rr][Oo][Mm]					return FROM;
[Ww][Hh][Ee][Rr][Ee]				return WHERE;
[Aa][Nn][Dd]					    return AND;
[Oo][Rr]                            return OR;
[Gg][Rr][Oo][Uu][Pp][ ][Bb][Yy]     return GROUP;
"<="|">="|"!="|"<>"|"*"|";"|","|"=" return *yytext;
[a-zA-Z_][a-zA-Z0-9_]+			    return IDENTIFIER;
\"[a-zA-Z0-9]+\"                    return LITERAL;
\'[a-zA-Z0-9]\'                     return LITERAL;
[0-9]+                              return NUM;
\n					                return *yytext;
[ \t]+					/* ignore whitespace */;
%%
