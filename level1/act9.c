#include<stdio.h>
#include<stdlib.h>

typedef struct {
    int id;
    char name[50];
    float salary;
}Employee;

void inputEmployees(Employee e[],int n){
    for(int i=0;i<n;i++){
        printf("\nEnter details of Employee %d\n", i + 1);

        printf("ID: ");
        scanf("%d",&e[i].id);

        printf("Name: ");
        scanf(" %[^\n]",e[i].name);  // allows spaces

        printf("Basic Salary: ");
        scanf("%f",&e[i].salary);
    }
}

void writeToTextFile(Employee e[], int n, const char *filename){
    FILE *fp = fopen(filename, "w");

    if (fp == NULL) {
        printf("Error opening file.\n");
        exit(1);
    }

    for (int i = 0; i < n; i++){
        fprintf(fp, "%d,%s,%.2f\n", e[i].id, e[i].name, e[i].salary);
    }

    fclose(fp);
    printf("\nData successfully written to file.\n");
}

float calculateTotalPayroll(const char *filename) {
    FILE *fp = fopen(filename, "r");
    float total = 0, salary;
    int id;
    char name[50];

    if (fp == NULL) {
        printf("Error opening file.\n");
        exit(1);
    }

    while (fscanf(fp, "%d,%[^,],%f", &id, name, &salary) != EOF) {
        total += salary;
    }

    fclose(fp);
    return total;
}

void displayExpenditure(float total) {
    printf("\nTotal Salary Expenditure: %.2f\n", total);
}

int main() {
    int n;
    float total;
    char filename[] = "payroll.txt";

    printf("Enter number of employees: ");
    scanf("%d", &n);

    if (n <= 0) {
        printf("Invalid number of employees.\n");
        return 1;
    }

    Employee e[n];

    inputEmployees(e, n);
    writeToTextFile(e, n, filename);

    total = calculateTotalPayroll(filename);
    displayExpenditure(total);

    return 0;
}
