%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(char *);
int yylex(void);
int sym[26] = {7,0,3,4,2};
%}
%token LT GT VARIABLE NUMBER LE GE EQ NE AND OR
%left '+' '-' '*' '/'
%%
prog : prog stmt '\n'
     | 
     ;
stmt : expr {printf("valid\n");}
      | VARIABLE '=' expr {sym[$1] = $3;}
     ;
expr : NUMBER
     | VARIABLE {$$ = sym[$1];}
     | '(' expr ')' {$$ = $2;}
     | expr LE expr {if($1 <= $3) $$ = 1 ;else $$ = 0;}
     | expr GE expr {if($1 >= $3) $$ = 1 ;else $$ = 0;}
     | expr EQ expr {if($1 == $3) $$ = 1 ;else $$ = 0;}
     | '!' expr {if($2==0) $$ = 1; else $$ = 0;}
     | expr AND expr {if($1*$3) $$ = 1; else $$ = 0;}
     | expr OR expr {if($1+$3) $$ = 1; else $$ = 0;}
     | expr LT expr {if($1 < $3) $$=1; else $$ = 0;}
     | expr GT expr {if($1 > $3) $$=1; else $$ = 0;}
     ;
%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
return 0;
}
int main(void) {
yyparse();
return 0;
}
