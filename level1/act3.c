#include<stdio.h>

typedef struct {
    int consumerID;
    float unitsConsumed;
    float billAmount;
}Bill;

void input(int n,Bill bills[n]){

    int i;
    for(i=0;i<n;i++){
        printf("\nEnter the details of customer %d:\n",i+1);

        printf("ID:");
        scanf("%d",&bills[i].consumerID);

        printf("Number of units consumed:");
        scanf("%f",&bills[i].unitsConsumed);
        
    }

}

void calculate_Bills(int n,Bill bills[n]){
    int i;
    float rate;
    for(i=0;i<n;i++){
        bills[i].billAmount = bills[i].unitsConsumed * 5; 
    }
}

int findHighestBillIndex(int n,Bill bills[n]){
    int i,index = 0;

    for(i=0;i<n;i++){
        if(bills[i].billAmount > bills[index].billAmount){
            index = i;
        }
    }
    return index;
    
}

void displayHighestBill(int index,Bill bills[]){
    printf("\nHighest Electricity Bill:\n");

    printf("ID: %d\n",bills[index].consumerID);
    printf("Number of units consumed: %.2f\n",bills[index].unitsConsumed);
    printf("Bill Amount: %.2f\n",bills[index].billAmount);
    
}

int main(){
    int n;
    float rate;

    printf("Enter the number of customers:\n");
    scanf("%d",&n);

    Bill bills[n];

    input(n,bills);

    calculate_Bills(n,bills);

    int index = findHighestBillIndex(n,bills);

    displayHighestBill(index,bills);

    return 0;
}