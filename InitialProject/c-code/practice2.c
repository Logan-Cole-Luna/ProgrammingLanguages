#include <stdio.h>
#include <stdlib.h>

void setElements(int *arr, int size){
    printf("\nEnter the elements:\n");
    for(int i = 0; i < size; i++){
        printf("Element %d: ", i + 1);
        scanf("%d", &arr[i]);
    }
}

int getSum(int *arr, int size){
    int sum = 0;
    for(int i = 0; i < size; i++){
        sum += arr[i];
    }
    return sum;
}

void reverseArr(int *arr, int size, int *arr_reverse){
    int *start = arr;         // Pointer to the first element
    int *end = arr + size - 1;  // Pointer to the last element
    int temp;

    // Swap elements from start to end using pointer arithmetic
    while (start < end) {
        // Swap the values using temp
        temp = *start;
        *start = *end;
        *end = temp;

        // Move the pointers closer to the center
        start++;
        end--;
    }

    //for(int i = 0; i < size; i++){
    //    arr_reverse[i] = arr[size - i - 1];  // Copy values, not addresses
    //}
}

void min_max(int *arr, int size){
    int min = 0;
    int max = 0;
    for(int i = 0; i < size; i++){
        if (arr[i] < min){
            min = arr[i];
        }
        if (arr[i] > max){
            max = arr[i];
        }
    }
    printf("Min: %d Max: %d", min, max);
}

void printArray(int *arr, int size) {
    for(int i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int main(){
    int size;
    int *arr;
    int *arr_reverse;
    int sum = 0;

    printf("\nEnter the size of the array: ");
    scanf("%d", &size);

    // Dynamically allocate memory for the arrays
    arr = (int *)malloc(size * sizeof(int));
    arr = (int *)malloc(size * sizeof(int));

    char *result=(char *)malloc(strlen((str1) + strlen(str2) + 1)* sizeof(char));

    result 

    arr_reverse = (int *)malloc(size * sizeof(int));

    setElements(arr, size);

    sum = getSum(arr, size);
    printf("\nSum of array: %d\n", sum);

    reverseArr(arr, size, arr_reverse);

    printf("\nReversed array: ");
    printArray(arr, size);  // Print the reversed array

    min_max(arr, size);
    // Free the allocated memory
    free(arr);
    free(arr_reverse);

    return 0;
}