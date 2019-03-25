%{
	#include <stdio.h>
	#include <ctype.h>
	#define YYSTYPE int
%}
%token NUMBER LETTER ZERO X
%%
expr: 
	ZERO X expr2 { printf("Valid\n"); }
	;
expr2:	LETTER	expr2
	|NUMBER	expr2
	|
	;

%%
yylex()
{
	int c;
	while(( c = getchar()) == ' ');
	if( c == '0')
	{	
		ungetc(c,stdin);
		scanf("%d",&yylval);
		return ZERO;
	}
	if( c == 'x' )
	{
		ungetc(c,stdin);
		scanf("%c",&yylval);
		return X;
	}
	if(isdigit(c))
	{
		ungetc(c,stdin);
		scanf("%d",&yylval);
		return NUMBER;
	}
	if(isalpha(c))
	{
		
		ungetc(c,stdin);
		scanf("%c",&yylval);
		return LETTER;
	}
}

