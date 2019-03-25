%token INTEGER VARIABLE
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS
%{
#include <stdlib.h>
#include <stdio.h>
#define YYSTYPE char
void yyerror(char *);
int yylex(void);
int sym[26];
int ll = 110;
int i;
%}
%%
program:	
	program statement '\n'	
	|
	;
statement:
	
	expr ':' '=' expr	{ printf("%d:%c=%c\n",i,$1,$4);i++; }
	;


expr:
	VARIABLE	{ $$=$1; }
	| VARIABLE '[' VARIABLE ']' { printf("%d:%c=%c*8\n",i,ll,$3);i++;char k = ll;ll++;printf("%d:%c=%c[%c]\n",i,ll,$1,k);$$ = ll;i++; }
	| expr '+' expr	{ $$=ll;printf("%d:%c=%c+%c\n",i,ll++,$1,$3);i++; }
	| expr '-' expr	{ $$=ll;printf("%d:%c=%c-%c\n",i,ll++,$1,$3);i++; }
	| expr '*' expr	{ $$=ll;printf("%d:%c=%c*%c\n",i,ll++,$1,$3);i++; }
	| expr '/' expr	{ $$=ll;printf("%d:%c=%c/%c\n",i,ll++,$1,$3); i++;}
	| '(' expr ')'	{ $$=ll; }
	;

%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
int main(void) {
yyparse();
return 0;
}

