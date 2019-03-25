%{
#include<stdio.h>
int yylex(void);
#include<ctype.h>
#include<stdio.h>
#define YYSTYPE int
double sym[26];
%}
%token INTEGER VAR
%%
program: program statement '\n' 
        | program '\n'
	| /* empty */
        ;
statement:  expr{printf("valid");};
expr: '0' 'x' expr|
INTEGER |
INTEGER VAR |
VAR ;




%%
yylex()
{
int c;
while((c=getchar())==' ');
if(c=='.'||(isdigit(c))){
ungetc(c,stdin);
scanf("%d",&yylval);
return INTEGER;
}
if(isalpha(c))
{
ungetc(c,stdin);
scanf("%c",&yylval);
return VAR;
}

return c;
}


