#include <stdio.h>
#include <string.h>


// TODO: Define your structure here
struct Car {
    char make[50];
    char model[50];
};

// Function to compare two cars, make, model
// returns 1 if the two cars are identical, 0 otherwise
int compareCars(struct Car car1, struct Car car2) {
    if (strcmp(car1.make, car2.make) == 0 && strcmp(car1.model, car2.model) == 0) {
        return 1;
    }
    return 0;
}

int main() {
    
    //TODO create two test cases, one that shows that the two cars are identical and another that they are not
    //You can hardcode values
    //Create two cars using your structure
    //For make and model hardcode values
        //Tip: 
        /*
        strcpy(destination, source) will copy the source String into the destination array.
            Example: 
                char destination[50];
                strcpy(destination, "Hello"); //This will copy the string Hello into the destination char array
            Example 2:
                strcpy(carInstance.name, "My car awesome");
        */
    // Test case 1: Identical
    struct Car car1;
    strcpy(car1.make, "Toyota");
    strcpy(car1.model, "Camry");
 
    struct Car car2;
    strcpy(car2.make, "Toyota");
    strcpy(car2.model, "Camry");

    // Test case 2: Different
    struct Car car3;
    strcpy(car3.make, "Honda");
    strcpy(car3.model, "Civic");

    struct Car car4;
    strcpy(car4.make, "Ford");
    strcpy(car4.model, "Mustang");
    
    if (compareCars(car1, car2)) {
        printf("car1 and car2 are identical.\n");
    } else {
        printf("car1 and car2 are not identical.\n");
    }

    // Compare and print results for different cars
    if (compareCars(car3, car4)) {
        printf("car3 and car4 are identical.\n");
    } else {
        printf("car3 and car4 are not identical.\n");
    }
    return 0;
}
