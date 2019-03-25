%{
#include<string.h>
char ini[100],stat[100],condt[100],incre[100];
char str[100];
%}
%%
 
[{](.|\n)*[}] {strcpy(stat,yytext);stat[yyleng-1]='\0';}
"for"[ ] {}
[(].*[)] {
strcpy(str,yytext);
int i=1,j=0;
while(str[i]!=';')
{
ini[j]=str[i];
i++;j++;
}
i=i+1;
j=0;
while(str[i]!=';')
{
condt[j]=str[i];
i++;
j++;
}
i=i+1;
j=0;
while(str[i]!=')')
{
incre[j]=str[i];
i++;
j++;
}
incre[j]=';';
incre[j+1]='}';
}
  
. 

%%
int main()
{
yyin=fopen("file1.txt","r");

yylex();
printf("%s; \ndo%s\n%s while(%s);",ini,stat,incre,condt);
return 0;

}
