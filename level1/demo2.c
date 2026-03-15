#include<stdio.h>

typedef struct{
    char name[20];
    float length;
    float width;
    float area;
}Rectangle;

Rectangle input()
{
    Rectangle rect;
    printf("Enter the name of the rectangle:\n");
    scanf("%s", rect.name);

    printf("Enter the length of the rectangle:\n");
    scanf("%f",&rect.length);

    printf("Enter the width of the rectangle:\n");
    scanf("%f",&rect.width);

    return rect;
}
float calculate_area(Rectangle rect)
{
    return rect.length*rect.width;
}

void compare_areas(Rectangle r1,Rectangle r2,Rectangle r3)
{
    if (r1.area>r2.area && r1.area>r3.area)
    {
        printf("%s has the largest area: %.2f\n",r1.name,r1.area);
    }
    else if(r2.area>r1.area && r2.area>r3.area)
    {
        printf("%s has the largest area: %.2f\n",r2.name,r2.area);
    }
    else if(r3.area>r1.area && r3.area>r2.area)
    {
        printf("%s has the largest area: %.2f\n",r3.name,r3.area);
    }
    else if(r1.area==r2.area && r1.area>r3.area)
    {
        printf("%s and %s have the largest area: %.2f\n",r1.name,r2.name,r1.area);
    }
    else if(r1.area>r2.area && r1.area==r3.area)
    {
        printf("%s and %s have the largest area: %.2f\n",r1.name,r3.name,r1.area);
    }
    else if(r2.area>r1.area && r2.area==r3.area)
    {
        printf("%s and %s have the largest area: %.2f\n",r2.name,r3.name,r2.area);
    }
     else
    {
        printf("All rectangles have the same area: %.2f\n",r1.area);
    }
}
int main()
{
    Rectangle r1,r2,r3;
    r1=input();
    r1.area=calculate_area(r1); 
    r2=input(); 
    r2.area=calculate_area(r2); 
    r3=input(); 
    r3.area=calculate_area(r3);
    compare_areas(r1,r2,r3);
    return 0;
}
