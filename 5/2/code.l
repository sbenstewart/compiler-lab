keyword "switch"
openpar "("
closepar ")"
openbrace "{"
closebrace "}"
semicolon ";"
deli [ \t\n]
letter [a-zA-Z]
digit [0-9]
identifier {letter}{letter|digit}*
%%
{keyword}.*{closebrace} {
int i=0;
while(yytext[i]!='('){i++;}
i++;
int expr=i;
while(yytext[i]!='c'){i++;}
int temp=0;
do{
i+=5;
if(temp==0)
printf("if(");
else
printf("else if(");
temp=expr;
while(yytext[temp]!=')'){printf("%c",yytext[temp]);temp++;}
printf("==");
while(yytext[i]!=':'){printf("%c",yytext[i]);i++;};
printf(")");
printf("{");
i++;
while(yytext[i]!='c'&&yytext[i]!='d'){printf("%c",yytext[i]);i++;};
printf("}");
}while(yytext[i]!='d');
printf("else{");
i+=8;
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
