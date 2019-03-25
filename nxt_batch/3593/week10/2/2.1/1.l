%{
#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}
alpha [A-Za-z]
digit [0-9]
%%
{alpha} {yylval = *yytext - 'a'; return VARIABLE;}
{digit} {yylval = atoi(yytext); return NUMBER;}
"<=" {return LE;}
">=" {return GE;}
"<"  {return LT;}
">"  { return GT;}
"!=" {return NE;}
"==" {return EQ;}
"&&" {return AND;}
"||" {return OR;}
[-+()=/*\n] { return *yytext; }
[ \t] ;
. yyerror("invalid character");
%%
int yywrap(void) {
return 1;
}
