
digit[0-9]
letter[A-Za-z]
digits [0-9][0-9]*
%{
int counti,countm,countiden,counta,counto,countos,countip,countmp;
%}

%%
"++"[a-z] {ECHO;printf(" preincrement operator identifier\n");counti++;countiden++;}
"--"[a-z] {ECHO;printf(" predecrement operator identifier\n");countm++;countiden++;}

[a-z]"++" {ECHO;printf(" postincrement operator and identfier \n");countip++;countiden++;}
[a-z]"--" {ECHO;printf(" postdecrement operator and identifier \n");countmp++;countiden++;}
{letter}({letter}|{digit})* {ECHO ; printf(" identifier \n");countiden++;}
= {ECHO ; printf(" Assignment operator \n");counta++;}
"+" {ECHO;printf(" Addition Operator \n");counto++;}
"-" {ECHO;printf(" Subtraction Operator \n");countos++;}
%%

int main()
{
yyin = fopen("p4.txt","r");
yylex();

printf("The Counts are \n PreIncrement : %d \n PreDecrement : %d \n identifier : %d \n Assignment : %d \n Addition %d \n Subraction %d \n",counti,countm,countiden,counta,counto,countos);
printf("Post Increment %d : \n Post Decrement %d : \n",countip,countmp);
return 0;

}
