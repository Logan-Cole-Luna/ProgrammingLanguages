#include <stdio.h>
#include <stdlib.h>

struct hurricane {   
    char name[50];
    int windspeed;
};

int main() {
    int stormNum
    printf("Enter the number of storms: ");
    scanf("%d", stormNum); // read str
    
    struct hurricane h1, h2; // Declare two hurricane structures

    printf("Enter the name of the first hurricane: ");
    scanf("%s", h1.name); // read str

    printf("Enter the wind speed of the first hurricane: ");
    scanf("%d", &h1.windspeed); // read int

    printf("Enter the name of the second hurricane: ");
    scanf("%s", h2.name); 

    printf("Enter the wind speed of the second hurricane: ");
    scanf("%d", &h2.windspeed); 

    printf("Hurricane: %s, Windspeed: %d\n", h1.name, h1.windspeed);
    printf("Hurricane: %s, Windspeed: %d\n", h2.name, h2.windspeed);

    return 0;
}