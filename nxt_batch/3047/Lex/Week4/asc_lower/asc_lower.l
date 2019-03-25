%{
int i,j,k=0;
%}
%option noyywrap
lower [a-z]
%%
{lower}+ {
		for(i=0;i<yyleng-1;i++)
		{
			if(yytext[i] - 97 > yytext[i+1] -97)
				k =1;
		}
		if(k == 0)
			printf("%s matched\n",yytext);
		else
		{
			printf("%s not matched\n",yytext);
			k = 0;
		}
	}
