deli [ \t\n];
letter [A-Za-z];
digit [0-9]
%%
"#DEFINE".* {
printf("returntype ");
int i=0;
while(yytext[i]!=' '){i++;}i++;
while(yytext[i]!=' '){printf("%c",yytext[i]);i++;}i++;
printf("\{\nreturn ");
while(i<yyleng){printf("%c",yytext[i]);i++;}
printf(";\n\}");
}
%%
int main()
{
yylex();
return 0;
}
