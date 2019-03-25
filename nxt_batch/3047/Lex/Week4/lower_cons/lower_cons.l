%option noyywrap
%%
[bcdfghjklmnpqrstvwxyz]+ printf("%s matched\n",yytext);
.* printf("%s not matched",yytext);
%%
int main()
{
	yylex();
	return 0;
} 
