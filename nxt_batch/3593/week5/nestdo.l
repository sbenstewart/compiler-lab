%{
#include<string.h>
char ini[100],stat[100],condt[100],incre[100];
char ini1[100],condt1[100],incre1[100];
char str[100],str1[100];
int z=0,k=0,l=0;
int o=0;
%}	
digit[0-9]
letter[A-Za-z]
digits [0-9][0-9]*
assign [=]

%%

"do" {}
"while" {}

[(].*[)] {if(z==0){z=1;strcpy(condt,yytext);}
else strcpy(condt1,yytext);
}
{letter}({letter}|{digit})*[ ]=[ ]{digits}  {
if(k==0){k=1;
strcpy(ini,yytext);}else {strcpy(ini1,yytext);}}
{letter}({letter}|{digit})*[ ]=[ ]{letter}({letter}|{digit})*[ ][+][ ]{digits} {if(l==0) {l=1;strcpy(incre1,yytext);} else
{strcpy(incre,yytext);} }
[;] 
[{]
[}]

. {stat[o++]=yytext[0];}
%%
int main()
{
yyin=fopen("file6.txt","r");
yylex();
printf("for(%s;%s;%s) \n { \n for(%s;%s;%s) \n %s; }",ini,condt,incre,ini1,condt1,incre1,stat);
}
