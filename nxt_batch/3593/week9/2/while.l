%{
#include<stdlib.h>
#include "y.tab.h"
%}
%%
"while" {return WHIL;}
[(] {return OP;}

[)] {return CL;}

[a-zA-Z]+[<|>][0-9]+ {return COND;}


[{] {yylval=yytext[0];return OB;}

[}] {yylval=yytext[0];return CB;}

[ \n]* {return *yytext;}
"[a-z]+[+][+]" {return IC;}



%%
int yywrap(void)
{
return 1;
}
