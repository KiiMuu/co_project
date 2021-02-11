#include <stdio.h>
#include <stdlib.h>

int main()
{
    int num1, num2;
    printf("Enter the first number: ");
    scanf("%d", &num1);
    printf("Enter the second number: ");
    scanf("%d", &num2);

    printf("The sum is: %d\n", num1 + num2);
    printf("The multiplication is: %d\n", num1 * num2);
    printf("The division is: %d\n", num1 / num2);
    printf("\n");

    /* ------------ */

    int i, list[5], minElement;

    printf("Enter 5 numbers: ");
    for (i = 0; i < 5; i++) {
        scanf("%d", &list[i]);
    }

    minElement = list[0];

    for (i = 0; i < 5; i++) {
        if (list[i] < minElement)
            minElement = list[i];
    }

    printf("\nMin of the list is: %d", minElement);
    printf("\n");


    /* ------------ */

    int side1, side2, side3;

    printf("Enter the first side: ");
    scanf("%d", &side1);
    printf("Enter the second side: ");
    scanf("%d", &side2);
    printf("Enter the third side: ");
    scanf("%d", &side3);

    printf("The square of the first side is: %d\n", side1 * side1);

    if (side1 == 0 || side2 == 0 || side3 == 0 || side1 + side2 <= side3 || side1 + side3 <= side2 || side2 + side3 <= side1) {
        printf("Invalid triangle");
    } else {
        printf("Valid triangle");
    }


    return 0;
}
