#include "ClusterFinder.hh"
#include "ClusterTrackLinker.hh"

#include <stdlib.h>
#include <math.h>
#include <stdio.h>
#include <iostream>
#include <algorithm>
using namespace std;

double flat(double range) {
  long int r = random();
  double rDouble = r;
  double rMax = RAND_MAX;
  double flat = range * r / rMax;
  return flat;
}

int poisson(double mean) {
  static double oldMean = -1;
  static double g;
  if(mean != oldMean) {
    oldMean = mean;
    if(mean == 0) {
      g = 0;
    }
    else {
      g = exp(-mean);
    }
  }    
  double em = -1;
  double t = 1;
  do {
    em++;
    t *= flat(1.);
  } while(t > g);
  return em;
}

void WriteLinkMapCTL(
		uint10_t clusterET[NCaloLayer1Eta][NCaloLayer1Phi],
		uint3_t peakEta[NCaloLayer1Eta][NCaloLayer1Phi],
		uint3_t peakPhi[NCaloLayer1Eta][NCaloLayer1Phi],
		uint10_t trackPT[MaxTracks],
		uint9_t trackEta[MaxTracks],
		uint10_t trackPhi[MaxTracks],
		uint10_t linkedTrackPT[MaxTracks],
		uint9_t linkedTrackEta[MaxTracks],
		uint10_t linkedTrackPhi[MaxTracks],
		ap_fixed<8,6> linkedTrackQuality[MaxTracks],
		uint10_t neutralClusterET[MaxNeutralClusters],
		uint9_t neutralClusterEta[MaxNeutralClusters],
		uint10_t neutralClusterPhi[MaxNeutralClusters])
{
  // This code is to write suitable mapping of inputs to signals in the CTP7_HLS project from Ales
  // Block 1 of User Code
  int iRgn, jRgn, mRgn, hRgn, iHFRgn, link, loBit, hiBit;
  //ClusterTrackLinker
  //printf("\n----------------ClusterTrackLinker---------------\n\n");
  for(mRgn = 0; mRgn < NCaloLayer1Eta; mRgn++){
		for (hRgn =0; hRgn < NCaloLayer1Phi; hRgn++)
		{
		 printf("ClusterET_%d_%d : IN STD_LOGIC_VECTOR (9 downto 0);\n", mRgn,hRgn);
		}
	}
    printf("\n");

  for(mRgn = 0; mRgn < NCaloLayer1Eta; mRgn++){
        for (hRgn =0; hRgn < NCaloLayer1Phi; hRgn++)
        {
           printf("peakEta_%d_%d : IN STD_LOGIC_VECTOR (2 downto 0);\n", mRgn,hRgn);
        }
      }
  printf("\n");
  for(mRgn = 0; mRgn < NCaloLayer1Eta; mRgn++){
        for (hRgn =0; hRgn < NCaloLayer1Phi; hRgn++)
        {
           printf("peakPhi_%d_%d : IN STD_LOGIC_VECTOR (2 downto 0);\n", mRgn,hRgn);
        }
      }
  printf("\n");

  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("trackPT_%d : IN STD_LOGIC_VECTOR (9 downto 0);\n",hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("trackEta_%d : IN STD_LOGIC_VECTOR (8 downto 0);\n",hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("trackPhi_%d : IN STD_LOGIC_VECTOR (9 downto 0);\n",hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("linkedTrackPT_%d : OUT STD_LOGIC_VECTOR (9 downto 0);\n",hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("linkedTrackEta_%d : OUT STD_LOGIC_VECTOR (8 downto 0);\n",hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("linkedTrackPhi_%d : OUT STD_LOGIC_VECTOR (9 downto 0);\n",hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("linkedTrackQuality_%d : OUT STD_LOGIC_VECTOR (7 downto 0);\n",hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxNeutralClusters; hRgn++)
        {
           printf("neutralClusterET_%d : OUT STD_LOGIC_VECTOR (9 downto 0);\n",hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxNeutralClusters; hRgn++)
        {
           printf("neutralClusterEta_%d : OUT STD_LOGIC_VECTOR (8 downto 0);\n",hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxNeutralClusters; hRgn++)
        {
           printf("neutralClusterPhi_%d : OUT STD_LOGIC_VECTOR (9 downto 0);\n",hRgn);
        }

  //-------------------------------------------------------------------------------------------------
  // Block 2
  //  int iRgn, jRgn, mRgn, hRgn iHFRgn, link, loBit, hiBit;

  //ClusterTrackLinker
  //printf("\n----------------ClusterTrackLinker---------------\n\n");
  for(mRgn = 0; mRgn < NCaloLayer1Eta; mRgn++){
		for (hRgn =0; hRgn < NCaloLayer1Phi; hRgn++)
		{
		 printf("signal ClusterET_%d_%d : STD_LOGIC_VECTOR (9 downto 0);\n", mRgn,hRgn);
		}
      }
    printf("\n");


  for(mRgn = 0; mRgn < NCaloLayer1Eta; mRgn++){
        for (hRgn =0; hRgn < NCaloLayer1Phi; hRgn++)
        {
           printf("signal peakEta_%d_%d : STD_LOGIC_VECTOR (2 downto 0);\n", mRgn,hRgn);
        }
      }
  printf("\n");
  for(mRgn = 0; mRgn < NCaloLayer1Eta; mRgn++){
        for (hRgn =0; hRgn < NCaloLayer1Phi; hRgn++)
        {
           printf("signal peakPhi_%d_%d : STD_LOGIC_VECTOR (2 downto 0);\n", mRgn,hRgn);
        }
      }
  printf("\n");

  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("signal trackPT_%d : STD_LOGIC_VECTOR (9 downto 0);\n",hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("signal trackEta_%d : STD_LOGIC_VECTOR (8 downto 0);\n",hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("signal trackPhi_%d : STD_LOGIC_VECTOR (9 downto 0);\n",hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("signal linkedTrackPT_%d : STD_LOGIC_VECTOR (9 downto 0);\n",hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("signal linkedTrackEta_%d : STD_LOGIC_VECTOR (8 downto 0);\n",hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("signal linkedTrackPhi_%d : STD_LOGIC_VECTOR (9 downto 0);\n",hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("signal linkedTrackQuality_%d : STD_LOGIC_VECTOR (7 downto 0);\n",hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxNeutralClusters; hRgn++)
        {
           printf("signal neutralClusterET_%d : STD_LOGIC_VECTOR (9 downto 0);\n",hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxNeutralClusters; hRgn++)
        {
           printf("signal neutralClusterEta_%d : STD_LOGIC_VECTOR (8 downto 0);\n",hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxNeutralClusters; hRgn++)
        {
           printf("signal neutralClusterPhi_%d : STD_LOGIC_VECTOR (9 downto 0);\n",hRgn);
        }

  //-------------------------------------------------------------------------------------
  // Block 3

  //ClusterTrackLinker
  //printf("\n----------------ClusterTrackLinker---------------\n\n");
  for(mRgn = 0; mRgn < NCaloLayer1Eta; mRgn++){
		for (hRgn =0; hRgn < NCaloLayer1Phi; hRgn++)
		{
		 printf("ClusterET_%d_%d => ClusterET_%d_%d,\n", mRgn,hRgn,mRgn,hRgn);
		}
	 }
    printf("\n");

  for(mRgn = 0; mRgn < NCaloLayer1Eta; mRgn++){
        for (hRgn =0; hRgn < NCaloLayer1Phi; hRgn++)
        {
           printf("peakEta_%d_%d => peakEta_%d_%d,\n", mRgn,hRgn,mRgn,hRgn);
        }
      }
  printf("\n");
  for(mRgn = 0; mRgn < NCaloLayer1Eta; mRgn++){
        for (hRgn =0; hRgn < NCaloLayer1Phi; hRgn++)
        {
          printf("peakPhi_%d_%d => peakPhi_%d_%d,\n", mRgn,hRgn,mRgn,hRgn);
        }
      }
  printf("\n");

  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("trackPT_%d => trackPT_%d,\n", hRgn,hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("trackEta_%d => trackEta_%d,\n", hRgn,hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("trackPhi_%d => trackPhi_%d,\n", hRgn,hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("linkedTrackPT_%d => linkedTrackPT_%d,\n", hRgn,hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("linkedTrackEta_%d => linkedTrackEta_%d,\n", hRgn,hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("linkedTrackPhi_%d => linkedTrackPhi_%d,\n", hRgn,hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           printf("linkedTrackQuality_%d => linkedTrackQuality_%d,\n", hRgn,hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxNeutralClusters; hRgn++)
        {
           printf("neutralClusterET_%d => neutralClusterET_%d,\n",hRgn,hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxNeutralClusters; hRgn++)
        {
           printf("neutralClusterEta_%d => neutralClusterEta_%d,\n",hRgn,hRgn);
        }
  printf("\n");
  for (hRgn =0; hRgn < MaxNeutralClusters; hRgn++)
        {
           printf("neutralClusterPhi_%d => neutralClusterPhi_%d,\n",hRgn,hRgn);
        }

//---------------------------------------------------------------------------------------------------------------
  // Block 4
/*
  printf("======================================================================================")
  for(iRgn = 0; iRgn < NCrts*NCrds*NRgns; iRgn++) {
    // Each link can carry 192-bits, or 12x16-bits of data
    // Each iRgn needs 16 bits
    link = (iRgn / 12);
    loBit = (iRgn % 12) * 16;
    hiBit = loBit + 15;
    printf("rgnET_%d <= s_INPUT_LINK_ARR( %d )(%d downto %d);\n", iRgn, link, hiBit, loBit);
  }
  for(iHFRgn = 0; iHFRgn < NCrts * NHFRgns; iHFRgn++) {
    // Each link can carry 192-bits, or 12x16-bits of data
    // Each iHFRgn needs 16 bits
    link = (iHFRgn / 12) + 21;
    loBit = (iHFRgn % 12) * 16;
    hiBit = loBit + 15;
    printf("hfET_%d <= s_INPUT_LINK_ARR( %d )(%d downto %d);\n", iHFRgn, link, hiBit, loBit);
  }
  printf("s_OUTPUT_LINK_ARR( 0 )(15 downto 0) <= HT_0;\n");
------ CHECK THE BIT NUMBERS AND LINK NUMBERS IN ALL------
   */
  //printf("\n----------------ClusterFinder---------------\n\n");
  int k=0;


  	  for(mRgn = 0; mRgn < NCaloLayer1Eta; mRgn++){
		for (hRgn =0; hRgn < NCaloLayer1Phi; hRgn++)
		{
		 link = (k / 12);
		 loBit = (k % 12) * 16;
		 hiBit = loBit + 9;
		 k++;
		 printf("ClusterET_%d_%d <= s_INPUT_LINK_ARR( %d )(%d downto %d);\n", mRgn, hRgn, link, hiBit, loBit);
		 loBit = hiBit + 1;
		 hiBit = hiBit + 3;
		 printf("peakEta_%d_%d <= s_INPUT_LINK_ARR( %d )(%d downto %d);\n", mRgn, hRgn, link, hiBit, loBit);
		 loBit = hiBit + 1;
		 hiBit = hiBit + 3;
		 printf("peakPhi_%d_%d <= s_INPUT_LINK_ARR( %d )(%d downto %d);\n", mRgn, hRgn, link, hiBit, loBit);

		}
  	  }
  	  printf("\n");

      for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           link = (k / 12);
           loBit = (k % 12) * 16;
           hiBit = loBit + 9;
           k++;
           printf("trackPT_%d <= s_INPUT_LINK_ARR( %d )(%d downto %d);\n", hRgn, link, hiBit, loBit);
        }

      printf("\n");
      for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           link = (k / 12);
           loBit = (k % 12) * 16;
           hiBit = loBit + 8;
           k++;
           printf("trackEta_%d <= s_INPUT_LINK_ARR( %d )(%d downto %d);\n", hRgn, link, hiBit, loBit);
        }

      printf("\n");
      for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           link = (k / 12);
           loBit = (k % 12) * 16;
           hiBit = loBit + 9;
           k++;
           printf("trackPhi_%d <= s_INPUT_LINK_ARR( %d )(%d downto %d);\n", hRgn, link, hiBit, loBit);
        }
      k=0;
      printf("\n");
      for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           link = (k / 12);
           loBit = (k % 12) * 16;
           hiBit = loBit + 9;
           k++;
           printf("s_OUTPUT_LINK_ARR( %d )(%d downto %d) <= linkedTrackPT_%d ;\n", link, hiBit, loBit, hRgn);
        }

      printf("\n");
      for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           link = (k / 12);
           loBit = (k % 12) * 16;
           hiBit = loBit + 8;
           k++;
           printf("s_OUTPUT_LINK_ARR( %d )(%d downto %d) <= linkedTrackEta_%d ;\n", link, hiBit, loBit, hRgn);
        }

      printf("\n");
      for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           link = (k / 12);
           loBit = (k % 12) * 16;
           hiBit = loBit + 9;
           k++;
           printf("s_OUTPUT_LINK_ARR( %d )(%d downto %d) <= linkedTrackPhi_%d ;\n", link, hiBit, loBit, hRgn);
        }

      printf("\n");
      for (hRgn =0; hRgn < MaxTracks; hRgn++)
        {
           link = (k / 12);
           loBit = (k % 12) * 16;
           hiBit = loBit + 7;
           k++;
           printf("s_OUTPUT_LINK_ARR( %d )(%d downto %d) <= linkedTrackQuality_%d ;\n", link, hiBit, loBit, hRgn);
        }

      printf("\n");
      for (hRgn =0; hRgn < MaxNeutralClusters; hRgn++)
        {
           link = (k / 12);
           loBit = (k % 12) * 16;
           hiBit = loBit + 9;
           k++;
           printf("s_OUTPUT_LINK_ARR( %d )(%d downto %d) <= neutralClusterET_%d ;\n", link, hiBit, loBit,hRgn);
        }

      printf("\n");
      for (hRgn =0; hRgn < MaxNeutralClusters; hRgn++)
        {
           link = (k / 12);
           loBit = (k % 12) * 16;
           hiBit = loBit + 8;
           k++;
           printf("s_OUTPUT_LINK_ARR( %d )(%d downto %d) <= neutralClusterEta_%d ;\n", link, hiBit, loBit, hRgn);
        }

      printf("\n");
      for (hRgn =0; hRgn < MaxNeutralClusters; hRgn++)
        {
           link = (k / 12);
           loBit = (k % 12) * 16;
           hiBit = loBit + 9;
           k++;
           printf("s_OUTPUT_LINK_ARR( %d )(%d downto %d) <= neutralClusterPhi_%d ;\n", link, hiBit, loBit, hRgn);
        }
    }




int main(int argc, char **argv) {

	uint10_t clusterET[NCaloLayer1Eta][NCaloLayer1Phi] = {0};
	uint3_t peakEta[NCaloLayer1Eta][NCaloLayer1Phi] = {0};
	uint3_t peakPhi[NCaloLayer1Eta][NCaloLayer1Phi] = {0};
	uint10_t trackPT[MaxTracks] = {0};
	uint9_t trackEta[MaxTracks] = {0};
	uint10_t trackPhi[MaxTracks] = {0};
	algo_out output;



  if(argc == 2) srandom((unsigned int) atoi(argv[1]));

  uint16_t crystals[NCaloLayer1Eta][NCaloLayer1Phi][NCrystalsPerEtaPhi][NCrystalsPerEtaPhi];
  for(int tEta = 0; tEta < NCaloLayer1Eta; tEta++) {
    for(int tPhi = 0; tPhi < NCaloLayer1Phi; tPhi++) {
      for(int cEta = 0; cEta < NCrystalsPerEtaPhi; cEta++) {
        for(int cPhi = 0; cPhi < NCrystalsPerEtaPhi; cPhi++) {
          crystals[tEta][tPhi][cEta][cPhi] = 0;
        }
      }
    }
  }
  /*
  uint16_t trackPT[MaxTracks] = {0};
  uint16_t trackEta[MaxTracks] = {0};
  uint16_t trackPhi[MaxTracks] = {0};
  for(int track = 0; track < MaxTracks; track++) {
    trackPT[track] = 0;
  }*/

  // Get a random number of objects and tracks, but within hardware constraints

  int nObjects = max(poisson(50), int(MaxNeutralClusters));
  int nTracks = max(poisson(15), int(MaxTracks));
  if(nTracks > nObjects) nTracks = nObjects;

  double totalET = 0;
  cout << "Generated objects: " << endl;
  cout << "tEta\ttPhi\tcEta\tcPhi\tobjectET" << endl;
  for(int object = 0; object < nObjects; object++) {
    // Crude simulation of dispersal of object ET for fun around some location
    double objectET = flat(1023.);
    int tEta = flat(17.);
    int tPhi = flat(4.);
    int cEta = flat(5.);
    int cPhi = flat(5.);
    // Print information
    cout << tEta
         << "\t" << tPhi
         << "\t" << cEta
         << "\t" << cPhi
         << "\t" << objectET << endl;
    for(int dEta = -1; dEta <= 1; dEta++) {
      for(int dPhi = -1; dPhi <= 1; dPhi++) {
        int ncEta = cEta + dEta;
        int ncPhi = cPhi + dPhi;
        // Start within the tower boundary
        int ntEta = tEta;
        int ntPhi = tPhi;
        // Adjust neighbor trigger tower as needed
        if(ncEta < 0) {ncEta = NCaloLayer1Phi; ntEta = tEta - 1;}
        else if(ncEta > NCaloLayer1Phi) {ncEta = 0; ntEta = tEta + 1;}
        if(ncPhi < 0) {ncPhi = NCaloLayer1Phi; ntPhi = tPhi - 1;}
        else if(ncPhi > NCaloLayer1Phi) {ncPhi = 0; ntPhi = tPhi + 1;}
        // Ignore spill-overs outside the card, deferring to next layer
        if(dEta == 0 && dPhi == 0) {
          crystals[tEta][tPhi][cEta][cPhi] = (objectET * 0.9);
        }
        else {
          if(ntEta >= 0 && ntEta < NCaloLayer1Eta && ntPhi >= 0 && ntPhi < NCaloLayer1Phi)
            crystals[ntEta][ntPhi][ncEta][ncPhi] = (objectET * 0.1 / 8.);
        }
      }
    }
    totalET += objectET;
    // Set matching track parameters for nTracks chosen
    if(object < nTracks) {
      double phi = (tPhi * NCrystalsPerEtaPhi + cPhi) * (0.087 / NCrystalsPerEtaPhi);
      // PT is measured with LSB = 1 GeV
      trackPT[object] = int(objectET);
      trackEta[object] = (tEta * NCrystalsPerEtaPhi + cEta) * MaxTrackEta / NCrystalsInEta;
      trackPhi[object] = (tPhi * NCrystalsPerEtaPhi + cPhi) * MaxTrackPhi / NCrystalsInPhi;
    }
  }
  cout << "Total generated ET = " << totalET << endl;
  uint16_t totalDeposited = 0;
  for(int tEta = 0; tEta < NCaloLayer1Eta; tEta++) {
    for(int tPhi = 0; tPhi < NCaloLayer1Phi; tPhi++) {
      for(int cEta = 0; cEta < NCrystalsPerEtaPhi; cEta++) {
        for(int cPhi = 0; cPhi < NCrystalsPerEtaPhi; cPhi++) {
          totalDeposited += crystals[tEta][tPhi][cEta][cPhi];
        }
      }
    }
  }
  cout << "Total deposited ET = " << totalDeposited << endl;


  uint16_t largeClusterET[NCaloLayer1Eta][NCaloLayer1Phi];
  uint16_t smallClusterET[NCaloLayer1Eta][NCaloLayer1Phi];
  uint16_t totalCardET = 0;
  /*
  if(getClustersInCard(crystals, peakEta, peakPhi, largeClusterET, smallClusterET)) {
    cout << "From the cluster simulation: " << endl;
    cout << "tEta\ttPhi\tpeakEta\tpeakPhi\tlargeClusterET\tsmallClusterET" << endl;
    for(int tEta = 0; tEta < NCaloLayer1Eta; tEta++) {
      for(int tPhi = 0; tPhi < NCaloLayer1Phi; tPhi++) {
        if(largeClusterET[tEta][tPhi] > 0) 
          cout << tEta
               << "\t" << tPhi
               << "\t" << peakEta[tEta][tPhi]
               << "\t" << peakPhi[tEta][tPhi]
               << "\t" << largeClusterET[tEta][tPhi]
               << "\t" << smallClusterET[tEta][tPhi] << endl;
        totalCardET += largeClusterET[tEta][tPhi];
      }
    }
    cout << "Total card ET = " << totalCardET << endl;
  }
  else {
    cout << "ClusterFinder failed" << endl;
    return 1;
  }


*/

  if(getClusterTrackLinker(clusterET, peakEta, peakPhi,
         trackPT, trackEta, trackPhi,
         output)) {

    cout << "From the cluster-track linking simulation: " << endl;

    cout << "LinkedTracks: " << endl;
    cout << "trackEta\ttrackPhi\ttrackPT\ttrackLinkQuality" << endl;
    for(int track = 0; track < MaxTracks; track++) {
      if(output.linkedTrackPT[track] > 0) {
  cout << output.linkedTrackEta[track]
       << "\t" << output.linkedTrackPhi[track]
       << "\t" << output.linkedTrackPT[track]
       << "\t" << output.linkedTrackQuality[track]
       << endl;
      }
    }

    cout << "Neutral Clusters: " << endl;
    cout << "clusterEta\tclusterPhi\tclusterET" << endl;
    for(int cluster = 0; cluster < MaxNeutralClusters; cluster++) {
      if(output.neutralClusterET[cluster] > 0) {
  cout << output.neutralClusterEta[cluster]
       << "\t" << output.neutralClusterPhi[cluster]
       << "\t" << output.neutralClusterET[cluster]
       << endl;
      }
    }

  }
  WriteLinkMapCTL(
  clusterET,
  peakEta,
  peakPhi,
  trackPT,
  trackEta,
  trackPhi,
  output.linkedTrackPT,
  output.linkedTrackEta,
  output.linkedTrackPhi,
  output.linkedTrackQuality,
  output.neutralClusterET,
  output.neutralClusterEta,
  output.neutralClusterPhi);


  return 0;
}
