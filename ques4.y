%{
    #include <stdio.h>

%}
%token DO WHILE VAR NUM ARITH BOOL ASSIGN

%%
line : line main '\n' {printf("valid\n");}
    | line '\n'
    |
    ;
    
main : DO '{' body '}' WHILE '(' expr ')'
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