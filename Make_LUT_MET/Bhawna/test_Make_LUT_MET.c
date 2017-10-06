#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <math.h>
#include "Make_LUT_MET.h"


#define NCrts 18
#define NCrds 7
#define NRgns 2


bool writeLinkMapHT(uint16_t rgnET[NCrts*NCrds*NRgns], uint16_t rgnPhi[NCrts], uint16_t MET[3]) {
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

bool writeInputFile(uint16_t rgnET[NCrts*NCrds*NRgns], uint16_t rgnPhi[NCrts], bool last = false) {
  static bool first = true;
  static int count = 0;
  static FILE *f1;
  int i,j;
  int iRgn, iRgn1;
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
	  item0 = rgnET[iRgn];
	  item1 = rgnET[iRgn + 1];
	}
      }
      else if(i < 33) {
	iRgn1 = i * 12 + j * 2;
	if(iRgn1 < NCrts) {
	  item0 = rgnPhi[iRgn1];
	  item1 = rgnPhi[iRgn1 + 1];
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

bool writeOutputFile(uint16_t MET[3], bool last = false) {

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

bool makeTestData(int argc, char** argv, uint16_t rgnET[NCrts*NCrds*NRgns], uint16_t rgnPhi[NCrts]) {
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
  if(argc >= 2) {
    strncpy(pattern, argv[1], 64);
  }
  else {
    strcpy(pattern, "--default");
  }
  if(strncmp(pattern, "--random", strlen(pattern)) == 0) {
    for(iRgn = 0; iRgn < NCrts * NCrds * NRgns; iRgn++) {
      rgnET[iRgn] = 0x01;
    }
    for(iRgn1 = 0; iRgn1 < NCrts; iRgn1++) {
      rgnPhi[iRgn1] = 90;
    }
  }
  else if(strncmp(pattern, "--increasing", strlen(pattern)) == 0) {
    value = 0;
    for(iRgn = 0; iRgn < NCrts * NCrds * NRgns; iRgn++) {
      rgnET[iRgn] = value++;
    }
    value = 0;
    for(iRgn1 = 0; iRgn1 < NCrts ; iRgn1++) {
      rgnPhi[iRgn1] = value++;
    }
  }
  else if(strncmp(pattern, "--decreasing", strlen(pattern)) == 0) {
    value = NCrts * NCrds * NRgns;
    for(iRgn = 0; iRgn < NCrts * NCrds * NRgns; iRgn++) {
      rgnET[iRgn] = value--;
    }
    value = NCrts;
    for(iRgn1 = 0; iRgn1 < NCrts; iRgn1++) {
      rgnPhi[iRgn1] = value--;
    }
  }
  else if(strncmp(pattern, "--constant", strlen(pattern)) == 0) {
    value = 0;
    if(argc == 3) value = atoi(argv[2]);
    for(iRgn = 0; iRgn < NCrts * NCrds * NRgns; iRgn++) {
      rgnET[iRgn] = value;
    }
    for(iRgn1 = 0; iRgn1 < NCrts; iRgn1++) {
      rgnPhi[iRgn1] = value;
    }
  }
  else if(strncmp(pattern, "--fileinput", strlen(pattern)) == 0) {
    if(first) {
      first = false;
      // Open file
      if(argc == 3) f1 = fopen(argv[2], "r");
      else f1 = fopen("fileinput.txt", "r");
      // Skip three header lines
      for(i = 0; i < 3; i++) {
	if(fgets(junk, sizeof(junk), f1) == NULL) {
	  fprintf(stderr, "Aborting due to bad format of the input file header\n");
	  return false;
	}
      }
    }
    for(j = 0; j < 6; j++) {
      if(fscanf(f1, "%X", &count) == 1) {
	if(j != (count % 6)) {
	  fprintf(stderr, "Read error~?!\n");
	  return false;
	}
	for(i = 0; i < 67; i++) {
	  if(fscanf(f1, "%X", &value) == 1) {
	    item0 = value & 0xFFFF;
	    item1 = value >> 16;
	    if(i < 21) {
	      iRgn = i * 12 + j * 2;
	      if(iRgn < NCrts * NCrds * NRgns) {
		rgnET[iRgn] = item0;
		rgnET[iRgn + 1] = item1;
	      }
	    }
	    else if(i < 33) {
	      iRgn1 = i * 12 + j * 2;
	      if(iRgn1 < NCrts) {
		rgnPhi[iRgn1] = item0;
		rgnPhi[iRgn1 + 1] = item1;
	      }
	    }
	  }
	  else {
	    fprintf(stderr, "Error reading value\n");
	    return false;
	  }
	}
      }
      else {
	fprintf(stderr, "Error reading count\n");
	return false;
      }
    }
  }
  else {
    // Default test data; Construct it using indices for the fun of it!
    for(iRgn = 0; iRgn < NCrts * NCrds * NRgns; iRgn++) {
      rgnET[iRgn] = iRgn / 2;
    }
    for(iRgn1 = 0; iRgn1 < NCrts; iRgn1++) {
      rgnPhi[iRgn1] = iRgn1;
    }
  }
  return true;
}

int main(int argc, char **argv) {

	uint16_t rgnET[NCrts*NCrds*NRgns];
		uint16_t rgnPhi[NCrts];
		uint16_t MET[3];

		// Test data; Construct it using indices for the fun of it

		int iCrt;
		int iCrd;
		int iRgn;
		int i;
		for(iCrt = 0; iCrt < NCrts; iCrt++) {
			for(iCrd = 0; iCrd < NCrds; iCrd++) {
				for(iRgn = 0; iRgn < NRgns; iRgn++) {
					i = iCrt * NCrds * NRgns + iCrd * NRgns + iRgn;
					rgnET[i] = 1;
				}
			}
			rgnPhi[iCrt] = 90;
		}


		//Test code
		Make_LUT_MET(rgnET,rgnPhi,MET);

		printf("METx = %d\n",MET[0]);
		printf("METy = %d\n",MET[1]);
		printf("Theta = %d\n",MET[2]);

		return 0;

}





