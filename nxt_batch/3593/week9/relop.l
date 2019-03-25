%{
#include<stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}

%%
[0-9]+ { yylval = atoi(yytext);
   return INTEGER;
}
[a-z]+ { yylval = *yytext -'a';
return VAR;}
[-+()*/=\n!] return *yytext;
"<=" {return LE;}
">="  {return GE;}
"=="  {return EQ;}
"!="  {return NE;}
">" {return G;}
"<" {return L;}
"&&" {return AND;}
"||" {return OR;}

[ \t] ; 

%%

int yywrap(void)
{ return 1;
}


