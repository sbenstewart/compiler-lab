%{
#include<stdio.h>
#include<ctype.h>
#include<stdio.h>
#define YYSTYPE double
double sym[26];
%}

%token INTEGER VAR
%left '+''-'
%left '*''/'
%right UMINUS
%%
program: program expr '\n' {printf("%g\n",$2);} 
        | program '\n'
	| /* empty */
        ;

expr: INTEGER | expr '+' expr {$$ = $1 + $3; }| expr '-' expr {$$ = $1 - $3; }| expr '*' expr {$$ = $1 * $3;} | '(' expr ')' {$$ = $2; } |expr '/' expr {$$ = $1 / $3;} | '-' expr %prec UMINUS {$$ = -$2; } ;

%%
yylex()
{
int c;

while((c=getchar())==' ');
if(c=='.'||(isdigit(c))){
ungetc(c,stdin);
scanf("%lf",&yylval);
return INTEGER;
}

return c;
}





