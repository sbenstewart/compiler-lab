%%
[a|c-z]*[b]?[a|c-z]*[b][a|c-z]*[b][a|c-z]* {printf("Two or three b's %s\n",yytext);}
[a-z]+ {printf("Pattern not matched %s\n",yytext);}
. {}
%%
