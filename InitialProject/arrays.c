//arrays

#include <stdio.h>
#include <string.h>  // Include this to use strlen()

int main(){
    int numbers[10];

    int bytesOfArray = sizeof(numbers); //40
    int bytesOfFirstElement = sizeof(numbers[0]); //4 bytes
    int sizeArray = bytesOfArray/bytesOfFirstElement; //10

    printf("\nBytes of the array: %d", bytesOfArray);
    printf("\nBytes of the first element of the array: %d", bytesOfFirstElement);
    printf("\nSize of the array: %d", sizeArray);

    printf("\nElements of the array: ");
    for(int i = 0; i < sizeArray; i++){
         printf("\nElement %d: %d", i, numbers[i]);
    }
   
    char text[50];
    printf("\nPlease enter some text: ");
    scanf("%s", text);
    printf("The length of the entered text is: %d", strlen(text));
}
