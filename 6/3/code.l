
%%
"V" {printf("+");}
"^" {printf("-");}
. ECHO;
%%
int main()
{
yylex();
return 0;
}
