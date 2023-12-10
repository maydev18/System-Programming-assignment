%{
    #include <stdio.h>
    extern void yyerror(const char *);
    extern int yylex(void);
%}
%token VAR NUM OP ASSIGN OPEN CLOSE NL

%%
line : line expr NL {printf("valid\n");}
    |
    ;
expr : VAR ASSIGN expr
    | OPEN expr CLOSE
    | expr OP expr
    | NUM
    | VAR
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