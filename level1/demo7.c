#include<stdio.h>

void inputStrings(char str1[],char str2[]){
    printf("Enter the first string:\n");
    scanf("%s",str1);

    printf("Enter the second string:\n");
    scanf("%s",str2);
}

int compareStrings(char str1[],char str2[]){
    int i = 0;

    while(str1[i] != '\0' && str2[i] != '\0'){
        if(str1[i] > str2[i]){
            return 1;
        }
        else if(str1[i] < str2[i]){
            return -1;
        }
        i++;
    }

    if(str1[i] == '\0' && str2[i] == '\0'){
        return 0;
    }
    else if(str1[i] == '\0'){
        return -1;
    }
    else{
        return 1;
    }
}

void output(int result){
    if(result == 0){
        printf("Strings are equal.\n");
    }
    else if(result == 1){
        printf("First String is lexicographically greater.\n");
    }
    else{
        printf("Second String is lexicographically greater.\n");
    }
}

int main()
{
    char str1[100],str2[100];
    int result;

    inputStrings(str1,str2);

    result = compareStrings(str1,str2);

    output(result);

    return 0;
}