%{
#include <stdio.h>
%}

function (void|int|float|char|double|long|struct)
init   [a-zA-Z_]
name   [a-zA-Z0-9_]*
comment   (\/\/[^\n]*)|(\/\*([^*]|\*+[^*/])*\*\/)

%%
{comment} { printf("%s is a comment.\n", yytext); }
{function}[ \t]+{init}{name}*\([^\)]*\)[ \t]*\{[^}]*\} { printf("%s is a function.\n", yytext); }
.|\n { /* Ignore other characters */ }
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
