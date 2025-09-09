%{
#include<stdio.h>
%}

consonants [bcdfghjklmnpqrstvwxyzBCDFGHIJKLMNPQRSTVWXYZ]
vowels [aeiouAEIOU]

%%
{consonants} {printf("%s is a consonant.\n",yytext);}
{vowels} {printf("%s is a vowel.\n",yytext);}
[ \t\n]+ {}
. {printf("%s is neither a consonant nor a vowel.\n",yytext);}
%%

int main() {
yylex();
return 0;
}

int yywrap() {
return 0;
}