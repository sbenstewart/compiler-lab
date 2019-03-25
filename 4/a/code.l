delimiter [ \t\n]
%%
[a|c-z]*[b]?[a|c-z]*[b]?[a|c-z]*{delimiter} {printf("Atmost two b's \n");}
[a-z]+ {printf("Pattern not matched\n");}
%%
