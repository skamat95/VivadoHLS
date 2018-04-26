#include <stdint.h>
#include <stdio.h>
#include <iostream>
#include <iomanip>
#include <math.h>
using namespace std;
#define resolution_x 5
#define resolution_y 5
float pi = acos(-1.0);
int max_val_x = 50;
int size_x = (2*max_val_x)/resolution_x;
int max_val_y = 50;
int size_y = (2*max_val_y)/resolution_y;

float value = 10;
float in_x = -max_val_x;
float in_y = -max_val_y;

int main(int argc, char** argv) {
  cout << "#ifndef atan2LUTs_h" << endl;
  cout << "#define atan2LUTs_h" << endl;
  cout << "#include <stdint.h>" << endl;
  cout << "// ATAN2 LUT" << endl;
 

// cout << "static const uint8_t atan2LUT[21][21] = {" << endl;
/*
  for(int i = 0; i <= size_x; i ++) 
  {
	for(int j = 0; j <= size_y; j ++)
	{
    
	    value = atan2(0,1);  //value is in radians here
	    in_x += resolution_x;
	    in_y += resolution_y;
	    value = (value/pi)*180; //in degrees
	      if(i!=size_y) 
	    {
		cout << showbase << internal << setw(6) << setfill('0') << hex << value << ",";
	    }

	}
	if(i!=size_x)
	{
		cout << showbase << internal << setw(6) << setfill('0') << hex << value << ";";
	}
  }
    
*/
 value = atan2(10.0,-10.0);
value = (value/pi)*180; //in degrees
printf("%f\n",value);
 //cout << endl << "};" << endl;
  cout << "#endif" << endl;
}
