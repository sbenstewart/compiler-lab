%%
"+" {printf("V");}
"-" {printf("^");}
%%
int main(){
	yylex();
	return 0;
}
