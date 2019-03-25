%{
char ini[100000]="";
char incre[100000]="";
char cond[100000] = "";
char var[1000000] = "";
char ini1[100000] = "",incre1[100000] = "",cond1[100000] = "";
int z=0;
%}
%option noyywrap
alp [a-z]
braces [{]
rel [<|<=|>=|>]
equ [=]
su [+|-|*|/]
digit [0-9]+
%%
"for("{alp}{equ}{digit}";"{alp}{rel}{digit}";"{alp}{su}{su}"){" {
		if(z==0){
		z=1;int i=0,k=0;
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
		else
		{
		int i=0,k=0;
		for(i=4;i<yyleng;i++)
		{
			if(yytext[i] == ';')
				break;
			ini1[k++] = yytext[i];
		}
		i++;
		k=0;
		for(;i<yyleng;i++)
		{
			if(yytext[i] == ';')
				break;
			cond1[k++] = yytext[i];	
		}
		//cond[k] = "\0";
		i++;
		k=0;
		for(;i<yyleng;i++)
		{
			if(yytext[i] == ')')
				break;
			incre1[k++] = yytext[i];
		}
		k=0,i=0;
	
		}
	}
"}"(.|\n)*"}" {
		int i=0;
		for(i=1;i<yyleng-1;i++)
			var[i-1] = yytext[i];
	}
.* {}	
%%
int main()
{
	yylex();
	//printf("sss%s\n\n",yytext);
	printf("for(%s,%s;%s && %s;%s,%s){%s}\n",ini,ini1,cond,cond1,incre,incre1,var);
	return 0;
}
