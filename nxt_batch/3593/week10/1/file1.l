%{
#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}
alpha [a-z]
relop [<|<=|>=|>]
digit [0-9]+
%%
"while("	{return WHILE;}
"if("	{
			return IF;
		}
"print("(.*)")"	{return PRINT;}
{alpha}+{relop}{alpha}+"){"	{return EXPR1;}
"}"	{
	yylval = *yytext;
	return CLOSE;
	}

. {yyerror("invalid expression\n");}




%%
int yywrap(void) {
	return 1;
}
