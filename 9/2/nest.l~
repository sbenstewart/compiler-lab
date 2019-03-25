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
"for("{alp}{rel}{digit}";"{alp}{rel}{digit}";"{alp}{su}{su}"){"	{
			yylval = *yytext;
			return FOR;
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
.* {yyerror("invalid"); } 
%%
int yywrap(void) {
	return 1;
}
