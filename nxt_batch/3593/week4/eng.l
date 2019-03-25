%%
.*\? {printf("found");}
.*\! {printf("found");}
.*\. {printf("found");}
.* 
%%
int main(){
	yylex();
	return 0;
}
