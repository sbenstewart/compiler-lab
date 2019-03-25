%{
char str[100];

%}

%%
[ab]*b[ab]*b[ab]*\n {ECHO; printf(" Hi there The text has 2 b's \n");}
. 
%%

int main()
{
yyin=fopen("p2.txt","r");
yylex();
int i=0;
return 0;
}
