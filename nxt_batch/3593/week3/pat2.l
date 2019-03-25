%%
[a-z] {printf("\n %s",yytext);
printf("\n Low case found mod");
yymore();
}

[A-Z] {
printf("\n %s",yytext);
printf("\n entering upper case mode");
yymore();

printf("\n End Text %s",yytext); 

}

%%
int main(void)
{

yylex();
return 0;
}
