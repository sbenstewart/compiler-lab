notd [^"]
start "/*"
end "*/"
%%
[a-z]+([s]|"ing"|"es") {printf("%s is a verb",yytext);}
[a-z]+ {printf("%s It is not a verb",yytext);}
%%
