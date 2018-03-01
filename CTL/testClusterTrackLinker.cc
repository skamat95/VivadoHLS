#include "ClusterFinder.hh"
#include "ClusterTrackLinker.hh"

#include <stdlib.h>
#include <math.h>

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

int main(int argc, char **argv) {

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
  uint16_t trackPT[MaxTracksInCard] = {0};
  uint16_t trackEta[MaxTracksInCard] = {0};
  uint16_t trackPhi[MaxTracksInCard] = {0};
  for(int track = 0; track < MaxTracksInCard; track++) {
    trackPT[track] = 0;
  }

  // Get a random number of objects and tracks, but within hardware constraints

  int nObjects = max(poisson(50), int(MaxNeutralClusters));
  int nTracks = max(poisson(15), int(MaxTracksInCard));
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
        // Ignore spill-overs outside the card, defering to next layer
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
  uint16_t peakEta[NCaloLayer1Eta][NCaloLayer1Phi];
  uint16_t peakPhi[NCaloLayer1Eta][NCaloLayer1Phi];
  uint16_t largeClusterET[NCaloLayer1Eta][NCaloLayer1Phi];
  uint16_t smallClusterET[NCaloLayer1Eta][NCaloLayer1Phi];
  uint16_t totalCardET = 0;
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

  uint16_t linkedTrackPT[MaxTracksInCard] = {0};
  uint16_t linkedTrackEta[MaxTracksInCard] = {0};
  uint16_t linkedTrackPhi[MaxTracksInCard] = {0};
  uint16_t linkedTrackQuality[MaxTracksInCard] = {0};
  uint16_t neutralClusterET[MaxNeutralClusters] = {0};
  uint16_t neutralClusterEta[MaxNeutralClusters] = {0};
  uint16_t neutralClusterPhi[MaxNeutralClusters] = {0};

  if(getClusterTrackLinker(smallClusterET, peakEta, peakPhi, 
			   trackPT, trackEta, trackPhi, 
			   linkedTrackPT, linkedTrackEta, linkedTrackPhi, linkedTrackQuality,
			   neutralClusterET, neutralClusterEta, neutralClusterPhi)) {

    cout << "From the cluster-track linking simulation: " << endl;

    cout << "LinkedTracks: " << endl;
    cout << "trackEta\ttrackPhi\ttrackPT\ttrackLinkQuality" << endl;
    for(int track = 0; track < MaxTracksInCard; track++) {
      if(linkedTrackPT[track] > 0) {
	cout << linkedTrackEta[track]
	     << "\t" << linkedTrackPhi[track]
	     << "\t" << linkedTrackPT[track]
	     << "\t" << linkedTrackQuality[track]
	     << endl;
      }
    }

    cout << "Neutral Clusters: " << endl;
    cout << "clusterEta\tclusterPhi\tclusterET" << endl;
    for(int cluster = 0; cluster < MaxNeutralClusters; cluster++) {
      if(neutralClusterET[cluster] > 0) {
	cout << neutralClusterEta[cluster]
	     << "\t" << neutralClusterPhi[cluster]
	     << "\t" << neutralClusterET[cluster]
	     << endl;
      }
    }

  }
     
  return 0;
}
