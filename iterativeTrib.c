#include <stdio.h>

// Function to calculate the nth Tribonacci number
int tribonacci(int a, int b, int c, int n)
{
    // Handle cases for the first three numbers
    if (n == 1)
        return a;
    if (n == 2)
        return b;
    if (n == 3)
        return c;

    // Variables to store the previous three numbers in the sequence
    int t1 = a, t2 = b, t3 = c, t4;

    // Generate the nth Tribonacci number
    for (int i = 4; i <= n + 1; i++)
    {
        t4 = t1 + t2 + t3; // Sum of the last three numbers
        t1 = t2;
        t2 = t3;
        t3 = t4;
    }

    return t3;
}

int main()
{
    int a, b, c, n;

    // Ask for user input with validation for positive values
    do
    {
        printf("Enter tribonacci(0): ");
        scanf("%d", &a);
        if (a < 0)
        {
            printf("Enter a positive integer\n");
        }
    } while (a < 0);

    do
    {
        printf("Enter tribonacci(1): ");
        scanf("%d", &b);
        if (b < 0)
        {
            printf("Enter a positive integer\n");
        }
    } while (b < 0);

    do
    {
        printf("Enter tribonacci(2): ");
        scanf("%d", &c);
        if (c < 0)
        {
            printf("Enter a positive integer\n");
        }
    } while (c < 0);

    do
    {
        printf("Enter n: ");
        scanf("%d", &n);
        if (n < 0)
        {
            printf("Enter a positive integer for n\n");
        }
    } while (n < 0);

    // Get the nth Tribonacci number and print the result
    int result = tribonacci(a, b, c, n);
    printf("Tribonacci(%d) = %d\n", n, result);

    return 0;
}
