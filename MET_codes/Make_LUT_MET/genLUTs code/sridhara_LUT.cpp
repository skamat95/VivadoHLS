#include <stdint.h>
#include <iostream>
#include <iomanip>
using namespace std;
#define NCrds 7
#define NRgns 2
#define NHFRgns 8
int main(int argc, char** argv) {
  cout << "#ifndef LUTs_h" << endl;
  cout << "#define LUTs_h" << endl;
  cout << "#include <stdint.h>" << endl;
  cout << "// Rgn LUT" << endl;
  cout << "static const uint10_t rgnETLUT[0x400][NCrds*NRgns] = {" << endl;
  for(int i = 0; i < 0x400; i++) {
    for(int j = 0; j < NCrds*NRgns; j++) {
      uint32_t value = i * (1 + 0.1 * j) + 0.1 * j; // For the heck of it
      if(value > 0x3FF) value = 0x3FF;
      if(j == 0) cout << "{" << showbase << internal << setw(6) << setfill('0') << hex << value << ", ";
      else if(j == (NCrds*NRgns - 1)) cout << showbase << internal << setw(6) << setfill('0') << hex << value << "}";
      else cout << showbase << internal << setw(6) << setfill('0') << hex << value << ", ";
    }
    if(i != 0x3FF) cout << "," << endl;
  }
  cout << endl << "};" << endl;
  cout << "// HF LUT " << endl;
  cout << "static const uint10_t hfETLUT[0x400][NHFRgns] = {" << endl;
  for(int i = 0; i < 0x400; i++) {
    for(int j = 0; j < NHFRgns; j++) {
      uint32_t value = i * (1 + 0.1 * j) + 0.1 * j; // For the heck of it
      if(value > 0x3FF) value = 0x3FF;
      if(j == 0) cout << "{" << showbase << internal << setw(6) << setfill('0') << hex << value << ", ";
      else if(j == (NHFRgns - 1)) cout << showbase << internal << setw(6) << setfill('0') << hex << value << "}";
      else cout << showbase << internal << setw(6) << setfill('0') << hex << value << ", ";
    }
    if(i != 0x3FF) cout << "," << endl;
  }
  cout << endl << "};" << endl;
  cout << "#endif" << endl;
}