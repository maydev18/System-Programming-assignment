%{
    #include "ques6.tab.h"
%}
%%
[+] {return ADD;}
[-] {return MINUS;}
= {return ASSIGN;}
"(" {return OPEN;}
")" {return CLOSE;}
\n {return NL;}
[a-zA-Z][a-zA-Z0-9_]* {return VAR;}
[0-9]+ {return NUM;}
['\n'] {return *yytext;}
[ ]+ {}
. {return *yytext;}
%%