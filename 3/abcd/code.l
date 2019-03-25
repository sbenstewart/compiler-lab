letter [a-zA-Z]
digit [0-9]
space [ \t\n]
dot [.]
%{
int constant,identifier,assignment,operator,delimiter;
%}
%%
"int"|"void"|"printf"|"if"|"%d" {printf("Keyword");}
{space} {delimiter++;printf("%s is Delimiter\n",yytext);}
{digit}*({dot}{digit}*)? {constant++;printf("%s is Constant/Number\n",yytext);}
{letter}({letter}|{digit})* {identifier++;printf("%s is Indentifier\n",yytext);}
":=" {assignment++;printf("%s is Assignment\n",yytext);}
"+"|"-"|"*"|"/" {operator++;printf("%s is Operator\n",yytext);}

%%
int main()
{
yylex();
printf("Number of constants=%d\n",constant);
printf("Number of identifiers=%d\n",identifier);
printf("Number of assignments=%d\n",assignment);
printf("Number of operators=%d\n",operator);
printf("Number of delimiters=%d\n",delimiter);
}
