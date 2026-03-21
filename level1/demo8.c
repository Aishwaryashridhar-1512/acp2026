#include<stdio.h>
#include<string.h>

void input(char *str){
    fgets(str,100,stdin);
    str[strcspn(str, "\n")] = '\0'; 
}

void concatenate_strings(char *str1,char *str2){
    int i = 0,j = 0;
    while(str1[i] != '\0'){
        i++;
    }
    while(str2[j] != '\0'){
        str1[i] = str2[j];
        i++;
        j++;
    }
    str1[i] = '\0';
}

void display(char *str){
    printf("%s\n",str);
}

int main()
{
    char str1[100],str2[100];

    printf("Enter first string:\n");
    input(str1);

    printf("Enter second string:\n");
    input(str2);

    concatenate_strings(str1,str2);

    
    printf("Concatenated string:\n");
    display(str1);
    
    return 0;
}