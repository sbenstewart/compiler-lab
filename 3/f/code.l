%{

%}


%%

[a-z]+  {

printf("\n Lower = ");
ECHO;
printf("\n start word of 1st yymore = ");
yymore();
printf("\n end word of 1st yymore = ");
}

[A-Z]+  {

printf("\n Upper = ");
ECHO;
printf("\n start word of 1st yymore = ");
yymore();
printf("\n end word of 1st yymore = ");
}

%%

int main()
{
yylex();
}
