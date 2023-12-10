%{
#include <stdio.h>
extern int yylex();
extern int yyparse();

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
%}

%token NUMBER

%%
input: NUMBER '\n' {
    int num = $1;
    printf("Decimal: %d \n Binary: ", num);
    for (int i = 31; i >= 0; --i) {
        printf("%d", (num >> i) & 1);
    }
    printf("\n");
}
%%

int main() {
    yyparse();
    return 0;
}
