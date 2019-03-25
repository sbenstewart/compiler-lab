%%
"for".* {
int i=0;
while(yytext[i]!='('){i++;}i++;
while(yytext[i]!=';'){printf("%c",yytext[i]);i++;}i++;
printf(";\nwhile\(");
while(yytext[i]!=';'){printf("%c",yytext[i]);i++;}
printf("\)\n{\n");
i++;
int inc1=i;

while(yytext[i]!='('){i++;}i++;
while(yytext[i]!=';'){printf("%c",yytext[i]);i++;}i++;
printf(";\nwhile\(");
while(yytext[i]!=';'){printf("%c",yytext[i]);i++;}
printf("\)\n");
i++;
int inc2=i;
while(yytext[i]!='{'){i++;}
while(yytext[i]!='}'){printf("%c",yytext[i]);i++;}
i++;
int temp=inc2;
while(yytext[temp]!=')'){printf("%c",yytext[temp]);temp++;}
printf(";}\n");


while(yytext[i]!='}'){printf("%c",yytext[i]);i++;}

temp=inc1;
while(yytext[temp]!=')'){printf("%c",yytext[temp]);temp++;}
printf(";}\n");

}
%%
int main()
{
yylex();
return 0;
}
