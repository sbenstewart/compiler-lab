%{
#include<stdio.h>
int yylex(void);
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
program: program statement '\n' 
        | program '\n'
	| /* empty */
        ;
statement : expr {printf("%d\n",$1);}| VAR '=' expr {sym[$1]=$3;} ;

expr: INTEGER |VAR {$$ = sym[$1];}| expr '+' expr {$$ = $1 + $3; }| expr '-' expr {$$ = $1 - $3; }| expr '*' expr {$$ = $1 * $3;} | '(' expr ')' {$$ = $2; } |expr '/' expr {$$ = $1 / $3;} | '-' expr %prec UMINUS {$$ = -$2; } ;

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
else if(isalpha(c))
{
yylval = *yytext -'a';
return VAR;
}

return c;
}





