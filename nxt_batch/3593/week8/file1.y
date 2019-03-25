%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
int sym[26];
%}

%token INTEGER VAR
%left '+''-'
%left '*''/'
%left '('')'
%right UMINUS
%%

program: program statement '\n' 
        |
        ;
statement : expr {printf("%d\n",$1);}| VAR '=' expr {sym[$1]=$3;} ;

expr: INTEGER |VAR {$$ = sym[$1];}| expr '+' expr {$$ = $1 + $3; }| expr '-' expr {$$ = $1 - $3; }| expr '*' expr {$$ = $1 * $3;} | '(' expr ')' {$$ = $2; } |expr '/' expr {$$ = $1 / $3;} | '-' expr %prec UMINUS {$$ = -$2; } ;

%%

void yyerror(char *s)
{
fprintf(stderr,"%s\n",s);
}
int main(void)
{
yyparse();
return 0;
} 
