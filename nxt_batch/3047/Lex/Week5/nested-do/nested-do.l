%{
char cond1[10],cond2[10];
char stat1[30],stat2[30],var1[30],var2[30];
char d[1]="d";
int z,l;
%}
alp [a-z]
rel [=]
digit [0-9]+
%%
"int "{alp}{rel}{digit} {
		if(l==0)
		{
			l=1;int i=0,k=0;
			for(i=4;i<yyleng;i++)
				var1[k++] = yytext[i];
		}		
		else
		{
			int i=0,k=0;
			for(i=4;i<yyleng;i++)
				var2[k++] = yytext[i];
		}
	}
		
while[(].*[)] {if(z==0){
			z=1;
			int i,j;
			for(i=6,j=0;i<yyleng-1;i++,j++)
				cond1[j]=yytext[i];
		}else{
			int k,l;
			for(k=6,l=0;k<yyleng-1;k++,l++)
				cond2[l]=yytext[k];
		}
}
"do"(.|\n)*"do" {int i,j;
	for(i=3,j=0;i<yyleng;i++,j++){
		if(yytext[i]==d[0]){break;}
		stat1[j]=yytext[i];
	}
}
[ ]"{"(.|\n)*"}"[ ] {
	int i,j;
	for(i=2,j=0;i<yyleng-2;i++,j++){
		stat2[j]=yytext[i];
	}
}
. 
%%
int main(){
	yylex();
	printf("for(%s;%s;){\n%s",var1,cond2,stat1);
	printf("for(%s;%s;){\n%s\n}\n}",var2,cond1,stat2);
	return 0;
}
