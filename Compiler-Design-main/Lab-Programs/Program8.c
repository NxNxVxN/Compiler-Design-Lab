#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

char input[100];  
int pos = 0;      
char lookahead;   
void E();
void Eprime();
void T();
void Tprime();
void F();

void match(char t) {
    if (lookahead == t) {
        lookahead = input[++pos];
    } else {
        printf("Error: expected '%c' at position %d\n", t, pos);
        exit(1);
    }
}
void E() {
    T();
    Eprime();
}
void Eprime() {
    if (lookahead == '+') {
        match('+');
        T();
        Eprime();
    }}

void T() {
    F();
    Tprime();
}
void Tprime() {
    if (lookahead == '*') {
        match('*');
        F();
        Tprime();
    }}
void F() {
    if (lookahead == '(') {
        match('(');
        E();
        match(')');
    } else if (lookahead == 'i') 
    {
        match('i');
        if (lookahead == 'd') {
            match('d');
        } else {
            printf("Error: expected 'd' after 'i'\n");
            exit(1);
        }} else {
        printf("Error: unexpected symbol '%c' at position %d\n", lookahead, pos);
        exit(1);
    }}

int main() {
    printf("Enter an expression: ");
    scanf("%s", input);
    lookahead = input[pos];
    E();
    if (lookahead == '\0') {
        printf("Parsing successful\n");
    } else {
        printf("Parsing failed\n");
    }
    return 0;
}
