%token IF CND ELSE PRINT CLOSE
%{
#include <stdlib.h>
#include <stdio.h>
void yyerror(char *);
int yylex(void);
int sym[26];
%}

%%
expr:	IF CND expr1 CLOSE	{printf("Valid\n");}
	|IF CND expr1 CLOSE ELSE expr1 CLOSE {printf("Valid\n");}
	;
expr1:	IF CND expr1 CLOSE ELSE expr1 CLOSE
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

