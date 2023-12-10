
%{
#include <stdio.h>
#include "q7.tab.h"
%}

%%
[0-9]+ {
    yylval = atoi(yytext);
    return NUMBER;
}
\n		 return *yytext;
[ \t]+ ;
%%

int yywrap() {
    return 1;
}
