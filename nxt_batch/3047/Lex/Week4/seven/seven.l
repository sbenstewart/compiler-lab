letter [a-zA-Z]
digit [0-9]
ws [ \t\n]
id {letter}({letter}|{digit})*
op "-"|"+"|"*"|"/"|">="|">"|"<="|"<"|"!="
keyword "if"|"else"|"def"|"return"|"print"
spl ":"|"("|")"
%{
	int id = 0,pre=0,post=0,fnc=0,spl=0,op=0,assign=0,cons=0,key=0;
%}
%%
{keyword} {printf("Keyword:%s\n",yytext);key++;}
{letter}({letter}|{digit})*"("({letter}({letter}|{digit})*)?")" {printf("Function:%s\n",yytext);fnc++;}
{letter}({letter}|{digit})* {printf("Identifier:%s\n",yytext);id++;}
"++"{letter}({letter}|{digit})* {printf("Post increment:%s\n",yytext);post++;}
{letter}({letter}|{digit})*"++" {printf("Pre increment:%s\n",yytext);pre++;}
{spl} {printf("Spl. char:%s\n",yytext);spl++;}
"=" {printf("assignment operator:%s\n",yytext);assign++;}
{op} {printf("Operator:%s\n",yytext);op++;}
{digit}+ {printf("constant:%s\n",yytext);cons++;}
%%
int main(){
	yylex();
	printf("Id:%d\nPre:%d\nPost:%d\nAssign:%d\nOp:%d\nConstants:%d\nKeywords:%d\nFunctions:%d\nSpl characters:%d\n",id,pre,post,assign,op,cons,key,fnc,spl);
	return 0;
}
