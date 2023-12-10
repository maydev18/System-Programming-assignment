%{
    #include <stdio.h>

%}
%token WHILE VAR NUM ASSIGN BOOL ARITH

%%
line : line main '\n' {printf("valid\n");}
    | line '\n'
    |
    ;
    
main : WHILE '(' expr ')' '{' body '}'
    ;
body : body expr ';'
    | expr ';'
    | body main body
    |
    ;
expr : VAR ASSIGN expr
    | expr BOOL expr
    | expr ARITH expr
    | VAR
    | NUM
    | '(' expr ')'
    ;

%%

int main(){
    yyparse();
    return 0;
}
void yyerror(const char* str){
    fprintf(stderr, "Error: %s\n", str);
}

int yywrap(){
    return 1;
}