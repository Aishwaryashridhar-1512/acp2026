#include<stdio.h>
#include<string.h>

void read_string(char str[],int size){

    fgets(str,size,stdin);

}

void print_string(char str[],int size){

    printf("%s",str);

}

void swap_string(char str1[],char str2[]){
    int size = 100;

    char temp[size];

    strcpy(temp,str1);
    strcpy(str1,str2);
    strcpy(str2,temp);
}

int main(){
    int size = 100;

    char str1[size],str2[size];

    printf("Enter the first string:");
    read_string(str1,size);

    printf("Enter the second string:");
    read_string(str2,size);

    printf("\nStrings before swapping:\n");

    printf("String 1:");
    print_string(str1,size);

    printf("String 2:");
    print_string(str2,size);

    swap_string(str1,str2);

    printf("\nStrings after swapping:\n");
    printf("String 1: %s",str1);
    printf("String 2: %s",str2);

    return 0;
}

