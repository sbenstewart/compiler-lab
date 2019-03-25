%{
#include<stdio.h>
int yylex(void);
int flag=0;
void yyerror(char* s);
%}
%token INTEGER WHIL OP CL  OB CB CM  COND IC
%%
program: program statement'\n' 
        | program '\n'
	| /* empty */
        ;
statement: expr{if(flag==1)printf("Valid");else printf("Invalid");}

expr:
 WHIL OP COND CL OB CB      { flag=1;} |
 WHIL OP COND CL OB IC CB   {flag=1; } |
 WHIL OP COND CL OB statement CB  { } |
 WHIL OP COND CL OB IC statement CB{flag=1; }|
 WHIL OP COND CL OB statement IC CB {flag=1;}
         ;

%%
void yyerror(char* s)
{
printf("%s",s);
}
int main()
{
yyparse();
return 0;
}
