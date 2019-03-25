%%
a*b*c*d*e*f*g*h*i*j*k*l*m*n*o*p*q*r*s*t*u*v*w*x*y*z* printf("%s is in alphabetical order",yytext);
.* printf("%s is invalid",yytext);
%%
int main()
{
yylex();
return 0;
}

