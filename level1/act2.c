#include<stdio.h>

typedef struct{
    int units;
    float rate;
    float total_bill;
}ElectricityBill;

ElectricityBill input(){
    ElectricityBill bill;

    printf("Enter the number of units consumed:\n");
    scanf("%d",&bill.units);

    printf("Enter the rate per unit:\n");
    scanf("%f",&bill.rate);

    return bill;
}

ElectricityBill calculate_bill(ElectricityBill bill){
    int extra_units;
    if(bill.units > 100){
        extra_units = bill.units - 100;
        bill.total_bill = (100 * bill.rate)+(extra_units * (bill.rate + 5));
    }
    else{
        bill.total_bill = bill.units * bill.rate;
    }
    return bill;
}

void output(ElectricityBill bill){

    if(bill.units > 100){
        printf("High consumption alert! Extra charges applied.\n");
    }

    printf("Total Bill: %.2f\n",bill.total_bill);

    
}

int main(){
    ElectricityBill bill;

    bill = input();
    
    if((bill.units <= 0 || bill.rate <= 0)||(bill.units <= 0 && bill.rate <= 0)){
        printf("Invalid Input!\n");
        return 0;
    }

    bill = calculate_bill(bill);

    output(bill);

    return 0;
}
