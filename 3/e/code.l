lower [a-z]
upper [A-Z]
%%
{lower}({lower}|{upper})* {char temp=yytext[0];printf("%c%s",temp-32,yytext+1);}
{upper}({lower}|{upper})* {ECHO;}
%%
