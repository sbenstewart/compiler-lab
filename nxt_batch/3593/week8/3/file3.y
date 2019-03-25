%token INTEGER VARIABLE 
%left '+' '-'
%left '*' '/'
%right UMINUS
%{
#include<stdio.h>
void yyerror(char *);
int yylex(void);
int sym[26];
int postflag=0;
int preflag=0;
int inflag=0;
%}
%%

program:
       program statement '\n'
       |
       ;
statement:
       expr                     { }
       | VARIABLE '=' expr      { sym[$1] = $3; }
       ;
expr:
       INTEGER
       | VARIABLE               { $$ = sym[$1]; }
       | '+' expr expr          { if(preflag==0){printf("PREFIX \n");} preflag=1;}
       | '-' expr expr          { if(preflag==0){printf("PREFIX \n");} preflag=1;}
       | '/' expr expr          { if(preflag==0){printf("PREFIX \n");} preflag=1;}  
       | '*' expr expr          { if(preflag==0){printf("PREFIX \n");} preflag=1;} 
       | expr '+' expr          { if(inflag==0){printf("INFIX \n");} inflag=1;}
       | expr '-' expr          { if(inflag==0){printf("INFIX \n");} inflag=1;}
       | expr '*' expr          { if(inflag==0){printf("INFIX \n");} inflag=1;}
       | expr '/' expr          { if(inflag==0){printf("INFIX \n");} inflag=1;}
       | expr expr '+'          { if(postflag==0){printf("POSTFIX \n");} postflag=1;}
       | expr expr '*'          { if(postflag==0){printf("POSTFIX \n");} postflag=1;}
       | expr expr '/'          { if(postflag==0){printf("POSTFIX \n");} postflag=1;}
       | expr expr '-'          { if(postflag==0){printf("POSTFIX \n");} postflag=1;}
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

