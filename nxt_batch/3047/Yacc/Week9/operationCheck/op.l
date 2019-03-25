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
lo [&&|^|!|\|\|]
%%
{alp}{rel}{alp} {
			yylval = *yytext;
			return REL;
		}
"("	{
		yylval = *yytext;
		return OPEN;
	}
")"	{
		yylval = *yytext;
		return CLOSE;
	}
lo	{
	yylval = *yytext;
	return LOGIC;
	}
[ \n\t]	;
 
%%
int yywrap(void) {
	return 1;
}
