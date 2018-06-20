#include "ClusterFinder.hh"
#include "ClusterTrackLinker.hh"

#include <stdlib.h>
#include <math.h>
#include <stdio.h>
#include <iostream>
#include <algorithm>
using namespace std;





int main(int argc, char **argv) {

	uint10_t clusterET[NCaloLayer1Eta][NCaloLayer1Phi];
	uint3_t peakEta[NCaloLayer1Eta][NCaloLayer1Phi];
	uint3_t peakPhi[NCaloLayer1Eta][NCaloLayer1Phi];
	uint10_t trackPT[MaxTracks];
	uint9_t trackEta[MaxTracks];
	uint10_t trackPhi[MaxTracks];
	uint10_t linkedTrackPT[MaxTracks];
   uint9_t linkedTrackEta[MaxTracks];
   uint10_t linkedTrackPhi[MaxTracks];
   ap_fixed<8,6> linkedTrackQuality[MaxTracks];
   uint10_t neutralClusterET[MaxNeutralClusters];
   uint9_t neutralClusterEta[MaxNeutralClusters];
   uint10_t neutralClusterPhi[MaxNeutralClusters];



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

  //initialize all inputs and outputs to 0
  for(int i = 0; i<NCaloLayer1Eta; i++){
  	  for(int j=0; j<NCaloLayer1Phi; j++){

  		  clusterET[i][j] = 0;
  		  peakEta[i][j] = 0;
  		  peakPhi[i][j] = 0;

  	  }
    }

    for(int i =0; i<MaxTracks; i++){
  	  trackPT[i] = 0;
  	  trackEta[i] = 0;
  	  trackPhi[i] = 0;
  	  linkedTrackPT[i] = 0;
  	  linkedTrackEta[i] = 0;
  	  linkedTrackPhi[i] = 0;
  	  linkedTrackQuality[i] = 0;
    }

    for(int i=0;i<MaxNeutralClusters; i++){
  	  neutralClusterET[i] = 0;
  	  neutralClusterEta[i] = 0;
  	  neutralClusterPhi[i] = 0;
    }

/*

  //printing inputs
  for(int i = 0; i<NCaloLayer1Eta; i++){
	  for(int j=0; j<NCaloLayer1Phi; j++){

		  cout <<"all inputs" << clusterET[i][j] << "\t" << peakEta[i][j] << "\t" << peakPhi[i][j] <<endl;

	  }
  }

  for(int i =0; i<MaxTracks; i++){
	  cout <<"inputs plus outputs I" << trackPT[i] << "\t" << trackEta[i] << "\t"""<< trackPhi[i] << endl;
	  cout <<"inputs plus outputs II" << linkedTrackPT[i] << "\t" << linkedTrackEta[i] << "\t" << linkedTrackPhi[i] << "\t" << linkedTrackQuality << endl;
  }

  for(int i=0;i<MaxNeutralClusters; i++){
	  cout <<"utputs" << neutralClusterET[i] << "\t" <<neutralClusterEta[i] << "\t" << neutralClusterPhi[i] << endl;
  }

*/

//give some non zero inputs
clusterET[0][0] = 10;
peakEta[0][0] = 2;
peakPhi[0][0] = 2;
trackPT[1] = 9;
trackEta[1] = 20;
trackPhi[1] = 100;

//print inputs again
for(int i = 0; i<NCaloLayer1Eta; i++){
	  for(int j=0; j<NCaloLayer1Phi; j++){

		  cout <<"inputs I" << clusterET[i][j] << "\t" << peakEta[i][j] << "\t" << peakPhi[i][j] <<endl;

	  }
}

for(int i =0; i<MaxTracks; i++){
	  cout <<"inputs II" << trackPT[i] << "\t" << trackEta[i] << "\t"""<< trackPhi[i] << endl;

}

//call the function in main
  getClusterTrackLinker(
  clusterET,
  peakEta,
  peakPhi,
  trackPT,
  trackEta,
  trackPhi,
  linkedTrackPT,
  linkedTrackEta,
  linkedTrackPhi,
  linkedTrackQuality,
  neutralClusterET,
  neutralClusterEta,
  neutralClusterPhi);
/*
  //print outputs
  for(int i =0; i<MaxTracks; i++){

  	  cout <<"outputs I" << linkedTrackPT[i] << "\t" << linkedTrackEta[i] << "\t" << linkedTrackPhi[i] << "\t" << linkedTrackQuality << endl;
    }

    for(int i=0;i<MaxNeutralClusters; i++){
  	  cout <<"outputs II" << neutralClusterET[i] << "\t" <<neutralClusterEta[i] << "\t" << neutralClusterPhi[i] << endl;
    }
*/
  return 0;
}
