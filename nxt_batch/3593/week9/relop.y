%{
#include<stdio.h>
int yylex(void);
#include<ctype.h>
#include<stdio.h>
int sym[26];
int flag=0;
%}

%token INTEGER VAR LE GE EQ NE NOT G L AND OR N
%left '+''-'
%left '*''/'
%%


program: program statement '\n' 
        | program '\n'
	| /* empty */
        ;

statement: expr {printf("%d\n",$1);}|VAR '=' expr {sym[$1]=$3;} ; 

expr : INTEGER | VAR{$$=sym[$1];} |
expr LE expr {if($1<=$3) $$=1;else $$=0;} |
expr GE expr {if($1>=$3)$$=1;else $$=0;} |
'!' expr {if($2==0)$$=1;else $$=0;} |
expr NE expr {if($1!=$3)$$=1;else $$=0;} |
'(' expr ')' {$$=$2;} |
expr L expr {if($1<$3) $$=1;else $$=0;} |
expr G expr {if($1>$3)$$=1;else $$=0;} |
expr EQ expr {if($1==$3)$$=1;else $$=0;} |
expr AND expr {if($1*$3)$$=1;else $$=0;} |
expr OR expr {if($1+$3)$$=1;else $$=0;} ;

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

