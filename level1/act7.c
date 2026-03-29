#include <stdio.h>

void input(char *name) {
    fgets(name, 50, stdin);

    int i = 0;
    while (name[i] != '\0') {
        if (name[i] == '\n') {
            name[i] = '\0';
            break;
        }
        i++;
    }
}

int calculate_name_length(char *name) {
    int i = 0;

    while (name[i] != '\0') {
        i++;
    }

    return i;
}

void compare_output(int len1, int len2) {
    if (len1 > len2) {

        printf("Student 1 has the longer name.\n");
        
    } 
    
    else if (len2 > len1) {

        printf("Student 2 has the longer name.\n");

    } 
    
    else {
        
        printf("Both the students have names of equal length.\n");

    }
}

int main() {
    char name1[50], name2[50];
    int len1, len2;

    printf("Enter the name of Student 1: ");
    input(name1);

    printf("Enter the name of Student 2: ");
    input(name2);

    len1 = calculate_name_length(name1);
    len2 = calculate_name_length(name2);

    printf("Length of %s = %d\n", name1, len1);
    printf("Length of %s = %d\n", name2, len2);

    compare_output(len1, len2);

    return 0;
}