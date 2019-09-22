#include <stdio.h>

double recursividad(int n){
    if(n<1){
        return 1;
    }
    else{
        return(2*recursividad(n-1));
    }
}

int main(){
    int n=5;
    double num;
    num=recursividad(n);
    printf("%f\n",num);
    return 0;
}
