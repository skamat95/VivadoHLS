#include <stdint.h>
#include <stdio.h>
#include <iostream>
#include <iomanip>
#include <math.h>
using namespace std;
#define resolution 2
float pi = acos(-1.0);
//printf("%d\n",pi);
int size = 360/resolution;
float value;
int angle = 0;

int main(int argc, char** argv) {
  cout << "#ifndef sineLUTs_h" << endl;
  cout << "#define sineLUTs_h" << endl;
  cout << "#include <stdint.h>" << endl;
  cout << "// COS LUT" << endl;
  cout << "static const uint8_t sineLUT[size+1] = {" << endl;
  for(int i = 0; i <= size; i ++) 
  {
	
  	value = cos(angle*(pi/180)); //converting angle(in deg) to sin() input in radians
	angle += resolution;
  	cout << showbase << internal << setw(6) << setfill('0') << hex << value << ", ";
	
  }
    
  cout << endl << "};" << endl;
  cout << "#endif" << endl;
}
