#include<stdio.h>
#include<stdlib.h>

typedef struct{
    int id;
    char name[50];
    float marks;
}Student;

void inputStudents(Student students[],int n){
    int i;
    for(i=0;i<n;i++){
        printf("Enter the details of student %d:\n",i+1);

        printf("ID:");
        scanf("%d",&students[i].id);

        printf("Name:");
        scanf("%s",students[i].name);

        printf("Marks:");
        scanf("%f",&students[i].marks);
    }
}

void writeToTextFile(Student students[],int n,const char *filename){
    FILE *fp = fopen(filename,"wb");

    if(fp == NULL){
        printf("Error opening file for writing.\n");
        exit(1);
    }

    fwrite(students,sizeof(Student),n,fp);

    fclose(fp);
}

int readFromTextFile(Student students[],const char *filename){
    int count,n;
    FILE *fp = fopen(filename,"rb");

    if(fp == NULL){
        printf("Error opening file for reading.\n");
        return 0;
    }

    count = fread(students,sizeof(Student),n,fp);

    return count;
}

void printStudents(Student students[],int n){
    int i;
    for(i=0;i<n;i++){
        printf("\nStudent %d\n",i+1);
        printf("ID: %d\n",students[i].id);
        printf("Name: %s\n",students[i].name);
        printf("Marks: %.2f\n",students[i].marks);
    }
}

int main(){
    int n,count;

    printf("Enter the number of Students:\n");
    scanf("%d",&n);

    Student students[n];
    
    inputStudents(students,n);

    writeToTextFile(students,n,"students.dat");

    count = readFromTextFile(students,"students.dat");

    printf("\nStudents details from file:\n");
    printStudents(students,n);

    return 0;
}