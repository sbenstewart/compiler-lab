%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
int sym[26];
int i;
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
statement :
expr '=' expr {sym[$1]=$3;char temp=$1+'a';printf("%c=t%d\n",temp,i-1);}
;


expr: 
INTEGER {int temp = $$;printf("t%d=%d\n",i,temp);i++;}
|expr '+' expr {printf("t%d = t%d + t%d\n",i,i-2,i-1);i++;}
|VAR {$$ = sym[$1];char t = $1 + 'a';printf("t%d=%c\n",i,t);i++;}
| VAR '[' INTEGER ']'  {int temp = $3;printf("t%d=%d*8\n",i,temp);temp+=8;char t = $1 + 'a';printf("t%d=%c[t%d]\n",i+1,t,i);i+=2;}
| VAR '[' VAR ']'  {char temp = $3+ 'a';printf("t%d=%c*8\n",i,temp);char t = $1 + 'a';printf("t%d=%c[t%d]\n",i+1,t,i);i+=2;}
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
