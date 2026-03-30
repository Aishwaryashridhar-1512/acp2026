#include<stdio.h>
#include<stdlib.h>

void input(char *str){
    int i = 0;
    fgets(str,100,stdin);
    while(str[i] != '\0'){
        if(str[i] == '\n'){
            str[i] = '\0';
        }
        i++;
    }
}

void count(char *str, int *vowels, int *consonants){
    int i = 0;
    while(str[i] != '\n' && str[i] != '\0'){
        char ch = str[i];
        if(ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u'||
        ch == 'A' || ch == 'E' || ch == 'I' || ch == 'O' || ch == 'U'){
            (*vowels)++;
        }
        else if((ch >= 'a' && ch <= 'z')||(ch >= 'A' && ch <= 'Z')){
            (*consonants)++;
        }
        i++;
    }
}

void display(char *str, int vowels, int consonants){
    printf("Given String: %s\n",str);
    printf("Number of vowels: %d\n",vowels);
    printf("Number of consonants: %d\n",consonants);
}

int main(){
    char str[100];
    int vowels = 0,consonants = 0;

    printf("Enter a String:");
    input(str);

    count(str,&vowels,&consonants);

    display(str,vowels,consonants);

    return 0;
}