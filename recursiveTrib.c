#include <stdio.h>

// Recursive function to calculate the nth term of the Tribonacci sequence
int tribonacci(int t1, int t2, int t3, int n)
{
    // Base case: return the appropriate term for n = 1, 2, or 3
    if (n == 1)
    {
        return t1;
    }
    else if (n == 2)
    {
        return t2;
    }
    else if (n == 3)
    {
        return t3;
    }
    else
    {
        // Recursively calculate the nth term
        return tribonacci(t2, t3, t1 + t2 + t3, n - 1);
    }
}

int main()
{
    int t1, t2, t3, n;

    // Take the first three numbers as input
    do
    {
        printf("Enter tribonacci(0): ");
        scanf("%d", &t1);
        if (t1 < 0)
        {
            printf("Enter a positive integer\n");
        }
    } while (t1 < 0);

    do
    {
        printf("Enter tribonacci(1): ");
        scanf("%d", &t2);
        if (t2 < 0)
        {
            printf("Enter a positive integer\n");
        }
    } while (t2 < 0);

    do
    {
        printf("Enter tribonacci(2): ");
        scanf("%d", &t3);
        if (t3 < 0)
        {
            printf("Enter a positive integer\n");
        }
    } while (t3 < 0);

    do
    {
        printf("Enter n: ");
        scanf("%d", &n);
        if (n < 0)
        {
            printf("Enter a positive integer for n\n");
        }
    } while (n < 0);

    // Call the recursive function to find the nth term and print it
    int nthTerm = tribonacci(t1, t2, t3, n + 1);
    printf("The %d-th term in the Tribonacci sequence is: %d\n", n, nthTerm);

    return 0;
}