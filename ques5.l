%{
    #include "ques5.tab.h"
%}
%%
while {return WHILE;}
"+="|"-="|"=" {return ASSIGN;}
"!="|"=="|">="|"<="|">"|"<" {return BOOL;}
"+"|"-"|"/"|"*" {return ARITH;}
"!="|"=="|true|false {return *yytext;}
[a-zA-Z][a-zA-Z0-9_]* {return VAR;}
[0-9]+ {return NUM;}
\n {return *yytext;}
[ ]+ {}
. {return *yytext;}
%%