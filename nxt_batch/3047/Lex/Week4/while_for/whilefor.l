%{
char ini[100000]="";
char incre[100000]="";
%}
%option noyywrap
alp [a-z]
rel [<|<=|>=|>]
equ [=]
su [+|-|*|/]
digit [0-9]+
%%
{alp}{equ}{digit} {
	int i=0;
	for(i=0;i<yyleng;i++)
		ini[i] = yytext[i];
	}
"while("{alp}{rel}{digit}+"){" {
	int i=0,j=0;
	char s[10000];
	for(i=6;i<yyleng-2;i++)
		s[j++] = yytext[i];
	s[j] = '\0';
	printf("for(%s;%s;%s){ \n",ini,s,incre);}
{alp}{equ}{alp}{rel}{digit} {
	int i=0;
	for(i=0;i<yyleng;i++)
		incre[i] = yytext[i];
	}
. {printf("%s",yytext);}
%%
int main()
{
	yylex();
	return 0;
}
