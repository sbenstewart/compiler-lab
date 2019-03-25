%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
int sym[26];
int row=200;
%}

%token INTEGER VAR IF ELSE WHILE
%left '+''-'
%left '*''/'
%left '('')'
%right UMINUS IF
%%

program: program statement '\n' 
|
;
statement :
while 
|if 
|expr 
| VAR '=' expr {sym[$1]=$3;} 
;

while:
WHILE expr '{' statement '}' 
|
;

if:
IF expr '{' statement '}' {printf("%d: IF GO TO TRUE\nFALSE BLOCK\nTRUE BLOCK\n",row);row++;}
|IF expr '{' statement '}' ELSE '{' statement '}' 
; 

expr: 
INTEGER 
|VAR {$$ = sym[$1];}
| expr '<' expr {$$ = $1 < $3;printf("<");if(!($1<$3)){printf("IF GO TO TRUE\n");}else{printf("GO TO FALSE\n");} }
| expr '>' expr {$$ = $1 > $3;printf(">");if(!($1>$3)){printf("GO TO TRUE\n");}else{printf("GO TO FALSE\n");} }
| expr '&' '&' expr {$$ = $1 && $3;printf("&&");if(!($1 && $3)){printf("GO TO TRUE\n");}else{printf("GO TO FALSE\n");} }
| expr '|' '|' expr {$$ = $1 || $3; printf("||");if(($1 || $3)){printf("GO TO TRUE\n");}else{printf("GO TO FALSE\n");}}
| '!' expr {$$ = ! $2; printf("!");if($2){printf("GO TO TRUE\n");}else{printf("GO TO FALSE\n");}}
| expr '<' '=' expr {$$ = $1 <= $3; printf("<=");if(!($1<=$3)){printf("GO TO TRUE\n");}else{printf("GO TO FALSE\n");}}
| expr '>' '=' expr {$$ = $1 >= $3; printf(">=");if(!($1>=$3)){printf("GO TO TRUE\n");}else{printf("GO TO FALSE\n");}}
| expr '!' '=' expr {$$ = $1 != $3; printf("!=");if(!($1!=$3)){printf("GO TO TRUE\n");}else{printf("GO TO FALSE\n");}} 
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
