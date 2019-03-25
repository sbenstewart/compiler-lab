%%
[a-z]*[ \t\n] { yytext[0]=yytext[0]-32; printf("%s",yytext);}
%%
int main(void)
{

yylex();
return 0;
}
