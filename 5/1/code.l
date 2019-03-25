keyword "while"
openpar "("
closepar ")"
openbrace "{"
closebrace "}"
semicolon ";"
deli [ \t\n]
%%
.*{semicolon}{keyword}.*{closebrace} {
printf("for(");
int i=0;
while(yytext[i]!=';'){printf("%c",yytext[i]);i++;}
printf(";");
while(yytext[i]!='('){i++;}
i++;
while(yytext[i]!=')'){printf("%c",yytext[i]);i++;}
i++;
printf(";)\n");
while(yytext[i]!='{'){i++;}
while(yytext[i]!='}'){printf("%c",yytext[i]);i++;}
printf("}");
}
. ;
%%
int main()
{
yylex();
return 0;
}
