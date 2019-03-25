%option noyywrap
add [+]
sub [-]
%%
{add} printf("v");
{sub} printf("^");
%%
int main()
{
	yylex();
	return 0;
}
