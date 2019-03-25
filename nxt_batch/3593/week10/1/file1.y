
%{
#include <stdlib.h>
#include <stdio.h>
void yyerror(char *);
int yylex(void);
int sym[26];
int i=0;
%}
%token WHILE IF EXPR1 PRINT CLOSE
%%
program:
	program expr 
	|
	;

expr:
	WHILE EXPR1 CLOSE	{printf("Valid Expression\n");}
	|WHILE EXPR1 PRINT CLOSE	{printf("Valid Expression\n");}
	|IF EXPR1 PRINT CLOSE	{printf("Valid Expression\n");}
	;

%%
void yyerror(char *s) {
if(i<1){
fprintf(stderr, "%s\n", s);
}
i++;
}
int main(void) {
yyparse();
return 0;
}
