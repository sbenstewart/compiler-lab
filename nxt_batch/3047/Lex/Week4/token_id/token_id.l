%{
int var=0;
int rel=0;
int pre=0;
int post=0;
int add=0;
%}
alp [a-z]
spl [+]
rel [=]
%%
{alp} {var++;printf("%s is an id",yytext);}
{rel} {rel++;}
{alp}"++" {post++;var++;}
"++"{alp} {pre++;var++;}
{spl} {add++;}
%%
int main()
{
	yylex();
	printf("%d var\n %d rel\n %d postfix\n %d prefix\n %d add\n",var,rel,post,pre,add);
	return 0;
}
