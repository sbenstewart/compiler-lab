%{
int j=0,k=0,l=0;
#include<string.h>
char ini[1000],stat[1000],condt[1000],incre[100][100];
char str[1000];
int flag=0,n=0;
%}
%%
"for" {}

[(].*[)] {
strcpy(str,yytext);
int i=1;
while(str[i]!=';')
{
ini[j]=str[i];
i++;j++;
}
i=i+1;
printf("%s; \n",ini);
j=0;
while(ini[j]!='\0')
{ini[j]='\0';j++;}
j=0;
printf("if(");
while(str[i]!=';')
{
condt[k]=str[i];
i++;
k++;
}
printf("%s)",condt); 
i=i+1;
k=0;
while(condt[k]!='\0')
{condt[k]='\0';k++;}
k=0;
while(str[i]!=')')
{
incre[n][l]=str[i];
i++;
l++;
}
n++;
l=0;
}
  
[}] {
if(flag==0){printf("\n%s;\n}",incre[1]);flag=1;}
else {
printf("\n%s;\n}",incre[0]);}
}

%%
int main()
{
yyin=fopen("file1.txt","r");

yylex();
return 0;

}
