#include <stdint.h>
#include <iostream>
#include <iomanip>
using namespace std;
#define NCrds 7
#define NRgns 2
#define NHFRgns 8
int main(int argc, char** argv) {
  cout << "#ifndef sineLUTs_h" << endl;
  cout << "#define sineLUTs_h" << endl;
  cout << "#include <stdint.h>" << endl;
  cout << "#define resolution 2" << endl;
  cout << "size = 360/resolution;" << endl;
  cout << "// SINE LUT" << endl;
  cout << "static const uint8_t sineLUT[size+1] = {" << endl;
  for(int i = 0; i <= size; i += resolution) 
  {
  uint8_t value = sin(i); 
  
  }
    
  cout << endl << "};" << endl;
  cout << "#endif" << endl;
}