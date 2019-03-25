%token FOR PRINT CLOSE
%{
#include <stdlib.h>
#include <stdio.h>
void yyerror(char *);
int yylex(void);
int sym[26];
%}

%%
expr:	FOR expr1 CLOSE	{printf("Valid\n");}
	;
expr1:	FOR expr1 CLOSE
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

