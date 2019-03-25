digit [0-9]
space [ \t\n];
notcd [^cd];
%%
"abc"* {printf("Accepted %s with pattern as abc concatenated",yytext);}
a{notcd}*(cd)?{notcd}* {printf("Accepted %s with pattern as starting with a, 0 or 1 occurence of cd",yytext);}
[+\-]{digit}+ {printf("Accepted %s as %s",yytext+1,yytext);}
{digit}+ {printf("Accepted %s as %s",yytext,yytext);}
.* {printf("Pattern does not match");}
%%
