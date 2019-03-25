%{
char c[100];

%}

%%
[a-z] {printf("\n %s",yytext);
printf("\n Low case found mod");
yymore();
}

[A-Z] {
printf("\n %s",yytext);
printf("\n entering upper case mode");
yymore();
strcpy(c,yytext);
printf("\n End Text %s",yytext);
}

%%
int main(void)
{
yylex();
printf("Final loaded : %s",c);
return 0;
}
