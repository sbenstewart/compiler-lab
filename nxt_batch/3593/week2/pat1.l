%%
^([a][b][c])+$  printf(" matched");
.* printf(" unmatched"); 
%%
int main(void){
yylex();

return 0;
}

