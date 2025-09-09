%{
#include<stdio.h>
%}

assign    (=|\+=|\-=|\*=|\/=|%=)
bitwise   (&|\||\^|~)
logic     (&&|\|\||!)
relat     (<|!=|==|>|<=|>=)
arith     (\+|\-|\*|\/|%)

%%
{assign}    {printf("%s is an assignment operator.\n", yytext);}
{bitwise}   {printf("%s is a bitwise operator.\n", yytext);}
{logic}     {printf("%s is a logical operator.\n", yytext);}
{relat}     {printf("%s is a relational operator.\n", yytext);}
{arith}     {printf("%s is an arithmetic operator.\n", yytext);}
[^\n]+      {printf("%s is not a valid operator.\n", yytext);}
%%

int main()
{
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}