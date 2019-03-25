%%
[0-9]+ { int i=0;int j=0;int k = 0;
for(i=0;i<yyleng;i++){
for(j=i+1;j<yyleng;j++){
if(yytext[i]==yytext[j])
k=1;
break;
}
if(k==1)
break;
}
if(k==0)
printf("matched:%s\n",yytext);
}
.* 
%%
int main(){
	yylex();
	return 0;
}
