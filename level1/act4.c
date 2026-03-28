#include<stdio.h>

typedef struct{
    char player_name[50];
    int jersey_number;
    int runs_scored;
}Player;

void readPlayers(int n,Player p[]){
    int i;

    for(i=0;i<n;i++){
        printf("\nEnter the details of Player %d\n",i+1);

        printf("Name:");
        scanf("%s",p[i].player_name);

        printf("Jersey Number:");
        scanf("%d",&p[i].jersey_number);

        printf("Runs Scored:");
        scanf("%d",&p[i].runs_scored);
    }
}

float calculateAverageRuns(int n,Player p[]){
    float average_runs;
    int i,sum = 0;

    for(i=0;i<n;i++){

        sum += p[i].runs_scored;

    }
    average_runs = (float)sum / 11;
    return average_runs;
}

int main(){
    int n,i;
    float average_runs;

    n = 11;

    Player p[n];

    readPlayers(n,p);

    average_runs = calculateAverageRuns(n,p);

    printf("The average runs scored by the team: %.2f",average_runs);

    return 0;
}