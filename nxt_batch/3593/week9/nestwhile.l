%{
#include<stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}

%%

[(].*[)] {return CONDT;}

[a-z]*[+][+] || [+][+][a-z]* {return Incre}
