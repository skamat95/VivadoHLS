#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <math.h>
#include "MET_LUT.h"

#include <ap_fixed.h>
#include <iostream>
#include <fstream>
#include <iomanip>
using namespace std;

#define NCrts 18
#define NCrds 7
#define NRgns 2
#define NTwrs 4

/*
bool write_genSINE() {
	//To generate sin LUT
	float pi = acos(-1.0);
	ap_fixed<4,1> value;
	double angle = 2.5;
	float conversion_factor = pi/180.0;


	ofstream f1;
	f1.open("sine1.h");


	f1 << "#ifndef sineLUTs_h\n";
	f1 << "#define sineLUTs_h\n";
	f1 << "#include <stdint.h>\n";
	f1 << "#include <ap_fixed.h>\n";
	f1 << "static const ap_fixed<4,1> sineLUT[18][4] = {";

	for(int i = 1; i <= NCrts; i ++)
	{
		for(int j = 1; j <= NTwrs; j++)
		{

			angle += 5;
			value = (ap_fixed<4,1>)sin(angle*conversion_factor); //converting angle(in deg) to sin() input in radians

			//printf("%f\n",value);
			if(j == 1)
			{
				f1 << "{" << showbase << internal << setw(4) << setprecision(1) << hex << value << ",";

			}
			  else if(j != NTwrs)
			{
				  f1 << showbase << internal << setw(4) << setprecision(1) << hex << value << ",";

			}
			  else if(j == NTwrs)
			{
				  f1 << showbase << internal << setw(4) << setprecision(1) << hex << value << "}";

			}

		}
		if(i != NCrts)
		{
			f1 << ",\n";
		}

	}

	f1 << "};\n";
	f1 << "#endif";
	f1.close();
	return true;

}

bool write_genCOS() {
	//To generate cos LUT
	float pi = acos(-1.0);
	ap_fixed<4,1> value;
	double angle = 0;
	float conversion_factor = pi/180.0;


	ofstream f1;
	f1.open("cos1.h");


	f1 << "#ifndef cosLUTs_h\n";
	f1 << "#define cosLUTs_h\n";
	f1 << "#include <stdint.h>\n";
	f1 << "#include <ap_fixed.h>\n";
	f1 << "static const ap_fixed<4,1> cosLUT[18][4] = {\n";

	for(int i = 1; i <= NCrts; i ++)
	{
		for(int j = 1; j <= NTwrs; j++)
		{

			angle += 2.5;
			value = (ap_fixed<4,1>)cos(angle*conversion_factor); //converting angle(in deg) to sin() input in radians

			//printf("%f\n",value);
			if(j == 1)
			{
				f1 << "{" << showbase << internal << setw(4) << setprecision(1) << hex << value << ",";

			}
			  else if(j != NTwrs)
			{
				  f1 << showbase << internal << setw(4) << setprecision(1) << hex << value << ",";

			}
			  else if(j == NTwrs)
			{
				  f1 << showbase << internal << setw(4) << setprecision(1) << hex << value << "}";

			}

		}
		if(i != NCrts)
		{
			f1 << ",\n";
		}

	}

	f1 << "\n};\n";
	f1 << "#endif";
	f1.close();
	return true;

}

*/

bool writeLinkMapHT(uint16_t rgn_in[NCrts*NCrds*NRgns], ap_fixed<20,17> MET[3]) {
  // This code is to write suitable mapping of inputs to signals in the CTP7_HLS project from Ales

  // Block 1 of User Code
  int iRgn, iRgn1, link, loBit, hiBit;
  static FILE *f1;
  f1 = fopen("link_data_map.txt","w");
  for(iRgn = 0; iRgn < NCrts*NCrds*NRgns; iRgn++) {
    fprintf(f1, "rgnET_%d : IN STD_LOGIC_VECTOR (15 downto 0);\n", iRgn);
  }
  for(iRgn1 = 0; iRgn1 < NCrts; iRgn1++) {
    fprintf(f1, "rgnPhi_%d : IN STD_LOGIC_VECTOR (15 downto 0);\n", iRgn1);
  }
  fprintf(f1, "MET_0 : OUT STD_LOGIC_VECTOR (15 downto 0);\n");
  fprintf(f1, "MET_1 : OUT STD_LOGIC_VECTOR (15 downto 0);\n");
  fprintf(f1, "MET_2 : OUT STD_LOGIC_VECTOR (15 downto 0);\n\n\n");
  // Block 2
  for(iRgn = 0; iRgn < NCrts*NCrds*NRgns; iRgn++) {
    fprintf(f1, "signal rgnET_%d : STD_LOGIC_VECTOR(15 DOWNTO 0);\n", iRgn);
  }
  for(iRgn1 = 0; iRgn1 < NCrts; iRgn1++) {
    fprintf(f1, "signal rgnPhi_%d : STD_LOGIC_VECTOR(15 DOWNTO 0);\n", iRgn1);
  }
  fprintf(f1, "signal MET_0 : STD_LOGIC_VECTOR (15 downto 0);\n");
  fprintf(f1, "signal MET_1 : STD_LOGIC_VECTOR (15 downto 0);\n");
  fprintf(f1, "signal MET_2 : STD_LOGIC_VECTOR (15 downto 0);\n\n\n");
  // Block 3
  for(iRgn = 0; iRgn < NCrts*NCrds*NRgns; iRgn++) {
    fprintf(f1, "rgnET_%d => rgnET_%d,\n", iRgn, iRgn);
  }
  for(iRgn1 = 0; iRgn1 < NCrts; iRgn1++) {
    fprintf(f1, "rgnPhi_%d => rgnPhi_%d,\n", iRgn1, iRgn1);
  }
  fprintf(f1, "MET_0 => MET_0,\n");
  fprintf(f1, "MET_1 => MET_1,\n");
  fprintf(f1, "MET_2 => MET_2,\n\n\n");
  // Block 4
  for(iRgn = 0; iRgn < NCrts*NCrds*NRgns; iRgn++) {
    // Each link can carry 192-bits, or 12x16-bits of data
    // Each iRgn needs 16 bits
    link = (iRgn / 12);
    loBit = (iRgn % 12) * 16;
    hiBit = loBit + 15;
    fprintf(f1, "rgnET_%d <= s_INPUT_LINK_ARR( %d )(%d downto %d);\n", iRgn, link, hiBit, loBit);
  }
  for(iRgn1 = 0; iRgn1 < NCrts; iRgn1++) {
    // Each link can carry 192-bits, or 12x16-bits of data
    // Each iHFRgn needs 16 bits
    link = (iRgn1 / 12) + 21;
    loBit = (iRgn1 % 12) * 16;
    hiBit = loBit + 15;
    fprintf(f1, "rgnPhi_%d <= s_INPUT_LINK_ARR( %d )(%d downto %d);\n", iRgn1, link, hiBit, loBit);
  }
  fprintf(f1, "s_OUTPUT_LINK_ARR( 0 )(15 downto 0) <= MET_0;\n");
  fprintf(f1, "s_OUTPUT_LINK_ARR( 0 )(31 downto 16) <= MET_1;\n");
  fprintf(f1, "s_OUTPUT_LINK_ARR( 0 )(47 downto 32) <= MET_2;\n");
  return true;
}

bool writeInputFile(uint16_t rgn_in[NCrts*NCrds*NRgns], bool last) {
  static bool first = true;
  static int count = 0;
  static FILE *f1;
  int i,j;
  int iRgn = 0, iRgn1 = 0;
  uint16_t item0 = 0;
  uint16_t item1 = 0;
  if(first) {
    first = false;
    f1 = fopen("input_link_data.txt","w");
    if( f1 == NULL){
      fprintf(stderr, "\n Error opening input file");
      return false;
    }
    // Write header
    for (i=0; i < 945; i++)fprintf(f1,"=");
    fprintf(f1,"\nInput ");
    for (i=0; i < 67; i++) fprintf(f1,"       LINK_%02d",i);
    fprintf(f1,"\n");
    for (i=0; i < 945; i++) fprintf(f1,"=");
  }

  for(j = 0; j < 6 && count < 1024; j++, count++) {
    fprintf(f1,"\n0x%05X", count);
    for(i=0; i< 67; i++) {
      item0 = 0;
      item1 = 0;
      if(i < 21) {
	iRgn = i * 12 + j * 2;
	if(iRgn < NCrts * NCrds * NRgns) {
	  item0 = rgn_in[iRgn];
	  item1 = rgn_in[iRgn + 1];
	}
      }

      fprintf(f1,"    0x%04X%04X", item1, item0);
    }
  }
  if(last || count > 1017) {
    for(; count < 1024; count++) {
      fprintf(f1,"\n0x%05X", count);
      for(i=0; i< 67; i++) {
	fprintf(f1,"    0x00000000");
      }
    }
  }
  return true;
}

/*
bool writeOutputFile(ap_fixed<20,17> MET[3], bool last) {

  static bool first = true;
  static int count = 0;
  static FILE *f1;

  int i,j;

  if(first) {
    first = false;
    f1 = fopen("output_link_data.txt","w");
    if( f1 == NULL){
      fprintf(stderr, "\n Error opening output file");
      return false;
    }
    // Write header
    for (i=0; i < 679; i++) fprintf(f1,"=");
    fprintf(f1,"\nOutput ");
    for (i=0; i < 48; i++)  fprintf(f1,"       LINK_%02d",i);
    fprintf(f1,"\n");
    for (i=0; i < 679; i++) fprintf(f1,"=");
  }

  // Pack the three 16-bit outputs in link number 0 bits 0-15, 16-31 and 32-47
  for(j = 0; j < 6 && count < 1024; j++, count++) {
    fprintf(f1,"\n0x%05X", count);
    for(i=0; i< 48; i++)
      {
	if(j == 0 && i == 0)
	  fprintf(f1,"    0x%04X%04X", MET[1], MET[0]);
	if(j == 1 && i == 0)
	  fprintf(f1,"    0x%08X", MET[2]);
	else
	  fprintf(f1,"    0x00000000");
      }
  }

  // Fill in zeros for the rest, when last event is reached
  if(last || count > 1017) {
    for(; count < 1024; count++) {
      fprintf(f1,"\n0x%05X", count);
      for(i=0; i< 48; i++) {
	fprintf(f1,"    0x00000000");
      }
    }
  }

  return true;

}
*/
bool makeTestData(int argc, char** argv, uint16_t rgn_in[NCrts*NCrds*NRgns]) {
  static FILE *f1;
  static bool first = true;
  uint32_t count;
  int i,j;
  int iRgn, iRgn1;
  uint16_t item0 = 0;
  uint16_t item1 = 0;
  uint32_t value = 0;
  char junk[1024];
  char pattern[64];



    // Default test data; Construct it using indices for the fun of it!
    for(iRgn = 0; iRgn < NCrts * NCrds * NRgns; iRgn++) {
      rgn_in[iRgn] = 1;
    }


  return true;
}

int main(int argc, char **argv) {

	uint16_t rgn_in[NCrts*NCrds*NRgns];
	ap_fixed<20,17>  MET[2];
	ap_fixed<40,35> MET_res;
	ap_fixed<40,35> MET_sq[2] = {0,0};

	//bool success_sin = write_genSINE();
	//bool success_cos = write_genCOS();
		// Test data; Construct it using indices for the fun of it

	 uint16_t temp;

		int iCrt;
		int iCrd;
		int iRgn;
		int i;
		int event = 0;
		/*
		for(iCrt = 0; iCrt < NCrts; iCrt++) {
			for(iCrd = 0; iCrd < NCrds; iCrd++) {
				for(iRgn = 0; iRgn < NRgns; iRgn++) {
					i = iCrt * NCrds * NRgns + iCrd * NRgns + iRgn;
					rgnET[i] = 1;
				}
			}
			rgnPhi[iCrt] = 46;
		}
	*/

		bool last = false;
		// Event loop - 170 events maximum can be written out

		 for(event = 0; event < 170; event++) {

		    // Mark last event
		    if(event == 169) last = true;

		    // Make test data

		    if(!makeTestData(argc, argv, rgn_in)) return 999;

		//Test code
		MET_O(rgn_in, MET, MET_sq, MET_res);

		// Save input and output
		   // if(!writeInputFile(rgn_in, last)) return 2;
		    //if(!writeOutputFile(MET, last)) return 3;
		 }

		 //if(!writeLinkMapHT(rgn_in, MET)) return 4;

		   printf("Test succeeded\n");

		std::cout << showbase << internal << setw(20) << setprecision(5) << hex << MET[0] << ",";
		std::cout << showbase << internal << setw(20) << setprecision(5) << hex << MET[1] << ",";
		std::cout << showbase << internal << setw(40) << setprecision(5) << hex << MET_sq[0] << ",";
		std::cout << showbase << internal << setw(40) << setprecision(5) << hex << MET_sq[1] << ",";
		std::cout << showbase << internal << setw(40) << setprecision(5) << hex << MET_res << ",";

		return 0;

}

