%{
#include<string.h>
char fnname[100],str[100],fn[100],attr[100],str1[100];
%}
digit[0-9]
letter[A-Za-z]
digits [0-9][0-9]*
assign [=]

%%

[ ]{letter}({letter}|{digit})*[(].*[)] {strcpy(str,yytext);
int i=1;
int j=0;
int flag=0;
printf("hello world");
while(str[i]!='(')
{
fnname[j]=str[i];
printf("%c",fnname[j]);
i++;
j++;
}
j=0;

while(str[i]!=')')
{
if(str[i]==' ')
{flag=1;
continue;
}
if(flag==1)
{
while(str[i]!=',')
{
flag=0;
attr[j]=str[i];j++;
i++;
}
}
i++;
attr[j++]=',';
}
} 

"return"[ ]{letter}({letter}|{digit})*[ ][-|+|*|/][ ]{letter}({letter}|{digit})*[;] {
printf("Here");
strcpy(str1,yytext);
int i=0;
int j=0;
while(str1[i]!='\0')
fn[j]=str1[i];
}

. {}

%%
int main()
{
yyin=fopen("file4.txt","r");
yylex();
printf("#define %s(%s) %s",fnname,attr,fn );
}

