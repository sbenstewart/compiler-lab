%option noyywrap
%%
(a|b)*bb+(a|b)* printf("%s matched\n",yytext);
.* printf("not matched\n");
%%
int main()
{
	yylex();
	return 0;
}
