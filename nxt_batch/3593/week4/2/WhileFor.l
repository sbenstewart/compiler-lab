%{
#include<string.h>
char a[100],b[100],c[100];

%}


digit[0-9]
letter[A-Za-z]
digits [0-9][0-9]*
assign [=]

%%
"while" {printf("Found while loop \n");}
[(].*[)] {strcpy(b,yytext);b[0]=' ';b[yyleng-1]='\0';}
{letter}({letter}|{digit})*[ ]=[ ]{digits}  {printf("Assigning values \n");strcpy(a,yytext);}
{letter}({letter}|{digit})*[ ]=[ ]{letter}({letter}|{digit})*[ ][+][ ]{digits} {printf("incrementing values \n");strcpy(c,yytext);}
.  

%%


int main()
{
yyin=fopen("file.txt","r");

yylex();
printf("for(%s;%s;%s) ",a,b,c);
return 0;

}
