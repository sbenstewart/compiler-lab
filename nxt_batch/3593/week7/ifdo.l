%{
int j=0,k=0,l=0;
#include<string.h>
char ini[1000],stat[1000],condt[100][100],incre[100];
char str[1000];
int flag=0,n=0;
%}
%%
"if" {printf("do \n ");}

[(].*[)] {
strcpy(str,yytext);
int i=1;
l=0;
while(str[i]!=')')
{
condt[n][l]=str[i];
i++;
l++;
}
n++;
}
  
[}] {
if(flag==0){printf("}while(%s);\n",condt[1]);flag=1;}
else {
printf("}while(%s);\n",condt[0]);}
}

%%
int main()
{
yyin=fopen("file2.txt","r");
int i;

yylex();

return 0;

}
