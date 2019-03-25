%token INTEGER VARIABLE
%left '+' '-'
%left '*' '/'
%right UMINUS

%{
void yyerror(char *);
int yylex(void);
int sym[26];
int reg[3];
void aloc(char);
void opaloc(char,char,char);
#include<stdio.h>
%}

%%
program:
	program statement '\n'
	|
	;
statement:
	expr			{  }
	;
expr:
	INTEGER		{char x=$1;aloc(x);}
	| expr '+' expr		{opaloc($1,'+',$3);}

	| expr '-' expr		{opaloc($1,'-',$3);}
	| expr '*' expr		{opaloc($1,'*',$3);}
	| expr '/' expr		{opaloc($1,'/',$3);}
	| '(' expr ')'		{ $$ = $2; }
	| '-' expr %prec UMINUS	{$$ = -$2;}
	;

%%
void opaloc(char a,char b,char c){
	int i=0,j;
	for(i=0;i<3;i++){
		if((reg[i]==a)||(reg[i]==c)){
			for(j=i+1;j<3;j++){
				if((reg[j]==a)||(reg[j]==c)){
				if(b=='*')
				printf("MUL R%d,R%d,R%d\n",i,i,j);
				if(b=='+')
				printf("ADD R%d,R%d,R%d\n",i,i,j);
				reg[j]='z';
				break; 
			}
			}
		}
	}}
void aloc(char var){
	int i=0;
	for(i=0;i<3;i++){
		if(reg[i]=='z'){
			printf("LD R%d,%c\n",i,var);
			reg[i]=var;
break;
	}}
}
void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);

}
int main(void) {
int i=0;
for(i=0;i<3;i++)
reg[i]='z';
	yyparse();
	return 0;
}
