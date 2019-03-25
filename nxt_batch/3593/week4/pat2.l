%{
int flagb,countb=0,flag=1;

%}



%%
a?b {countb++;if(countb>=2){
ECHO;
printf(" Valid Statement with 2 b's min \n");}}

\n {countb=0;printf("Newline");}
. {flag=0;ECHO;}
%%
int main()
{
yyin=fopen("p2.txt","r");
yylex();
if(flag==0)
{
printf(" \n unwanted characters are present");
}

return 0;
}
