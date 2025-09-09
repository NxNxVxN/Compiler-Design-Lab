%{
#include<stdio.h>
%}

comment    (\/\/[^\n]*|\/\*([^*]|\*+[^*/])*\*+\/)
constant   ([0-9]+(\.[0-9]*)?|\.[0-9]+)
identifier [a-zA-Z_][a-zA-Z0-9_]*
operator   (\+|\-|\*|\/|%|<|=|!=|==|>|<=|>=|&&|\|\||!|&|\||\^|~|=|\+=|\-=|\*=|\/=|%=)

%%
{comment}      {printf("%s is a comment.\n", yytext);}
{constant}     {printf("%s is a constant.\n", yytext);}
{identifier}   {printf("%s is an identifier.\n", yytext);}
{operator}     {printf("%s is an operator.\n", yytext);}
[ \t\n]+       { /* ignore whitespace */ }
.              {printf("%s is not a recognized pattern.\n", yytext);}
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