%{
#include<stdio.h>
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {printf("%s is a valid identifier.\n", yytext);}
[^\n]+ {printf("%s is not a valid identifier.\n", yytext);}
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