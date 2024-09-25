#include <stdio.h>

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

    //Calling function and sending out 'a' as a parameter
    printf("\nCalling the function...");
    increaseValue(a);
    printf("\nFunction has been called, resuming process in the main method");

    //After calling the function, check values
    //Get current value of 'a' AFTER calling the function
    printf("\nCurrent value of 'a' AFTER calling the function: %d",a);
    //Get current address of 'a' in the main method. Where is 'a' stored in memory?
    printf("\nCurrent address of 'a' in the main method: %p",&a);

}

void increaseValue(int a){
    printf("\n\n");
    //Get current value of 'a' inside the function
    printf("\nCurrent value of 'a' inside the function: %d",a);
    //Get current address of 'a' INSIDE the function. Where is 'a' (the variable 'a' in the function) stored in memory?
    printf("\nCurrent address of 'a' (the variable 'a' inside the function): %p",&a);

    //Change value of 'a'
    a = 7;
    //Get current value of 'a' inside the function
    printf("\nCurrent value of 'a' inside the function after value has been changed: %d",a);
    printf("\n\n");
}