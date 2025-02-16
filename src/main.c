#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {

    for(int i = 1; i <argc; i++){
        char *current = argv[i];
        if(strcmp(current, "--version") == 0){
            printf("calc 0.0.1\n");
            return 0;
        }
    }

    // Check if there are enough arguments
    if (argc != 4) {
        printf("Usage: calc <operation> <num1> <num2>\n");
        printf("Available operations: add, sub, mul, div\n");
        return 1;
    }

    // Extract the arguments
    char *operation = argv[1];
    double num1 = atof(argv[2]);
    double num2 = atof(argv[3]);
    double result;

    // Determine the operation and calculate the result
    if (strcmp(operation, "add") == 0) {
        result = num1 + num2;
        printf("%.2f + %.2f = %.2f\n", num1, num2, result);
    }
    else if (strcmp(operation, "sub") == 0) {
        result = num1 - num2;
        printf("%.2f - %.2f = %.2f\n", num1, num2, result);
    }
    else if (strcmp(operation, "mul") == 0) {
        result = num1 * num2;
        printf("%.2f * %.2f = %.2f\n", num1, num2, result);
    }
    else if (strcmp(operation, "div") == 0) {
        if (num2 == 0) {
            printf("Error: Division by zero is not allowed.\n");
            return 1;
        }
        result = num1 / num2;
        printf("%.2f / %.2f =%.2f\n", num1, num2, result);
    }
    else {
        printf("Unknown operation: %s\n", operation);
        printf("Available operations: add, sub, mul, div\n");
        return 1;
    }

    return 0;
}
