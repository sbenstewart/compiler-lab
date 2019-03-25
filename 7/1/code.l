%%
"if".* {
printf("for(;");
int i=0;
while(yytext[i]!='('){i++;}
i++;
while(yytext[i]!=')'){printf("%c",yytext[i]);i++;}i++;
printf(";)\n");
while(yytext[i]!='}'){printf("%c",yytext[i]);i++;}
printf("goto L;");
printf("%c",yytext[i]);
i++;

printf("\nfor(;");
while(yytext[i]!='('){i++;}
i++;
while(yytext[i]!=')'){printf("%c",yytext[i]);i++;}i++;
printf(";)\n");
while(yytext[i]!='}'){printf("%c",yytext[i]);i++;}
printf("goto L;");
printf("%c",yytext[i]);
i++;

printf("\nfor(");
printf(";;)\n");
while(yytext[i]!='{'){i++;}
while(yytext[i]!='}'){printf("%c",yytext[i]);i++;}
printf("goto L;");
printf("%c\n",yytext[i]);
i++;

printf("L :");
} 
. ECHO;
%%
int main()
{
yylex();
return 0;
}
