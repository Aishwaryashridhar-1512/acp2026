#include<stdio.h>
#include<stdlib.h>

void inputTemperatures(int n,float temps[n]){
    int i;

    printf("Enter the temperatures of %d days:\n",n);

    for(i=0;i<n;i++){
        if(scanf("%f", &temps[i]) != 1) {
            exit(1);
    }
}
}

float findHighest(int n,float temps[n]){
    int i;
    float max = temps[0];

    for(i=0;i<n;i++){
        if(temps[i] > max){
            max = temps[i];
        }
    }
    return max;
}

float findLowest(int n,float temps[n]){
    int i;
    float min = temps[0];

    for(i=0;i<n;i++){
        if(temps[i] < min){
            min = temps[i];
        }
    }
    return min;
}

void output(float max,float min){
    printf("Highest Temperature: %.2f\n",max);
    printf("Lowest Temperature: %.2f\n",min);
}

int main(){
    int n = 7;
    float temps[n];
    float max,min;

    inputTemperatures(n,temps);

    max = findHighest(n,temps);

    min = findLowest(n,temps);

    output(max,min);

    return 0;
    
}