%{
int niden,nassign,noper,nwhite,nconst;
int i=1000;
%}
digit[0-9]
letter[A-Za-z]
digits [0-9][0-9]*
type "int"|"float"|"char"|"double"
keyword "for"|"while"|"if"|"else"
relop ">"|"<"|"=="|"<="|">="
%%

[+\-/*] {i+=8;noper++;printf("operator : %s\n Location : %d\n",yytext,i);}
[ \t\n]+ {nwhite++;}
{digits} {nconst++;i=i+8; printf("Constants : %s \n Location : %d",yytext,i);}
{type} {printf("declaration type : %s \n ",yytext);}
[=] {i+=8;nassign++;printf("Assign operator : %s Location : %d \n",yytext,i);}
{relop} {nassign++;printf("relational operator : %s Location : %d \n",yytext,i);}
{letter}({letter}|{digit})* {i+=8;printf("identifier : %s Location : %d\n",yytext,i);}
{digit}+({letter}|{digit})* {i-=8;niden--;}



%%

int main()
{
yylex();
return 1;
}
