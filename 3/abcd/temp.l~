letter [A-Za-z]
digit [0-9]
space [ \t\n]
dot [.]
%{
int constant,identifier,assignment,operator,delimiter;
char *temp;
%}
%%
"int"|"void"|"printf"|"if"|"%d"|"\n" {}
{digit}*({dot}{digit}*)? {constant++;yymore();printf("%s is Constant/Number\n",yytext);}
.
%%
int main()
{
yylex();
printf("Number of constants=%d\n",constant);
}
