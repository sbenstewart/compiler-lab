consonant [qwrtypsdfghjklzxcvbnm]
%%
{consonant}*a{consonant}*e{consonant}*i{consonant}*o{consonant}*u{consonant}* {printf("All vowels in order %s\n",yytext);}
[a-z]+ {printf("Pattern not matched %s\n",yytext);}
%%
