%%
[.]* {printf("%s",yyparse());};
%%
int main()
{
yyin=fopen("file3.txt","r");
yylex();
return 0;
}

