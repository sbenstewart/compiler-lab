%{
	#include <stdio.h>
	#include <ctype.h>
	#define YYSTYPE int
	int yylex(void);
	int sym[26];
	int flag=0;
%}

%token INTEGER VAR
%left '+''-'
%left '*''/'
%right UMINUS
%%
program: program statement '\n' 
        | program '\n'
	| /* empty */
        ;
statement : 
	expr1 {printf("Postfix\n");printf("%d\n",$1);}
	|expr2 {printf("Infix\n");printf("%d\n",$1);}
	|expr3 {printf("Prefix\n");printf("%d\n",$1);}
	| VAR '=' expr1 {sym[$1]=$3;} 
	| VAR '=' expr2 {sym[$1]=$3;} 
	| VAR '=' expr3 {sym[$1]=$3;} ;
	;
expr1: INTEGER 
	|VAR {$$ = sym[$1];}
	| expr1 expr1 '+'{$$ = $1 + $2;}
	| expr1 expr1 '-'{$$ = $1 - $2;}
	| expr1 expr1 '*'{$$ = $1 * $2;}
	| '(' expr1 ')' {$$ = $2; } 
	|expr1 expr1 '/'{$$ = $1/$2;}
	;
expr2: INTEGER 
	|VAR {$$ = sym[$1];}
	| expr2 '+' expr2{$$ = $1 + $3;}
	| expr2 '-' expr2 {$$ = $1 - $3;}
	| expr2 '*' expr2 {$$ = $1 * $3;}
	| '(' expr2 ')' {$$ = $2; } 
	|expr2 '/' expr2 {$$ = $1/$3;}
	;
expr3: INTEGER 
	|VAR {$$ = sym[$1];}
	| '+' expr3 expr3{$$ = $3 + $2;}
	| '-' expr3 expr3 {$$ = $2 - $3;}
	| '*' expr3 expr3 {$$ = $3 * $2;}
	| '(' expr3 ')' {$$ = $2; } 
	| '/' expr3 expr3 {$$ = $2/$3;}
	;
%%
yylex()
{
	int c;
	while((c=getchar())==' ');
	if(c=='.'||(isdigit(c)))
	{
		ungetc(c,stdin);
		scanf("%d",&yylval);
		return INTEGER;
	}
	if(isalpha(c))
	{
		ungetc(c,stdin);
		scanf("%c",&yylval);
		return VAR;
	}

	return c;
}





