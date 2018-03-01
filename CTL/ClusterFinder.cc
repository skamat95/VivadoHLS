#include "ClusterFinder.hh"

uint16_t getPeakBinOf5(uint16_t et[5], uint16_t etSum) {
#pragma HLS PIPELINE II=8
#pragma HLS ARRAY_PARTITION variable=et complete dim=0
  uint16_t iEtSum = 
    (et[0] >> 1)                +  // 0.5xet[0]
    (et[1] >> 1) + et[1]        +  // 1.5xet[1]
    (et[2] >> 1) + (et[2] << 1) +  // 2.5xet[2]
    (et[3] << 2) - (et[3] >> 1) +  // 3.5xet[3]
    (et[4] << 2) + (et[4] >> 1) ;  // 4.5xet[4]
  uint16_t iAve = 0xBEEF;
  if(     iEtSum <= etSum) iAve = 0;
  else if(iEtSum <= (etSum << 1)) iAve = 1;
  else if(iEtSum <= (etSum + (etSum << 1))) iAve = 2;
  else if(iEtSum <= (etSum << 2)) iAve = 3;
  else iAve = 4;
  return iAve;
}

bool getClustersInTower(uint16_t crystals[NCrystalsPerEtaPhi][NCrystalsPerEtaPhi],
                        uint16_t *peakEta,
                        uint16_t *peakPhi,
                        uint16_t *towerET,
                        uint16_t *clusterET) {
#pragma HLS PIPELINE II=8
#pragma HLS ARRAY_PARTITION variable=crystals complete dim=0
  uint16_t phiStripSum[NCrystalsPerEtaPhi];
#pragma HLS ARRAY_PARTITION variable=phiStripSum complete dim=0
  for(int phi = 0; phi < NCrystalsPerEtaPhi; phi++) {
#pragma HLS UNROLL
    phiStripSum[phi] = 0;
    for(int eta = 0; eta < NCrystalsPerEtaPhi; eta++) {
#pragma HLS UNROLL
      phiStripSum[phi] += crystals[eta][phi];
    }
  }
  uint16_t etaStripSum[NCrystalsPerEtaPhi];
#pragma HLS ARRAY_PARTITION variable=etaStripSum complete dim=0
  for(int eta = 0; eta < NCrystalsPerEtaPhi; eta++) {
#pragma HLS UNROLL
    etaStripSum[eta] = 0;
    for(int phi = 0; phi < NCrystalsPerEtaPhi; phi++) {
#pragma HLS UNROLL
      etaStripSum[eta] += crystals[eta][phi];
    }
  }
  // Large cluster ET is the ET of the full tower
  *towerET = 0;
  for(int phi = 0; phi < NCrystalsPerEtaPhi; phi++) {
#pragma HLS UNROLL
    *towerET += phiStripSum[phi];
  }
  *peakEta = getPeakBinOf5(etaStripSum, *towerET);
  *peakPhi = getPeakBinOf5(phiStripSum, *towerET);
  // Small cluster ET is just the 3x3 around the peak
  *clusterET = 0;
  for(int dEta = -1; dEta <= 1; dEta++) {
#pragma HLS UNROLL
    for(int dPhi = -1; dPhi <= 1; dPhi++) {
#pragma HLS UNROLL
      int phi = *peakPhi + dPhi;
      int eta = *peakEta + dEta;
      uint16_t thisCrystalET = 0;
      if(phi >= 0 && phi < NCrystalsPerEtaPhi) {
        if(eta >= 0 && eta < NCrystalsPerEtaPhi) {
          thisCrystalET = crystals[eta][phi];
        }
      }
      *clusterET += thisCrystalET;
    }
  }
  return true;
}

bool mergeClusters(uint16_t ieta1, uint16_t iphi1, uint16_t itet1, uint16_t icet1,
                   uint16_t ieta2, uint16_t iphi2, uint16_t itet2, uint16_t icet2,
                   uint16_t *eta1, uint16_t *phi1, uint16_t *tet1, uint16_t *cet1,
                   uint16_t *eta2, uint16_t *phi2, uint16_t *tet2, uint16_t *cet2) {
  // Check that the clusters are neighbors in eta or phi
  if((ieta1 == ieta2) || (iphi1 == iphi2)) {
    if(icet1 > icet2) {
      // Merge 2 in to 1, and set 2 to remnant energy centered in tower
      *eta1 = ieta1;
      *phi1 = iphi1;
      *cet1 = icet1 + icet2;
      *tet1 = itet1 + icet2;
      *eta2 = 2;
      *phi2 = 2;
      *cet2 = 0;
      *tet2 = itet2 - icet2;
    }
    else {
      // Merge 1 in to 2, and set 1 to remnant energy centered in tower
      *eta2 = ieta2;
      *phi2 = iphi2;
      *cet2 = icet2 + icet1;
      *tet2 = itet2 + icet1;
      *eta1 = 2;
      *phi1 = 2;
      *cet1 = 0;
      *tet1 = itet1 - icet1;
    }
  }
  else {
    *eta1 = ieta1;
    *phi1 = iphi1;
    *cet1 = icet1;
    *tet1 = itet1;
    *eta2 = ieta2;
    *phi2 = iphi2;
    *cet2 = icet2;
    *tet2 = itet2;
  }
  return true;
}

bool getClustersInCard(uint16_t crystals[NCaloLayer1Eta][NCaloLayer1Phi][NCrystalsPerEtaPhi][NCrystalsPerEtaPhi],
                       uint16_t peakEta[NCaloLayer1Eta][NCaloLayer1Phi],
                       uint16_t peakPhi[NCaloLayer1Eta][NCaloLayer1Phi],
                       uint16_t towerET[NCaloLayer1Eta][NCaloLayer1Phi],
                       uint16_t clusterET[NCaloLayer1Eta][NCaloLayer1Phi]) {
#pragma HLS PIPELINE II=8
#pragma HLS ARRAY_PARTITION variable=crystals complete dim=0
#pragma HLS ARRAY_PARTITION variable=peakEta complete dim=0
#pragma HLS ARRAY_PARTITION variable=peakPhi complete dim=0
#pragma HLS ARRAY_PARTITION variable=towerET complete dim=0
#pragma HLS ARRAY_PARTITION variable=clusterET complete dim=0
  uint16_t preMergePeakEta[NCaloLayer1Eta][NCaloLayer1Phi];
  uint16_t preMergePeakPhi[NCaloLayer1Eta][NCaloLayer1Phi];
  uint16_t preMergeTowerET[NCaloLayer1Eta][NCaloLayer1Phi];
  uint16_t preMergeClusterET[NCaloLayer1Eta][NCaloLayer1Phi];
#pragma HLS ARRAY_PARTITION variable=preMergePeakEta complete dim=0
#pragma HLS ARRAY_PARTITION variable=preMergePeakPhi complete dim=0
#pragma HLS ARRAY_PARTITION variable=preMergeTowerET complete dim=0
#pragma HLS ARRAY_PARTITION variable=preMergeClusterET complete dim=0
  for(int tEta = 0; tEta < NCaloLayer1Eta; tEta++) {
#pragma HLS UNROLL
    for(int tPhi = 0; tPhi < NCaloLayer1Phi; tPhi++) {
#pragma HLS UNROLL
      preMergePeakEta[tEta][tPhi] = 999;
      preMergePeakPhi[tEta][tPhi] = 999;
      preMergeTowerET[tEta][tPhi] = 0;
      preMergeClusterET[tEta][tPhi] = 0;
      if(!getClustersInTower(crystals[tEta][tPhi], 
                             &preMergePeakEta[tEta][tPhi],
                             &preMergePeakPhi[tEta][tPhi],
                             &preMergeTowerET[tEta][tPhi],
                             &preMergeClusterET[tEta][tPhi])
         ) {
        return false;
      }
    }
  }
  // Merge neighboring split-clusters here
  for(int tEta = 0; tEta < NCaloLayer1Eta; tEta++) {
#pragma HLS UNROLL
    for(int tPhi = 0; tPhi < NCaloLayer1Phi; tPhi++) {
#pragma HLS UNROLL
      peakEta[tEta][tPhi] = preMergePeakEta[tEta][tPhi];
      peakPhi[tEta][tPhi] = preMergePeakPhi[tEta][tPhi];
      towerET[tEta][tPhi] = preMergeTowerET[tEta][tPhi];
      clusterET[tEta][tPhi] = preMergeClusterET[tEta][tPhi];
      int nEta = -1;
      int nPhi = -1;
      if(preMergePeakEta[tEta][tPhi] == 0 && tEta != 0) nEta = tEta - 1;
      if(preMergePeakEta[tEta][tPhi] == NCaloLayer1Phi && tEta != 16) nEta = tEta + 1;
      if(preMergePeakPhi[tEta][tPhi] == 0 && tPhi != 0) nPhi = tPhi - 1;
      if(preMergePeakPhi[tEta][tPhi] == NCaloLayer1Phi && tPhi != 3) nPhi = tPhi + 1;
      if(nEta >= 0 && nEta < NCaloLayer1Eta && nPhi >= 0 && nPhi < NCaloLayer1Phi) {
        if(!mergeClusters(preMergePeakEta[tEta][tPhi],
                          preMergePeakPhi[tEta][tPhi],
                          preMergeTowerET[tEta][tPhi],
                          preMergeClusterET[tEta][tPhi],
                          preMergePeakEta[nEta][nPhi],
                          preMergePeakPhi[nEta][nPhi],
                          preMergeTowerET[nEta][nPhi],
                          preMergeClusterET[nEta][nPhi],
                          &peakEta[tEta][tPhi],
                          &peakPhi[tEta][tPhi],
                          &towerET[tEta][tPhi],
                          &clusterET[tEta][tPhi],
                          &peakEta[nEta][nPhi],
                          &peakPhi[nEta][nPhi],
                          &towerET[nEta][nPhi],
                          &clusterET[nEta][nPhi])) return false;
      }
      else {
        continue;
      }
    }
  }
  return true;
}
