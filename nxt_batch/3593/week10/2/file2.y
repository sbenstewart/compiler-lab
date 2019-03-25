%{
#include<stdio.h>
int yylex(void);
#include<ctype.h>
#include<stdio.h>
int sym[26];
#define YYSTYPE char *
int flag=0;
%}

%token IF ELSE THEN EXPR STMT OB CB

%%
program: program statement '\n' 
        | program '\n'
	| /* empty */
        ;
statement : IF OB statement1 CB {printf("valid");}
	  ;
statement1 : IF OB statement2 CB ELSE OB statement2 CB{printf("valid");}
| statement2;
statement2 : STMT
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
