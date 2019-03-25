%token REL OPEN CLOSE WHILE IF ELSE CLOSE1 STATM TERM LOGIC
%{
#include <stdlib.h>
#include <stdio.h>
void yyerror(char *);
int yylex(void);
int sym[26];
%}

%%
expr:	IF bool CLOSE1 OPEN expr CLOSE {printf("Valid\n");}
	|IF bool CLOSE1 OPEN expr CLOSE ELSE OPEN expr CLOSE {printf("Valid\n");}
	|WHILE bool CLOSE1 OPEN expr CLOSE {printf("Valid\n");}
	|STATM
	;
bool:	TERM
	|REL
	|bool LOGIC TERM
	|bool LOGIC REL
	;
%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
int main(void) {
yyparse();
return 0;
}

