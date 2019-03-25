type [int|float]
%{
int a;
char name[100];
char d[4]={'i','f','(',';'};
char restat[100];
%}
%%
"{" 
"}" 
{type}(.*)"(" {
	if(yytext[0]==d[0]){
		int i=0;
		for(a=4;a<yyleng;a++,i++){
			if(yytext[a]==d[2]){
				break;
			}
			name[i]=yytext[a];
		}
	}else{
		int i=0;
		for(a=6;a<yyleng;a++,i++){
			if(yytext[a]==d[2]){
				break;
			}
			name[i]=yytext[a];
		}
	}
	printf("#define %s(",name);
	
}
"int"|"float" 
"return"[ ](.)* {
	int i,k;
	for(i=7,k=0;i<yyleng;i++,k++){
		if(yytext[i]==d[3]){
			break;
		}
		restat[k]=yytext[i];
	}
	printf(" %s",restat);
}
%%
int main(){
	yylex();
	return 0;
}
