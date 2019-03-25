%token WHILE PRINT CLOSE INITI INCRE
%{
#include <stdlib.h>
#include <stdio.h>
void yyerror(char *);
int yylex(void);
int sym[26];
%}

%%
expr:	INITI WHILE expr1 INCRE CLOSE	{printf("Valid\n");}
	;
expr1:	INITI WHILE expr1 INCRE CLOSE
	|PRINT
	;

%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
int main(void) {
yyparse();
return 0;
}

