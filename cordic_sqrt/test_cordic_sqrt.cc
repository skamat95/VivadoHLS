#include <ap_int.h>
#include <iostream>
#include <stdio.h>
using namespace std;

int const length = 20; //Total length of the variable
int const number = 17; //Number of bits before the decimal

 typedef ap_fixed<length, number> in;

 int main() {
	 // n,m,r=0 skip pre-, post-process

     in a = 9;
     in z; // output

     int q = length - number;
     int p = number;

     in one = 1;

     in x = a + (one << q);
     in y = a - (one << q);

     in x_tmp;

     for (int i = 1; i <= 15; i++) {
    	 if (y<0) {
    		    x_tmp = x;
    		    x = x + (y << i);
    	            y = y + (x_tmp << i);
    	 }
    	 else
    	 {
    		    x_tmp = x;
    	            x = x - y/(y<<i);
    	            y = y - x/(x<<i);

    	 }
     }

     in tmp  = 0.603748068;  //tmp = 1/1.65632
     cout <<"a: " << a <<"\n";
     cout <<"x: " << x <<"\n";
     z = x*tmp;
     cout <<"z: " << z <<"\n";

	 return 0;
 };
