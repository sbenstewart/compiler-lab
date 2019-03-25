%{
#include<stdio.h>
int yylex(void);
#include<ctype.h>
#include<stdio.h>
#define YYSTYPE int
int sym[26];
int flag=0;
%}

%token INTEGER VAR
%%
program: program variable '\n' {printf("Valid variable \n");}
        | program '\n'
	| /* empty */
        ;
variable : 
letter ld
;

ld :
letter ld
|digit ld
| /* empty */
;

digit :
INTEGER
;

letter :
VAR
;






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





