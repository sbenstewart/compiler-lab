keyword "for"
openpar "("
closepar ")"
openbrace "{"
closebrace "}"
semicolon ";"
deli [ \t\n]
%%
{keyword}.*{closebrace} {
int i=0;
while(yytext[i]!='('){i++;}
i++;
while(yytext[i]!=';'){printf("%c",yytext[i]);i++;}
printf(";\n");
int cond=i+1;
i++;
while(yytext[i]!=';'){i++;}
int inc=i+1;
printf("do{");
while(yytext[i]!='{')i++;
i++;
while(yytext[i]!='}'){printf("%c",yytext[i]);i++;}
int j=inc;
for(;yytext[j]!=')';j++){printf("%c",yytext[j]);}
printf(";\n");
printf("}while\(");
j=cond;
for(;yytext[j]!=';';j++)
{printf("%c",yytext[j]);}
printf("\);");
}
. ;
%%
int main()
{
yylex();
return 0;
}
