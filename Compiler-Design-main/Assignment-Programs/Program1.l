%{
#include<stdio.h>
%}

digits [0-9]
letters [a-zA-Z_]

%%
{letters}({letters}|{digits})* { printf("%s is an identifier.\n", yytext); }
[^\n]+ { printf("%s is not an identifier.\n", yytext); }
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