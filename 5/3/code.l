keyword "for"
openpar "("
closepar ")"
openbrace "{"
closebrace "}"
semicolon ";"
deli [ \t\n]
letter [a-zA-Z]
digit [0-9]
identifier {letter}{letter|digit}*
%%
{keyword}.*{keyword}.*{closebrace} {
int i=0;
while(yytext[i]!='('){i++;}
i++;
while(yytext[i]!=';'){printf("%c",yytext[i]);i++;}
i++;
int cnd1=i;
while(yytext[i]!=';'){i++;}
int inc1=++i;
while(yytext[i]!='{'){i++;}i++;
printf(";\ndo {\n");
while(yytext[i]!='('){i++;}
i++;
while(yytext[i]!=';'){printf("%c",yytext[i]);i++;}
i++;
int cnd2=i;
while(yytext[i]!=';'){i++;}
int inc2=++i;
printf(";\ndo ");
while(yytext[i]!='{'){i++;}
while(yytext[i]!='}'){printf("%c",yytext[i]);i++;}
int temp=inc2;
while(yytext[temp]!=')'){printf("%c",yytext[temp]);temp++;}
printf("}\nwhile\(");
temp=cnd2;
while(yytext[temp]!=';'){printf("%c",yytext[temp]);temp++;}
printf("\);\n");
i++;
while(yytext[i]!='}'){printf("%c",yytext[i]);i++;}
temp=inc1;
while(yytext[temp]!=')'){printf("%c",yytext[temp]);temp++;}
printf("}\nwhile\(");
temp=cnd1;
while(yytext[temp]!=';'){printf("%c",yytext[temp]);temp++;}
printf("\);");

}
. ;
%%
int main()
{
yylex();
return 0;
}
