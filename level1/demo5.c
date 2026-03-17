#include<stdio.h>

void read_array(int n,int arr[n])
{
    int i;

    for(i=0;i<n;i++)
    {
        scanf("%d",&arr[i]); 
    }
}

void print_array(int n,int arr[n])
{
    int i;
    
    for(i=0;i<n;i++)
    {
        printf("%d\t",arr[i]);
    }
    printf("\n");
}

void swap_array(int n,int a[n],int b[n])
{
    int i,temp;

    for(i=0;i<n;i++)
    {
        temp = a[i];
        a[i] = b[i];
        b[i] = temp;
    }

}

int main()
{
    int n,i;
    printf("Enter the size of array 1 and 2:\n");
    scanf("%d",&n);

    int a[n],b[n];

    printf("Enter the elements of array 1:\n");
    read_array(n,a);

    printf("Enter the elements of array 2:\n");
    read_array(n,b);

    printf("\nArrays before swapping:\n");

    printf("Array 1:\n");
    print_array(n,a);
    
    printf("Array 2:\n");
    print_array(n,b);

    swap_array(n,a,b);

    printf("\nArrays after swapping:\n");
    
    printf("Array 1:\n");
    print_array(n,a);

    printf("Array 2:\n");
    print_array(n,b);

    return 0;
}
