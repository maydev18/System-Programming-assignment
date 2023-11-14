/* Parser for select statement of SQL with optional WHERE and GROUPBY statements. This is case insensitive */
%{
	#include <stdio.h>
%}

%%

%token SELECT FROM IDENTIFIER WHERE AND OR NUM GROUP LITERAL;
/* Done by mayank */
STMT: STMT SELECT items table OPTCOND /* Done by mayank */ OPTGROUPBY ';' '\n' { printf("Syntax Correct\n\n"); };
	| STMT '\n'
	|
	;

items: '*' | identifiers;

identifiers: IDENTIFIER | IDENTIFIER ',' identifiers;

table: FROM IDENTIFIER WHERE | FROM IDENTIFIER;
/* Done by mayank */
OPTCOND: OPTCOND AND OPTCOND
		| OPTCOND OR OPTCOND
		| IDENTIFIER '=' NUM
		| IDENTIFIER '=' LITERAL
		/* Done by mayank */
		| IDENTIFIER '=' IDENTIFIER
		| IDENTIFIER '>' NUM
		| IDENTIFIER '<' NUM
		/* Done by mayank */
		| IDENTIFIER '>=' NUM
		| IDENTIFIER '<=' NUM
		/* Done by mayank */
		| IDENTIFIER '!=' NUM
		| IDENTIFIER '<>' NUM
		| '(' OPTCOND ')'
		|
		; 

OPTGROUPBY : GROUP IDENTIFIER
		|
		;
/* Done by mayank */
%%
void yyerror (const char *str) {
	fprintf(stderr, "error: %s\n", str);
}

int yywrap() {
	return 1;
}
/* Done by mayank */

main() {
	yyparse();
}