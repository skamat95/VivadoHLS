#include <stdint.h>
#include <stdio.h>
#include <iostream>
#include <iomanip>
#include <math.h>
using namespace std;
#define resolution 5
float pi = acos(-1.0);
//printf("%d\n",pi);
int max_val = 50;
int size = (2*max_val)/resolution;
float value;
float input = -max_val;

int main(int argc, char** argv) {
  cout << "#ifndef atanLUTs_h" << endl;
  cout << "#define atanLUTs_h" << endl;
  cout << "#include <stdint.h>" << endl;
  cout << "// ATAN LUT" << endl;
  cout << "static const uint8_t atanLUT[size+1] = {" << endl;
  for(int i = 0; i <= size; i ++) 
  {
    
    value = atan(input);  //value is in radians here
    input += resolution;
    value = (value/pi)*180; //in degrees
      if(i!=size) 
    {
        cout << showbase << internal << setw(6) << setfill('0') << hex << value << ", ";
    }
  }
    
  cout << endl << "};" << endl;
  cout << "#endif" << endl;
}