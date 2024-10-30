#include <stdio.h>
int main(){
    int numbers[10];
    int a = 5;
    int b = 10;
    int mult = 0;

    //printf("\nMultiplication Results: ");
    for(int i = 0; i < b; i++){
        mult += a;
    }
    printf("\nResult: %d", mult);
}