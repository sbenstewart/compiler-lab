%{
int i=1000;
int off=4;
%}
lower [a-z]
upper [A-Z]
digit [0-9]
inc "++"
dec "--"
arithmetic [\-+\*/]
relational "<"|"<="|">"|">="|"!="
identifier ({lower}|{upper})({lower}|{upper}|{digit})*
%%
"if"|"else"|"for"|"while"|"do"|"main"|"print"|"def"|"return" {i+=4;printf("%d Keyword %s\n",i,yytext);}
"int" {off=4;}
"float" {off=8;}
{relational}|"="|{arithmetic}|{inc}|{dec} {i+=2;printf("%d Operator %s\n",i,yytext);}
{digit}* {i+=8;printf("%d Constant %s\n",i,yytext);}
{identifier} {i+=off;printf("%d Identifier %s\n",i,yytext);}
\".*\" {i+=yyleng-2;printf("%d String %s\n",i,yytext);}
%%
