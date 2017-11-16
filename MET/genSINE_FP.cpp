#include <stdint.h>
#include <stdio.h>
#include <iostream>
#include <iomanip>
#include <math.h>
#include "ap_fixed.h"
using namespace std;
#define NCrts 18
#define NTwrs 4
float pi = acos(-1.0);
float value;
int angle = 0;

int main(int argc, char** argv) {
  cout << "#ifndef sineLUTs_h" << endl;
  cout << "#define sineLUTs_h" << endl;
  cout << "#include <stdint.h>" << endl;
  cout << "// SINE LUT" << endl;
  cout << "static const ap_fixed<10,9> sineLUT[18][4] = {" << endl;
  for(int i = 1; i <= NCrts; i ++) 
  {
	for(int j = 1; j <= NTwrs; j++)
	{
	
	angle += 2.5;
  	value = sin(angle*(pi/180)); //converting angle(in deg) to sin() input in radians
	
	

	if(j == 1) 
	    {
		cout << "{" << showbase << internal << setw(6) << hex << value << ",";
	    }
	      else if(j != NTwrs) 
	    {
		cout << showbase << internal << setw(6) << hex << value << ",";
	    }
	      else if(j = NTwrs) 
	    {
		cout << showbase << internal << setw(6) << hex << value << "}";
	    }


	}
	if(i != NCrts)
	{
		cout << "," << endl;
	}
	
  }
    
  cout << endl << "};" << endl;
  cout << "#endif" << endl;
  return 0;
}



