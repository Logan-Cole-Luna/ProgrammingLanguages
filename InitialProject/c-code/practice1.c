#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(){
    char *str1 = "dog";
    char *str2 = "cat";

    char *result = (char *)malloc((strlen(str1)+strlen(str2)+1)*sizeof(char));

    strcat(result, str1);
    strcat(result, str2);
    printf("String: %s", result);
}