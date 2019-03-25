%{
int z=0;
%}


%%
"if " 
"else if"
[(].*[)] { 
if(z==1){printf("break;");}
if(z==0){z=1;}

printf("\n case ");
int i;
for(i=1;i<yyleng-1;i++)
printf("%c",yytext[i]);
printf(":"); 
}

"else" {printf("break; \n case default :");}
%%
int main()
{
yyin=fopen("file2.txt","r");
printf("switch(x)\n{\n");
yylex();
printf("}\n\n");
return 0;
} 
