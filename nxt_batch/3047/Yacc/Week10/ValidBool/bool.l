%{
	#include <stdlib.h>
	void yyerror(char *);
	#include "y.tab.h"
%}
alp [a-z]
rel "&&"|"^"|\|\|
equ [=]
su [+|-|*|/]
digit [0-9]+
%%
"if("	{
		yylval = *yytext;
		printf("%s",yytext);
		return IF;
	}
"while("	{
			yylval = *yytext;
			printf("%s",yytext);
			return WHILE;
		}
"else"		{
			yylval = *yytext;
			printf("%s",yytext);
			return ELSE;
		}
"&&"|"^"|\|\|	{
			yylval = *yytext;
			printf("%s",yytext);
			return LOGIC;
		}
{alp}{rel}{alp} {
			yylval = *yytext;
			printf("%s",yytext);
			return REL;
		}
{alp}		{
			yylval = *yytext;
			printf("%s",yytext);
			return TERM;
		}
"{"	{
		yylval = *yytext;
		printf("%s",yytext);
		return OPEN;
	}
"}"	{
		yylval = *yytext;
		printf("%s",yytext);
		return CLOSE;
	}
")"	{
		yylval = *yytext;
		printf("%s",yytext);
		return CLOSE1;
	}
[ \n\t]	;
"print"	{
		yylval = *yytext;
		printf("%s",yytext);
		return STATM;
	} 
%%
int yywrap(void) {
	return 1;
}
