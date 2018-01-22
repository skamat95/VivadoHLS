#include <ap_int.h>
#include <iostream>
#include <stdio.h>
using namespace std;

int const size3_1 = 32;
int const size3_2 = 12;

 typedef ap_fixed<size3_1, size3_2> fix3;

 int main() {
	 // n,m,r=0 skip pre-, post-process

     fix3 a = 9;
     fix3 z; // output

     int q = size3_1-size3_2;
     int p = size3_2;

     fix3 one = 1;

     fix3 x = a + (one << q);
     fix3 y = a - (one << q);

     fix3 x_tmp;

     for (int i = 1; i<=28; i++) {
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

     fix3 tmp  = 0.603748068;  //tmp = 1/1.65632
     cout <<"a: " << a <<"\n";
     cout <<"x: " << x <<"\n";
     z = x*tmp;
     cout <<"z: " << z <<"\n";

	 return 0;
 };
