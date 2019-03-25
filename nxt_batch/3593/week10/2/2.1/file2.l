%{
	#include <stdlib.h>
	void yyerror(char *);
	#include "y.tab.h"
%}
alpha [a-z]
relop [<|<=|>=|>]
digit [0-9]+
%%
"if("{alp}{rel}{digit}"){"	{yylval = *yytext;return IF;}
"else{"	{yylval = *yytext;
			return ELSE;}
"print("{alp}")" {yylval = *yytext;return PRINT;}
"}" {yylval = *yytext;return CLOSE;
	}
[ \n\t]	;
.* {yyerror("invalid"); } 
%%
int yywrap(void) {
	return 1;
}
