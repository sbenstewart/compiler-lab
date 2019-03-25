%option noyywrap
%%
[^aeiou] printf("%s",yytext);
[aeiou] printf("no\n");
%%
int main()
{
	yylex();
	return 0;
}
