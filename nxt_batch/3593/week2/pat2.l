%%
^a(cd)?$ printf(" matched");
.* printf(" unmatched");
%%
int main(void)
{
yylex();
return 0;
}
 
