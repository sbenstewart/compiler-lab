%{

%}
rel[-+/*]
num [0-9]*
%s BEG
%s BODY
%s END
%%

<INITIAL>{num}[ ]?{rel}[ ]?{num} {
printf("%s",yytext);
BEGIN BODY;}

<BODY>[ ]?{rel}[ ]?{num} {
printf("%s",yytext);
BEGIN END;}

<END>. {}

%% 
int main()
{
yyin=fopen("file3.txt","r");
yylex();
return 0;
}

