#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int flightNumber;
    char destination[50];
    float ticketPrice;
} Flight;

void inputFlights(Flight f[], int n) {
    for (int i = 0; i < n; i++) {
        printf("\nEnter details of Flight %d\n", i + 1);

        printf("Flight Number: ");
        scanf("%d", &f[i].flightNumber);

        printf("Destination: ");
        scanf("%s", f[i].destination);

        printf("Ticket Price: ");
        scanf("%f", &f[i].ticketPrice);
    }
}

void saveToBinary(Flight f[], int n, const char *filename) {
    FILE *fp = fopen(filename, "wb");

    if (fp == NULL) {
        printf("Error opening file for writing.\n");
        return;
    }

    fwrite(f, sizeof(Flight), n, fp);

    fclose(fp);

    printf("\nData successfully written to binary file.\n");
}

Flight findMostExpensive(const char *filename) {
    FILE *fp = fopen(filename, "rb");

    Flight temp, maxFlight;

    if (fp == NULL) {
        printf("Error opening file for reading.\n");
        exit(1);
    }

    fread(&maxFlight, sizeof(Flight), 1, fp);

    while (fread(&temp, sizeof(Flight), 1, fp)) {
        if (temp.ticketPrice > maxFlight.ticketPrice) {
            maxFlight = temp;
        }
    }

    fclose(fp);

    return maxFlight;
}

void displayTopFlight(Flight f) {
    printf("\nFlight with Highest Ticket Price:\n");
    printf("Flight Number: %d\n", f.flightNumber);
    printf("Destination: %s\n", f.destination);
    printf("Ticket Price: %.2f\n", f.ticketPrice);
}

int main() {
    int n;

    printf("Enter number of flights: ");
    scanf("%d", &n);

    if (n <= 0) {
        printf("Invalid number of flights.\n");
        return 1;
    }

    Flight *flights = (Flight *)malloc(n * sizeof(Flight));

    if (flights == NULL) {
        printf("Memory allocation failed.\n");
        return 1;
    }

    inputFlights(flights, n);

    saveToBinary(flights, n, "flights.bin");

    Flight expensiveFlight = findMostExpensive("flights.bin");

    displayTopFlight(expensiveFlight);

    free(flights);

    return 0;
}
