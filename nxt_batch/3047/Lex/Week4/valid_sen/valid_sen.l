%option noyywrap
del [^ \n\t]
ans [.|?|!]
%%
{del}*{ans} printf("Valid Sentence\n");
. {}
%%
int main()
{
	yylex();
	return 0;
}
