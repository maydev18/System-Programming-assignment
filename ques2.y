/* Parser for 'for loop' of C/C++ */
%{
    #include <stdio.h>
    /* Done by mayank */
%}

%token ID NUM FOR LE GE EQ NE OR AND DATATYPE
%right "="
%left OR AND
%left '>' '<' LE GE EQ NE
/* Done by mayank */
%left '+' '-'
%left '*' '/'
%right UMINUS
%left '!'

%%
STMT:  STMT ST '\n' { printf("\nValid Expression\n\n"); };
        | STMT '\n'
        /* Done by mayank */
        |
        ;

ST: FOR '(' DATATYPE MAINEXPR ';' BOOLEXPR ';' MAINEXPR ')' DEF
    | FOR '(' MAINEXPR ';' BOOLEXPR ';' MAINEXPR ')' DEF
    /* Done by mayank */
    ;

DEF: '{' BODY '}'
    | MAINEXPR ';'
    | ';'

/* Done by mayank */
BODY: BODY MAINEXPR ';'
    | MAINEXPR ';'       
    | ST
    /* Done by mayank */
    |            
    ;
       
MAINEXPR: ID '=' MAINEXPR
    | MAINEXPR '+' MAINEXPR
    | MAINEXPR '-' MAINEXPR
    | MAINEXPR '+' '+'
    /* Done by mayank */
    | MAINEXPR '-' '-'
    | MAINEXPR '+' '=' MAINEXPR
    /* Done by mayank */
    | MAINEXPR '-' '=' MAINEXPR
    | ID 
    | NUM
    /* Done by mayank */
    | '(' MAINEXPR ')'
    ;

BOOLEXPR: BOOLEXPR'<'BOOLEXPR
/* Done by mayank */
    | BOOLEXPR'>'BOOLEXPR
    | BOOLEXPR LE BOOLEXPR
    /* Done by mayank */
    | BOOLEXPR GE BOOLEXPR
    | BOOLEXPR EQ BOOLEXPR
    /* Done by mayank */
    | BOOLEXPR NE BOOLEXPR
    | BOOLEXPR OR BOOLEXPR
    /* Done by mayank */
    | BOOLEXPR AND BOOLEXPR
    | '(' BOOLEXPR ')'
    | MAINEXPR
    ;   
%%

main() {
    /* Done by mayank */
    printf("Enter the expression:\n");
    yyparse();

}     
void yyerror(const char* str){
    /* Done by mayank */
    fprintf(stderr, "Error: %s\n", str);
}

int yywrap(){
    /* Done by mayank */
    return 1;
}