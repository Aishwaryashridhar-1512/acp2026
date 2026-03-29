#include<stdio.h>
#include<stdlib.h>

int *allocate_scores( int n){
    return(int *)malloc(n * sizeof(int));
}

void read_scores(int *arr,int n){
    for(int i=0;i<n;i++){
        printf("Enter score of player %d: ",i+1);
        scanf("%d",&arr[i]);
    }
}

int calculate_total(int *arr,int n){
    int sum = 0;
    for(int i=0;i<n;i++){
        sum += arr[i];
    }
    return sum;
}

void display_scores(int *arr,int n){
    for(int i=0;i<n;i++){
        printf("%d\t",arr[i]);
    }
}

void delete_scores(int **arr){
    free(*arr);

    *arr = NULL;
}

int main(){
    int n,total;

    int *scores = NULL;

    printf("Enter the number of players:\n");
    scanf("%d",&n);

    if(n <= 0){
        printf("Invalid number of players.\n");
        return 0;
    }

    scores = allocate_scores(n);
    if(scores == NULL){
        printf("Memory allocation failed.\n");
        return 0;
    }

    read_scores(scores,n);

    printf("\nPlayer Scores:\n");
    display_scores(scores,n);

    total = calculate_total(scores,n);
    printf("\nTotal Team Score: %d\n",total);

    delete_scores(&scores);

    return 0;

}