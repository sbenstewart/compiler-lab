%{
	#include <ctype.h>
	#include <stdio.h>
	#define YYSTYPE int
	int sym[26];
%}
%token NUMBER VARIABLE
%left '+' '-'
%left '*' '/'
%right UMINUS
%%
program:
	program statement '\n'
	|
	;
statement:
	expr	{ printf("%d\n", $1); }
	| VARIABLE '=' expr	{ sym[$1] = $3; }
	;
expr:	NUMBER
	| VARIABLE { $$ = sym[$1]; }
	| '-'expr %prec UMINUS { $$ = -$2; }
	| expr '+' expr	{ $$ = $1 + $3; }
	| expr '-' expr	{ $$ = $1 - $3; }
	| expr '*' expr	{ $$ = $1 * $3; }
	| expr '/' expr	{ $$ = $1 / $3; }
	| '(' expr ')'	{ $$ = $2; }
	;

%%
yylex()
{
	int c;
	while((c = getchar()) == ' ' );
	if( (c == '.') || (isdigit(c)) )
	{
		ungetc(c,stdin);
		scanf("%d",&yylval);
		return NUMBER;
	}
	if(isalpha(c))
	{
		ungetc(c,stdin);
		scanf("%c",&yylval);
		return VARIABLE;
	}
	return c;
}
