%{
#include<string.h>
char  str[100];
char queue[100];
top=-1;
void pushf(char x)
{
int i=0;
while(stack[i]!='\0')
{
i++;
stack[i]=stack[i-1];
}
stack[0]=x;
} 
char pop(char x)
{
return stack[0];
}


%}
rel[-+/*]
num [0-9]*
%%

{num}  { strcpy(str,yytext); int i=0;while(str[i]!='\0'){push(str[i]);i++;}}

}

%% 
int main()
{
yyin=fopen("file3.txt","r");
yylex();
return 0;
}

