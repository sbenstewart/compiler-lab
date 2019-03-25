%{
char ini[100000]="";
char incre[100000]="";
char cond[100000] = "";
char var[1000000] = "";
%}
%option noyywrap
alp [a-z]
rel [<|<=|>=|>]
equ [=]
su [+|-|*|/]
digit [0-9]+
%%
"for("{alp}{equ}{digit}";"{alp}{rel}{digit}";"{alp}{su}{su}")" {
		int i=0,k=0;
		for(i=4;i<yyleng;i++)
		{
			if(yytext[i] == ';')
				break;
			ini[k++] = yytext[i];
		}
		i++;
		k=0;
		for(;i<yyleng;i++)
		{
			if(yytext[i] == ';')
				break;
			cond[k++] = yytext[i];	
		}
		//cond[k] = "\0";
		i++;
		k=0;
		for(;i<yyleng;i++)
		{
			if(yytext[i] == ')')
				break;
			incre[k++] = yytext[i];
		}
		k=0,i=0;
	}
"{"(.|\n)*"}" {
	int i=0;
	for(i=1;i<yyleng-1;i++)
	{
		var[i-1] = yytext[i];
	} 
	}

	
%%
int main()
{
	yylex();
	//printf("sss%s\n\n",yytext);
	printf("int %s\ndo{\n%s%s;\n}while(%s);\n",ini,var,incre,cond);
	return 0;
}
