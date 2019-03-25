
digit[0-9]
letter[A-Za-z]
digits [0-9][0-9]*
%{
int counti,countm,countiden,counta,counto,countos;
%}

%%
"++" {ECHO;printf(" increment operator \n");counti++;}
"--" {ECHO;printf(" decrement operator \n");countm++;}
{letter}({letter}|{digit})* {ECHO ; printf(" identifier \n");countiden++;}
= {ECHO ; printf(" Assignment operator \n");counta++;}
"+" {ECHO;printf(" Addition Operator \n");counto++;}
"-" {ECHO;printf(" Subtraction Operator \n");countos++;}
%%

int main()
{
yyin = fopen("p4.txt","r");
yylex();

printf("The Counts are \n Increment : %d \n Decrement : %d \n identifier : %d \n Assignment : %d \n Addition %d \n Subraction %d \n",counti,countm,countiden,counta,counto,countos);
return 0;

}
