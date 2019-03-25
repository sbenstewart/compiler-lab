%{
#include<stdio.h>
int yylex(void);
#include<ctype.h>
#include<stdio.h>
#define YYSTYPE int
double sym[26];
int flag=0;
%}
%token INTEGER VAR ZERO XV 
%%
program: program statement '\n' 
        | program '\n'
	| /* empty */
        ;
statement:  expr{if(flag==1)printf("valid");else printf("invalid");};
expr: ZERO XV expr {flag=1;}|
INTEGER |
expr expr |
ZERO expr| XV expr
VAR ;




%%
yylex()
{
int c;
while((c=getchar())==' ');
if(c=='0')
{
ungetc(c,stdin);
scanf("%d",&yylval);
return ZERO;
}
else if(c=='.'||(isdigit(c))){
ungetc(c,stdin);
scanf("%d",&yylval);
return INTEGER;
}
 if(c=='x')
{
ungetc(c,stdin);
scanf("%c",&yylval);
return XV;
}
else if(isalpha(c))
{
ungetc(c,stdin);
scanf("%c",&yylval);
return VAR;
}

return c;
}


