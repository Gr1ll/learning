#include <stdio.h>

void print_text(int a, int b);

int main() {
    int a = 1;
    int b = 0;

    print_text(a, b);
    return 0;
}

void print_text(int a, int b) {
    if(a > b){
        printf("Hello, World!\n");
        a = 1;
        b = 2;
        print_text(a, b);
        return;
    }

    if(a == b){
        printf("Oh nooo!\n");
        return;
    }

    if(a < b){
        printf("Goodbye, sir!\n");
        a = 1;
        b = 1;
        print_text(a, b);
        return;
    }
}