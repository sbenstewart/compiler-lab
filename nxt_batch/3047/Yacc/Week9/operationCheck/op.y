%token REL OPEN CLOSE LOGIC
%{
#include <stdlib.h>
#include <stdio.h>
void yyerror(char *);
int yylex(void);
int sym[26];
%}

%%
expr:	OPEN expr1 CLOSE {printf("Valid\n");}
	|expr1
	;
expr1:	OPEN REL CLOSE expr1
	|REL expr1
	|LOGIC REL expr1
	|
	;

%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
int main(void) {
yyparse();
return 0;
}

