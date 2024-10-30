//Pointers problem 2
//Create an int array using pointers.
//Size provided by the user
//Elements provided by the user (create function setElements)
//Sum computed by your program

#include <stdio.h>
#include <stdlib.h>

// Function to set elements in the array
//This function should store numbers in the address indicated by "arr"
void setElements(int *arr, int size) {
    for (int i = 0; i < size; i++) {
        printf("Enter element %d: ", i + 1);
        scanf("%d", &arr[i]);
    }
}

// Function to compute the sum of the elements
//arr is a pointer to the first element in the array
//size is the size of the array
//This method should compute and return the sum
int getSum(int *arr, int size) {
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += arr[i];
    }
    return sum;
}


int main() {
    int size;
    int *arr;
    int sum = 0;

    printf("Enter the size of the array: ");
    scanf("%d", &size);

    // Allocate memory for the array
    arr = (int *)malloc(size * sizeof(int));
    setElements(arr, size);

    sum = getSum(arr, size);

    printf("The sum of the array elements is: %d\n", sum);

    free(arr);

    return 0;
}
