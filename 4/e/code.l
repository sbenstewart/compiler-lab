%{
int countidentifier=0;
int countassign=0;
int countarithmetic=0;
int countincrement=0;
int countdecrement=0;
int countkeyword=0;
int countrelop=0;
int countdeli=0;
int countconst=0;
int countopen=0;
int countclose=0;
int countfunction=0;
%}
lower [a-z]
upper [A-Z]
digit [0-9]
inc "++"
dec "--"
arithmetic [\-+\*/]
relational "<"|"<="|">"|">="|"!="
identifier ({lower}|{upper})({lower}|{upper}|{digit})*
%%
[ \t\n]* {countdeli++;printf("%d Delimiter\n",countdeli);}
"if"|"else"|"for"|"while"|"do"|"main"|"print"|"def"|"return" {countkeyword++;printf("%d Keyword %s\n",countkeyword,yytext);}
{relational} {countarithmetic++;printf("%d Relational Operator %s\n",countrelop,yytext);}
"=" {countassign++;printf("%d Assignment %s\n",countassign,yytext);}
"(" {countopen++;printf("%d Open braces %s\n",countopen,yytext);}
")" {countclose++;printf("%d Close braces %s\n",countclose,yytext);}
{digit}* {countconst++;printf("%d Constant %s\n",countconst,yytext);}
{arithmetic} {countarithmetic++;printf("%d Arithmetic Operator %s\n",countarithmetic,yytext);}
{identifier}"(" {countfunction++;countopen++;printf("%d Function  %s\)\n %d Open braces \( \n",countfunction,yytext,countopen);}
{inc}{identifier} {countincrement++;countidentifier++;printf("%d Pre increment ++\n%d Identifier %s\n",countincrement,countidentifier,yytext+2);}
{dec}{identifier} {countdecrement++;countidentifier++;printf("%d Pre decrement --\n%d Identifier %s\n",countdecrement,countidentifier,yytext+2);}
{identifier}{inc} {countincrement++;countidentifier++;printf("%d Identifier %d Post increment %s\n",countidentifier,countincrement,yytext);}
{identifier}{dec} {countdecrement++;countidentifier++;printf("%d Identifier %d Post decrement %s\n",countidentifier,countdecrement,yytext);}
{identifier} {countidentifier++;printf("%d Identifier %s\n",countidentifier,yytext);}
%%
