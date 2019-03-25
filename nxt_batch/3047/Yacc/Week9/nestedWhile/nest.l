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
ini "int "|"float "
%%
{ini}{alp}	{
			yylval = *yytext;
			return INITI;
			}
"while("{alp}{rel}{digit}"){"	{
			yylval = *yytext;
			return WHILE;
		}
"print("{alp}")" {
		yylval = *yytext;
		return PRINT;
		}
"}" {
	yylval = *yytext;
	return CLOSE;
	}
{alp}"++"	{
			yylval = *yytext;
			return INCRE;
		}
[ \n\t]	;
.* {yyerror("invalid"); } 
%%
int yywrap(void) {
	return 1;
}
