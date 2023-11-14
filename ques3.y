/* Parser for if else statements of C/C++. */
%{
    #include <stdio.h>    
%}
/* Done by mayank */
%token ID NUM IF THEN LE GE EQ NE OR AND ELSE
%right "="
%left OR AND
%left '>' '<' LE GE EQ NE
%left '+' '-'
/* Done by mayank */
%left '*' '/'
%right UMINUS
%left '!'

%%

Statement: Statement ST '\n' {/* Done by mayank */ printf("\nValid Expression\n\n"); };
        | Statement '\n'
        |
        /* Done by mayank */
        ;

ST : IF '(' condition ')' '{' ST1 '}'
    | IF '(' condition ')' '{' ST1 '}' ELSE '{' ST1 '}'
    ;

ST1 : ST1 ST
    | ST1 E ';'
    | E ';'
    |
    /* Done by mayank */
    ;

E:  ID '=' E
    | E'+'E
    | E'-'E
    /* Done by mayank */
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
    /* Done by mayank */
    | condition LE condition
    | condition GE condition
    /* Done by mayank */
    | condition EQ condition
    | condition NE condition
    /* Done by mayank */
    | condition OR condition
    | condition AND condition
    /* Done by mayank */
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
    /* Done by mayank */
    yyparse();
}