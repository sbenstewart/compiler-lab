%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
int sym[26];
%}

%token INTEGER VAR IF ELSE WHILE SWITCH CASE DEFAULT BREAK
%left '+''-'
%left '*''/'
%left '('')'
%right UMINUS
%%

program: program statement '\n' {printf("Valid\n");}
|
;

statements:
statement statements
|
;

statement :
while
|switch
|if 
|expr 
| VAR '=' expr {sym[$1]=$3;} 
;

switch:
SWITCH '(' expr ')' '{' casebody '}'
|
;

casebody:
CASE expr ':' '{' statements BREAK '}' casebody
|DEFAULT ':' '{' statements '}'
|
;

while:
WHILE expr '{' statement '}' 
|
;

if:
IF expr '{' statement '}'
|IF expr '{' statement '}' ELSE '{' statement '}' 
|
; 

expr: 
INTEGER 
|VAR {$$ = sym[$1];}
| expr '<' expr {$$ = $1 < $3; }
| expr '>' expr {$$ = $1 > $3; }
| expr '&' '&' expr {$$ = $1 && $3; }
| expr '|' '|' expr {$$ = $1 || $3; }
| '!' expr {$$ = ! $2; }
| expr '<' '=' expr {$$ = $1 <= $3; }
| expr '>' '=' expr {$$ = $1 >= $3; }
| expr '!' '=' expr {$$ = $1 != $3; } 
| '(' expr ')' {$$ = $2; } 
;

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
