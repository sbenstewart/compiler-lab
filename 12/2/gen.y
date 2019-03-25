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
int i=0;
%}
%%
program:	
	program statement '\n'	
	|
	;
statement:
	
	expr ':' '=' expr	{ printf("%c=%c\n",$1,$4); }
	;


expr:
	VARIABLE	{ $$=$1; printf("LD R%d %c\n",i,$1);i++;}
	| VARIABLE '[' VARIABLE ']' { printf("%c=%c*8\n",ll,$3);char k = ll;ll++;printf("%c=%c[%c]\n",ll,$1,k);$$ = ll; }
	| expr '+' expr	{ $$=ll;printf("ADD R%d,R%d,R%d",i,i-1,i); }
	| expr '-' expr	{ $$=ll;printf("%c=%c-%c\n",ll++,$1,$3); }
	| expr '*' expr	{ $$=ll;printf("%c=%c*%c\n",ll++,$1,$3); }
	| expr '/' expr	{ $$=ll;printf("%c=%c/%c\n",ll++,$1,$3); }
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

