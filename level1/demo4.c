#include<stdio.h>
#include<string.h>

typedef struct{
    int flight_number;
    char destination[50];
    int available_seats;
}Flight_t;

void readFlights(int n,Flight_t f[])
{
    int i;

    for(i=0;i<n;i++)
    {
        printf("\nEnter the details of FLight %d:\n",i+1);

        printf("Flight number:\n");
        scanf("%d",&f[i].flight_number);

        printf("Destination:\n");
        scanf("%s",f[i].destination);

        printf("Available Seats:\n");
        scanf("%d",&f[i].available_seats);
    }
}

void searchByDestination(int n,Flight_t f[],char searchDest[])
{
    int i,found = 0;

    for(i=0;i<n;i++)
    {
        if(strcmp(f[i].destination,searchDest) == 0 && f[i].available_seats > 0)
        {
            printf("Flight available!\n");
            printf("Flight Number: %d\n",f[i].flight_number);
            printf("Number of seats available: %d\n",f[i].available_seats);
            found = 1;
        }
    }
    if(found == 0)
    {
        printf("No flight available to %s\n",searchDest);
    }
}

int main()
{
    int n = 4;
    Flight_t f[4];
    char searchDest[50];
    
    readFlights(n,f);

    printf("Enter your Destination:\n");
    scanf("%s",searchDest);

    searchByDestination(n,f,searchDest);

    return 0;
}