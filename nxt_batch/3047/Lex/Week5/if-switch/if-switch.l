%option noyywrap
alp [a-z]
rel [<|<=|>=|>]
equ [=]
su [+|-|*|/]
digit [0-9]+
%%
"if(".*")" {
			printf("switch(%c)\n{\n",yytext[3]);
			printf("case %c:",yytext[yyleng-2]);
		}
"else if(".*")" {
		printf("break;\ncase %c:",yytext[yyleng - 2]);
		}
"else {"	{
		printf("break;\ndefault:\n{");
	}
"{"(.|\n)"}" {
		printf("%sbreak;\n",yytext);
	}
%%
int main()
{
	yylex();
printf("}\n");
	return 0;
}
