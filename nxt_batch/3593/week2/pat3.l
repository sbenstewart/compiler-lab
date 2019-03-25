digits[0-9][0-9]*
sign [+/-]
%%
^{sign}?{digits}$ printf(" matched");
.* printf(" unmatched");
%%
int main(void)
{
yylex();
return 0;
}

