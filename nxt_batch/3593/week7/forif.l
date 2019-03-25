%{
int j=0,k=0,l=0;
#include<string.h>
char ini[1000],stat[1000],condt[1000],incre[1000];
char str[1000];
int o=0;
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
incre[l]=str[i];
i++;
l++;
}
l=0;
printf("\n{\n%s;",incre);
while(incre[l]!='\0')
{incre[l]='\0';l++;}
l=0;
}
  
[{] 

%%
int main()
{
yyin=fopen("file1.txt","r");

yylex();
return 0;

}
