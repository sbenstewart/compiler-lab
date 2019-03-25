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
%left '+''-'
%left '*''/'
%right UMINUS
%%
program: program statement '\n' 
        | program '\n'
	| /* empty */
        ;
statement : 
	expr {
	if(flag==0){printf("Infix expression\n");}
	if(flag==1){printf("Postfix expression\n");}
	if(flag==2){printf("Prefix expression\n");}
	}
	| VAR '=' expr {sym[$1]=$3;} 
	;

expr: INTEGER 
	|VAR {$$ = sym[$1];}
	| expr '+' expr {$$ = $1 + $3;flag=0; }
	| expr expr '+'{$$ = $1 + $3;flag=1; }
	| '+' expr expr{$$ = $1 + $3;flag=2; }
	| expr '-' expr {$$ = $1 - $3;flag=0; }
	| expr expr '-'{$$ = $1 - $3;flag=1; }
	| '-' expr expr {$$ = $1 - $3;flag=2; }
	| expr '*' expr {$$ = $1 * $3;flag=0;}
	| expr expr '*'{$$ = $1 * $3;flag=1;}
	| '*' expr expr {$$ = $1 * $3;flag=2;} 
	| '(' expr ')' {$$ = $2; } 
	|expr '/' expr {$$ = $1 / $3;flag=0;}
	|expr expr '/'{$$ = $1 / $3;flag=1;}
	|'/' expr expr {$$ = $1 / $3;flag=2;} 
	| '-' expr %prec UMINUS {$$ = -$2; } ;

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





