/* Parser for select statement of SQL with optional WHERE and GROUPBY statements. This is case insensitive */
%{
	#include <stdio.h>
%}

%%

%token SELECT FROM IDENTIFIER WHERE AND OR NUM GROUP LITERAL;

STMT: STMT SELECT items table OPTCOND OPTGROUPBY ';' '\n' { printf("Syntax Correct\n\n"); };
	| STMT '\n'
	|
	;

items: '*' | identifiers;

identifiers: IDENTIFIER | IDENTIFIER ',' identifiers;

table: FROM IDENTIFIER WHERE | FROM IDENTIFIER;

OPTCOND: OPTCOND AND OPTCOND
		| OPTCOND OR OPTCOND
		| IDENTIFIER '=' NUM
		| IDENTIFIER '=' LITERAL
		| IDENTIFIER '=' IDENTIFIER
		| IDENTIFIER '>' NUM
		| IDENTIFIER '<' NUM
		| IDENTIFIER '>=' NUM
		| IDENTIFIER '<=' NUM
		| IDENTIFIER '!=' NUM
		| IDENTIFIER '<>' NUM
		| '(' OPTCOND ')'
		|
		; 

OPTGROUPBY : GROUP IDENTIFIER
		|
		;

%%
void yyerror (const char *str) {
	fprintf(stderr, "error: %s\n", str);
}

int yywrap() {
	return 1;
}

main() {
	yyparse();
}