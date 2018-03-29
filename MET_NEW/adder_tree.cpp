#include <stdint.h>
#include "ap_int.h"

#include "adder_tree.h"

//lowest iphi coordinate of each Phi region
const int iphi_lut_sum[] =
{ 71, 1, 5, 9, 11, 15, 19, 23, 27, 31, 35, 39, 43, 47, 51, 55, 59, 63, 67 };

// precomputed sin phi LUT
const ap_fixed<8, 1, AP_RND, AP_SAT> sin_phi_lut[] =
{ 0, +0.0435861877, +0.1304273506, +0.2162773930, +0.3004839386, +0.3824070998,
		+0.4614243406, +0.5369352073, +0.6083658910, +0.6751735882,
		+0.7368506258, +0.7929283185, +0.8429805307, +0.8866269144,
		+0.9235357998, +0.9534267154, +0.9760725195, +0.9913011259,
		+0.9989968123, +0.9991010990, +0.9916131933, +0.9765899962,
		+0.9541456692, +0.9244507673, +0.8877309428, +0.8442652304,
		+0.7943839270, +0.7384660819, +0.6769366161, +0.6102630933,
		+0.5389521672, +0.4635457312, +0.3846168005, +0.3027651579,
		+0.2186127959, +0.1327991902, +0.0459764404, -0.0411956854,
		-0.1280547643, -0.2139407520, -0.2982009991, -0.3801952099,
		-0.4593003085, -0.5349151735, -0.6064652059, -0.6734066951,
		-0.7352309514, -0.7914681707, -0.8416910052, -0.8855178104,
		-0.9226155453, -0.9527023035, -0.9755494549, -0.9909833835,
		-0.9988868067, -0.9991996659, -0.9919195839, -0.9771018822,
		-0.9548591607, -0.9253604426, -0.8888298891, -0.8455450968,
		-0.7958349878, -0.7400773105, -0.6786957686, -0.6121568020,
		-0.5409660417, -0.4656644681, -0.3868242994, -0.3050446439,
		-0.2209469472, -0.1351702696, -0.0483664299 };

// precomputed cos phi LUT
const ap_fixed<8, 1, AP_RND, AP_SAT> cos_phi_lut[] =
{ 0, +0.9990496706, +0.9914578691, +0.9763319565, +0.9537868749, +0.9239939448,
		+0.8871795635, +0.8436234842, +0.7936566907, +0.7376588817,
		+0.6760555859, +0.6093149281, +0.5379440722, +0.4624853669,
		+0.3835122246, +0.3016247641, +0.2174452501, +0.1316133646,
		+0.0447813461, -0.0423909669, -0.1292411499, -0.2151092265,
		-0.2993426830, -0.3813014277, -0.4603626540, -0.5359255739,
		-0.6074159831, -0.6742906242, -0.7360413153, -0.7921988115,
		-0.8423363707, -0.8860729965, -0.9230763331, -0.9530651915,
		-0.9758116855, -0.9911429640, -0.9989425243, -0.9991510974,
		-0.9917670983, -0.9768466382, -0.9545030980, -0.9249062668,
		-0.8882810516, -0.8449057682, -0.7951100264, -0.7392722252,
		-0.6778166774, -0.6112103850, -0.5399594909, -0.4646054321,
		-0.3857208260, -0.3039051184, -0.2197800288, -0.1339848258,
		-0.0471714689, +0.0400003450, +0.1268681954, +0.2127719714,
		+0.2970588883, +0.3790884479, +0.4582373057, +0.5339040076,
		+0.6055135607, +0.6725218022, +0.7344195352, +0.7907363971,
		+0.8410444350, +0.8849613569, +0.9221534370, +0.9523380520,
		+0.9752858281, +0.9908223848, +0.9988296594 };

sums_t ener_sums(ap_uint<10> et[NR_CALO_REG], ap_uint<10> ht_thr)
{
#pragma HLS PIPELINE II=6

	sums_t sums;

	in_t tmp_reg_nt[NR_CALO_REG];
	in_t tmp_reg_ht[NR_CALO_REG];

// NOTE:
// NT - no threshold
// HT - high threshold

#pragma HLS ARRAY_PARTITION variable=tmp_reg_nt complete dim=1
#pragma HLS ARRAY_PARTITION variable=tmp_reg_ht complete dim=1

	unpack: for (int i = 0; i < NR_CALO_REG; i++)
	{
#pragma HLS UNROLL
		tmp_reg_nt[i] = et[i]; // assign tmp region ET (no threshold)
	}

	// calculate high threshold region ETs
	ht_filt(ht_thr, tmp_reg_nt, tmp_reg_ht);

	// The code/implementation below needs more love and attention
	// Incomplete at this point
	out_t tmp1 = adder_tree(tmp_reg_nt);
	out_t tmp2 = adder_tree(tmp_reg_ht);

	met_cmp_t met_cmp_nt = adder_tree_u_part18x26(tmp_reg_nt);
	met_cmp_t met_cmp_ht = adder_tree_u_part18x26(tmp_reg_ht);

	sums.et_sum = tmp1;
	sums.ht_sum = tmp2;

	// TODO: SQRT!!
	sums.met_sum = met_cmp_nt.x * met_cmp_nt.x + met_cmp_nt.y*met_cmp_nt.y;
	sums.mht_sum = met_cmp_ht.x * met_cmp_ht.x + met_cmp_ht.y*met_cmp_ht.y;

	// TODO
	sums.met_phi = 0;
	sums.mht_phi = 0;

	return sums;
}

// high threshold filter
void ht_filt(ap_uint<10> ht_thr, in_t arr_i[NR_CALO_REG], in_t arr_o[NR_CALO_REG])
{
#pragma HLS PIPELINE II=6

#pragma HLS ARRAY_PARTITION variable=arr_i complete dim=1
#pragma HLS ARRAY_PARTITION variable=arr_o complete dim=1

	thr_loop: for (int i = 0; i < NR_CALO_REG; i++)
	{
#pragma HLS UNROLL
		ap_uint<10> tmp = arr_i[i];

		if (tmp > ht_thr)
		{
			arr_o[i] = tmp;
		}
		else
		{
			arr_o[i] = 0;
		}
	}
	return;
}

out_t adder_tree(in_t arr_i[NR_CALO_REG])
{
#pragma HLS PIPELINE II=6

#pragma HLS ARRAY_PARTITION variable=arr_i complete dim=1

	ap_uint<19> tmp = 0;

	adder_tree: for (int i = 0; i < NR_CALO_REG; i++)
	{
#pragma HLS UNROLL
		ap_uint<10> et_reg = arr_i[i];

		tmp += et_reg;

	}

	if (tmp > 4095)
	{
		tmp = 4095;
	}

	return tmp;
}

out2_t adder_tree_s(in2_t arr_i[NR_CALO_REG])
{
#pragma HLS PIPELINE II=6

#pragma HLS ARRAY_PARTITION variable=arr_i complete dim=1

	ap_int<20> tmp = 0;

	adder_tree: for (int i = 0; i < NR_CALO_REG; i++)
	{
#pragma HLS UNROLL
		in2_t et_reg = arr_i[i];

		tmp += et_reg;

	}

	if (tmp > 4095)
	{
		tmp = 4095;
	}

	return tmp;
}

////////////////


ap_int<16> adder_tree_s_26(ap_int<11> arr_i[26])
{
#pragma HLS PIPELINE II=6

#pragma HLS ARRAY_PARTITION variable=arr_i complete dim=1

	ap_int<16> tmp = 0;

	adder_tree: for (int i = 0; i < 26; i++)
	{
#pragma HLS UNROLL
		ap_int<11> et_reg = arr_i[i];

		tmp += et_reg;
	}

	return tmp;
}

ap_int<20> adder_tree_s_15x18(ap_int<16> arr_i[18]){
#pragma HLS PIPELINE II=6

#pragma HLS ARRAY_PARTITION variable=arr_i complete dim=1

  ap_int<20> tmp = 0;

 adder_tree: for (int i = 0; i < 18; i++)
    {
#pragma HLS UNROLL
      ap_int<16> et_reg = arr_i[i];

      tmp += et_reg;
    }

  return tmp;
}

{
#pragma HLS PIPELINE II=6

#pragma HLS ARRAY_PARTITION variable=arr_i complete dim=1

  ap_int<20> {
#pragma HLS PIPELINE II=6

#pragma HLS ARRAY_PARTITION variable=arr_i complete dim=1

    ap_int<20> tmp = 0;

  adder_tree: for (int i = 0; i < 18; i++)
      {
#pragma HLS UNROLL
	ap_int<16> et_reg = arr_i[i];

	tmp += et_reg;
      }

    return tmp;
  }
tmp = 0;

	adder_tree: for (int i = 0; i < 18; i++)
	{
#pragma HLS UNROLL
		ap_int<16> et_reg = arr_i[i];

		tmp += et_reg;
	}

	return tmp;
}


met_cmp_t adder_tree_u_part18x26(in_t arr_i[NR_CALO_REG])
{

	met_cmp_t met_cmp;

#pragma HLS PIPELINE II=6

#pragma HLS ARRAY_PARTITION variable=arr_i complete dim=1

	ap_int<11> arr_tmp[NR_CALO_REG / 26][26];
	ap_int<16> precomp_x[18];
	ap_int<16> precomp_y[18];

#pragma HLS ARRAY_PARTITION variable=arr_tmp complete dim=0

#pragma HLS ARRAY_PARTITION variable=precomp_x complete dim=1
#pragma HLS ARRAY_PARTITION variable=precomp_y complete dim=1

	part1: for (int i = 0; i < NR_CALO_REG / 26; i++)
	{
#pragma HLS UNROLL
		part2: for (int j = 0; j < 26; j++)
		{
#pragma HLS UNROLL

			arr_tmp[i][j] = arr_i[i * 26 + j];
		}
		precomp_x[i] = ap_int<16> ( sin_phi_lut[ iphi_lut_sum[i]] * ( adder_tree_s_26(arr_tmp[i])));
		precomp_y[i] = ap_int<16> ( cos_phi_lut[ iphi_lut_sum[i]] * ( adder_tree_s_26(arr_tmp[i])));
	}

	ap_int<20> {
#pragma HLS PIPELINE II=6

#pragma HLS ARRAY_PARTITION variable=arr_i complete dim=1

	  ap_int<20> tmp = 0;

        adder_tree: for (int i = 0; i < 18; i++)
	    {
#pragma HLS UNROLL
	      ap_int<16> et_reg = arr_i[i];

	      tmp += et_reg;
	    }

	  return tmp;
	}
	tmp_x =  adder_tree_s_15x18(precomp_x) ;
	ap_int<20> tmp_y =  adder_tree_s_15x18(precomp_y) ;

	if (tmp_x > 4095)
		tmp_x = 4095;
	else if (tmp_x < -4096)
		tmp_x = -4096;

	if (tmp_y > 4095)
		tmp_y = 4095;
	else if (tmp_y < -4096)
		tmp_y = -4096;

	met_cmp.x = tmp_x;
	met_cmp.y = tmp_y;

	return met_cmp;
}
