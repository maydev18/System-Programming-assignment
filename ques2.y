/* Parser for 'for loop' of C/C++ */
%{
    #include <stdio.h>
%}

%token ID NUM FOR LE GE EQ NE OR AND DATATYPE
%right "="
%left OR AND
%left '>' '<' LE GE EQ NE
%left '+' '-'
%left '*' '/'
%right UMINUS
%left '!'

%%
STMT:  STMT ST '\n' { printf("\nValid Expression\n\n"); };
        | STMT '\n'
        |
        ;

ST: FOR '(' DATATYPE MAINEXPR ';' BOOLEXPR ';' MAINEXPR ')' DEF
    | FOR '(' MAINEXPR ';' BOOLEXPR ';' MAINEXPR ')' DEF
    ;

DEF: '{' BODY '}'
    | MAINEXPR ';'
    | ';'

BODY: BODY MAINEXPR ';'
    | MAINEXPR ';'       
    | ST
    |            
    ;
       
MAINEXPR: ID '=' MAINEXPR
    | MAINEXPR '+' MAINEXPR
    | MAINEXPR '-' MAINEXPR
    | MAINEXPR '+' '+'
    | MAINEXPR '-' '-'
    | MAINEXPR '+' '=' MAINEXPR
    | MAINEXPR '-' '=' MAINEXPR
    | ID 
    | NUM
    | '(' MAINEXPR ')'
    ;

BOOLEXPR: BOOLEXPR'<'BOOLEXPR
    | BOOLEXPR'>'BOOLEXPR
    | BOOLEXPR LE BOOLEXPR
    | BOOLEXPR GE BOOLEXPR
    | BOOLEXPR EQ BOOLEXPR
    | BOOLEXPR NE BOOLEXPR
    | BOOLEXPR OR BOOLEXPR
    | BOOLEXPR AND BOOLEXPR
    | '(' BOOLEXPR ')'
    | MAINEXPR
    ;   
%%

main() {
    printf("Enter the expression:\n");
    yyparse();

}     
void yyerror(const char* str){
    fprintf(stderr, "Error: %s\n", str);
}

int yywrap(){
    return 1;
}