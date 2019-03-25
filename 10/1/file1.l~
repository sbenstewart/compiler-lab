%{
#include<stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}

%%
"while" {
return WHILE;}

"if" {
return IF;}

"else" { 
return ELSE;}

[0-9]+ { yylval = atoi(yytext);
   return INTEGER;
}
[a-z]+ { yylval = *yytext -'a';
return VAR;}



[-+()\{\}*/=!<>&\|\n] return *yytext;

[ \t\n] ; 

. yyerror("invalid Character");

%%

int yywrap(void)
{ return 1;
}


