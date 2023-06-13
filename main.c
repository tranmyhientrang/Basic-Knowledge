#include <stdio.h>
#include "factorial.h"
#include "hello.h"

int main()
{
    print_hello();
    printf("The factorial of 5 is %d\n",factorial(5));
    return 0;
}
