#include <stdint.h>
#include <stdio.h>
#include <iostream>
#include <iomanip>
#include <math.h>
using namespace std;
#define resolution 2
float pi = acos(-1.0);
int size = 360/resolution;
float value;
int angle = 0;

int main(int argc, char** argv) {
  cout << "#ifndef cosLUTs_h" << endl;
  cout << "#define cosLUTs_h" << endl;
  cout << "#include <stdint.h>" << endl;
  cout << "// COS LUT" << endl;
  cout << "static const float cosLUT[181] = {" << endl;
  for(int i = 0; i <= size; i ++) 
  {
	
  	value = cos(angle*(pi/180)); //converting angle(in deg) to sin() input in radians
	angle += resolution;
  	cout << showbase << internal << setw(6) << setfill('0') << hex << value << ", ";
	
  }
    
  cout << endl << "};" << endl;
  cout << "#endif" << endl;
}
