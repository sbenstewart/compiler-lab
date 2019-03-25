%{
int j=0,k=0,l=0;
#include<string.h>
char ini[1000],stat[1000],condt[1000],incre[1000];
char str[1000];
int o=0;
%}
%%
"for"[ ] {}

[(].*[)] {
strcpy(str,yytext);
int i=1;
while(str[i]!=';')
{
ini[j]=str[i];
i++;j++;
}
i=i+1;
ini[j]=',';
j++;
while(str[i]!=';')
{
condt[k]=str[i];
i++;
k++;
}
condt[k]='|';
k++;
condt[k]='|';
k++; 
i=i+1;
while(str[i]!=')')
{
incre[l]=str[i];
i++;
l++;
}
incre[l]=',';
l++;
}
  
. {stat[o++]=yytext[0];}
%%
int main()
{
yyin=fopen("file5.txt","r");

yylex();
printf("for(%s;%s;%s)\n{\n%s}",ini,condt,incre,stat);
return 0;

}
