notd [^"]
start "/*"
end "*/"
%%
{notd}{start}.*{end}{notd} {printf("Comment is %s \n",yytext);}
. {}
%%
