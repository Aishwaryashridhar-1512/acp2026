#include<stdio.h>
#include<stdlib.h>

int* create_array(int n){
    int *arr = (int*)malloc(n * sizeof(int));
    return arr;
}

void initialize_array(int *arr,int n){
    int i;
    printf("Enter %d elements:\n",n);
    for(i=0;i<n;i++){
        scanf("%d",&arr[i]);
    }
}

void print_array(int *arr,int n){
    int i;
    for(i=0;i<n;i++){
        printf("%d ",arr[i]);
    }
    printf("\n");
}

void delete_array(int **arr){
    if(*arr != NULL){
        free(*arr);
        *arr = NULL;
    }
}

int main()
{
    int n;
    int *arr = NULL;

    printf("Enter the number of elements:\n");
    scanf("%d",&n);

    if(n <= 0){
        printf("Invalid array size!\n");
        return 1;
    }

    arr = create_array(n);
    if(arr == NULL){
        printf("Memory allocation failed! Pointer is NULL.\n");
        return 1;
    }

    initialize_array(arr,n);

    printf("Array elements are:\n");
    print_array(arr,n);

    delete_array(&arr);

    if(arr == NULL){
        printf("Memory successfully freed and pointer set to NULL.\n");
    }

    return 0;
}

