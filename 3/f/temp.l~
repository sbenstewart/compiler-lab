lower [a-z]
upper [A-Z]
delimiter [ \t\n]
%%
{delimiter}+ {}
{upper}+ {printf("%s \t Upper\n",yytext);yymore();}

{lower}+ {printf("%s \t Lower\n",yytext);yymore();}
%%
