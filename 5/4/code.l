keyword "if"
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
{keyword}.*{openbrace}.*{keyword}.* {
int i=0;
printf("if(");
while(yytext[i]!='('){i++;}
i++;
int cnd1=i;
while(yytext[i]!=')'){printf("%c",yytext[i]);i++;}
i++;
printf("&&");
while(yytext[i]!='('){i++;}
i++;
int cnd2=i;
while(yytext[i]!=')'){printf("%c",yytext[i]);i++;}
i++;
printf(")");
while(yytext[i]!='e'){printf("%c",yytext[i]);i++;}
printf("else if(");
int temp=cnd1;
while(yytext[temp]!=')'){printf("%c",yytext[temp]);temp++;}
printf("&&!(");
temp=cnd2;
while(yytext[temp]!=')'){printf("%c",yytext[temp]);temp++;}
printf("))");
i+=5;
while(yytext[i]!='e'){if(yytext[i]=='}'){i++;}else{printf("%c",yytext[i]);i++;}}
printf("else");
i+=5;
while(yytext[i]!='e' && i<yyleng){if(yytext[i]=='}'){i++;}else{printf("%c",yytext[i]);i++;}}
}
. ;
%%
int main()
{
yylex();
return 0;
}
