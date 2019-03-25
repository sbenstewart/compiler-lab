%{
	#include <stdlib.h>
	void yyerror(char *);
	#include "y.tab.h"
%}
alp [a-z]
rel [<|<=|>=|>]
equ [=]
su [+|-|*|/]
digit [0-9]+
%%
"if"	{		yylval = *yytext;
			return IF;
		}
"("{alp}{rel}{alp}"){"	{
			yylval = *yytext;
			return CND;
		}
"else{"	{
			yylval = *yytext;
			return ELSE;
		}
"print("{alp}")" {
		yylval = *yytext;
		return PRINT;
		}
"}" {
	yylval = *yytext;
	return CLOSE;
	}
[ \n\t]	;
%%
int yywrap(void) {
	return 1;
}
