%{
int i,j,k=0;
%}
%option noyywrap
digit [0-9] 
%%
{digit}+ {
	for(i=0;i<yyleng;i++)
	{
		for(j=i+1;j<yyleng;j++)
		{
			if(yytext[i] == yytext[j])
				k=1;
		}
	}
	if(k == 0)
		printf("%s matched",yytext);
	else
	{
		printf("%s not matched",yytext);
		k = 0;
	}
	}			
%%
int main()
{
	yylex();
	return 0;
}
