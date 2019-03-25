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
while(yytext[i]!=';'){i++;}
int cond=i+1;
while(yytext[i]!=';'){i++;}
int inc=i+1;
printf(";\n do{");
while(yytext[i]!='{')i++;
i++;
while(yytext[i]!='}'){printf("%c",yytext[i]);i++;}
int j=cond;
for(;yytext[j]!=')';j++){printf("%c",yytext[j]);}
printf(";\n");
printf("}while\(");
j=cond;
for(;yytext[j]!=';';j++)
{printf("%c",yytext[j]);}
printf("\)");
}
. ;
%%
int main()
{
yylex();
return 0;
}
