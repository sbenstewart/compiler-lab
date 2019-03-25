%token IF PRINT CLOSE ELSE
%{
#include <stdlib.h>
#include <stdio.h>
void yyerror(char *);
int yylex(void);
%}

%%
expr:	IF expr1 CLOSE	{printf("Valid\n\n");}
	;
expr1:	IF expr2 CLOSE ELSE expr2 CLOSE
	;
expr2:  PRINT
	;

%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
int main(void) {
yyparse();
return 0;
}

