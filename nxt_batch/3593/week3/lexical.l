
%{
int niden,nassign,noper,nwhite,nconst;
%}
digit[0-9]
letter[A-Za-z]
digits [0-9][0-9]*
%%

[+\-/*] {noper++;printf("operator : %s\n",yytext);}
[ \t\n]+ {nwhite++;}
{digits} {nconst++; printf("Constants : %s\n",yytext);}
[=] {nassign++;printf("assign : %s\n",yytext);}
{letter}({letter}|{digit})* {niden++;printf("identifier : %s\n",yytext);}
{digit}+({letter}|{digit})* {niden--;}



%%
int main(void)
{
yyin=fopen("file.txt","r");
yylex();
printf("\n Ws: %d \n Operator: %d \n Assignment: %d \n identifier: %d \n  Constant: %d ",nwhite,noper,nassign,niden,nconst);
return 0;
} 
