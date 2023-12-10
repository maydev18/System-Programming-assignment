%{
    #include "ques4.tab.h"
%}
%%
do {return DO;}
while {return WHILE;}
"+="|"-="|"=" {return ASSIGN;}
"!="|"=="|">="|"<="|">"|"<" {return BOOL;}
"+"|"-"|"/"|"*" {return ARITH;}
[a-zA-Z][a-zA-Z0-9_]* {return VAR;}
[0-9]+ {return NUM;}
\n {return *yytext;}
[ ]+ {}
. {return *yytext;}
%%