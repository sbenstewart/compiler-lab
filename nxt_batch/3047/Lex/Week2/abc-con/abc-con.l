%option noyywrap
%%
^(abc)+$ printf("%s",yytext);
.* printf("%s not matched",yytext);
%%
int main()
{
	yylex();
	return 0;
}
