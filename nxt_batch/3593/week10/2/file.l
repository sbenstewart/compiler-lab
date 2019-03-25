%{
#include<stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}
relop ">"|"<"|"=="|"<="|">="
alp [a-z]*
digits [0-9]*
%%

"if("{alp}{relop}{digits}")" { yylval = *yytext;
return IF;printf("mapped");}
"else" { yylval = *yytext;
return ELSE;}
"print("[a-z]");" { yylval = *yytext;
return STMT;}
"{" {yylval=*yytext;return OB;}
"}" {yylval=*yytext;return CB;}
[ \t\n] ;
.* {yyerror("invalid");} 

%%

int yywrap(void)
{ return 1;
}
