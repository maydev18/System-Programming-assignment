/* Parser for if else statements of C/C++. */
%{
    #include <stdio.h>    
%}

%token ID NUM IF THEN LE GE EQ NE OR AND ELSE
%right "="
%left OR AND
%left '>' '<' LE GE EQ NE
%left '+' '-'
%left '*' '/'
%right UMINUS
%left '!'

%%

Statement: Statement ST '\n' { printf("\nValid Expression\n\n"); };
        | Statement '\n'
        |
        ;

ST : IF '(' condition ')' '{' ST1 '}'
    | IF '(' condition ')' '{' ST1 '}' ELSE '{' ST1 '}'
    ;

ST1 : ST1 ST
    | ST1 E ';'
    | E ';'
    |
    ;

E:  ID '=' E
    | E'+'E
    | E'-'E
    | E'*'E
    | E'/'E
    | '(' E ')'
    | ID
    | NUM
    ;

condition:
    | '(' condition ')'
    | condition '<' condition
    | condition '>' condition
    | condition LE condition
    | condition GE condition
    | condition EQ condition
    | condition NE condition
    | condition OR condition
    | condition AND condition
    | E
    ;
%%

void yyerror(const char* str){
    fprintf(stderr, "Error: %s\n", str);
}

int yywrap(){
    return 1;
}

main() {
    printf("\nEnter the Statement:\n");
    yyparse();
}