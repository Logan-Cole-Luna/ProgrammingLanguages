#include <stdio.h>

void increaseValue(int *pointerInsideFunction);

int main(){

    printf("\nHello world");

    int a;

    //Get current value of 'a' before initializing it
    printf("\nCurrent value of 'a' before initialization: %d",a);
    //Get current address of 'a'. Where is 'a' stored in memory?
    printf("\nCurrent address of 'a': %p",&a);

    //Change the value of 'a'
    a = 5;
    //Get current value of 'a' AFTER initializing it
    printf("\nCurrent value of 'a' AFTER initialization: %d",a);
    //Get current address of 'a'. Where is 'a' stored in memory?
    printf("\nCurrent address of 'a': %p",&a);

    //Creating a pointer to 'a'
    int *pointerA;
    //Get current value of 'pointerA' before initializing it
    printf("\n\nA pointer has been created, current value of 'pointerA' before initialization: %p",pointerA);
    //Get current address of 'pointerA'. Where is 'pointerA' stored in memory?
    printf("\nCurrent address of 'pointerA': %p",&pointerA);
    //Getting the current value of the address to which 'pointerA' is pointing to might result as an error. Where is the pointer pointing to?
    // printf("\nCurrent value of the address to which 'pointerA' is pointing to: %d", *pointerA);

    //Make our pointer point to 'a'
    pointerA = &a;
    //Get current value of 'pointerA' after it points to 'a'
    printf("\nCurrent value of 'pointerA' AFTER doing pointerA=&a : %p",pointerA);
    //Get current address of 'pointerA'. Where is 'pointerA' stored in memory?
    printf("\nCurrent address of 'pointerA': %p",&pointerA);
    //Get value stored in the address stored in pointerA
    printf("\nCurrent value of 'a' accessed via the pointer: %d", *pointerA);

    //Calling function and sending out 'pointerA' as a parameter
    printf("\nCalling the function...");
    printf("\nA modification is made, now a pointer is sent to the function...");
    increaseValue(pointerA);
    printf("\nFunction has been called, resuming process in the main method");

    //After calling the function, check values
    //Get current value of 'a' AFTER calling the function
    printf("\nCurrent value of 'a' AFTER calling the function: %d",a);
    //Get current address of 'a' in the main method. Where is 'a' stored in memory?
    printf("\nCurrent address of 'a' in the main method: %p",&a);

}

void increaseValue(int *pointerInsideFunction){
    printf("\n\n");
    //Get current value of the address stored in 'pointerInsideFunction' inside the function via pointer
    printf("\nCurrent value of the address stored in 'pointerInsideFunction' inside the function (via the pointer): %d", *pointerInsideFunction);
    //Get current address stored in 'pointerInsideFunction' INSIDE the function. Via pointer
    printf("\nCurrent address stored in 'pointerInsideFunction' (the pointer 'pointerInsideFunction' inside the function): %p", pointerInsideFunction);
    //Get current address of 'pointerInsideFunction' INSIDE the function. Via pointer
    printf("\nCurrent address of 'pointerInsideFunction' (where is 'pointerInsideFunction' stored?): %p", &pointerInsideFunction);

    //Change value of 'pointerInsideFunction'
    *pointerInsideFunction = 7;
    //Get current value of 'pointerInsideFunction' inside the function
    printf("\nCurrent value of the address stored in 'pointerInsideFunction' after value has been changed: %d", *pointerInsideFunction);
    printf("\n\n");
}