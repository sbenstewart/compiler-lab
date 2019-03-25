%option noyywrap
%%
[+-]?[0-9]+ printf("%s",yytext);
.* printf("%s not matched",yytext);
%%
int main()
{
	yylex();
	return 0;
}
