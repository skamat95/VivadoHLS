#ifndef ADDER_TREE_H_
#define ADDER_TREE_H_

#include "UCTSummaryCard.hpp"

typedef ap_uint<12> out_t;
typedef ap_int<13> out2_t;

typedef ap_uint<10> in_t;
typedef ap_int<11> in2_t;


typedef struct
{
	ap_int<13> x;
	ap_int<13> y;

} met_cmp_t;

typedef struct
{
	ap_uint<12> et_sum;
	ap_uint<12> ht_sum;

	ap_uint<27> met_sum;
	ap_uint<27> mht_sum;

	ap_uint<8> met_phi;
	ap_uint<8> mht_phi;
} sums_t;

sums_t ener_sums(ap_uint<10> et[NR_CALO_REG], ap_uint<10> ht_thr);

met_cmp_t adder_tree_u_part18x26(in_t arr_i[NR_CALO_REG]);

void ht_filt(ap_uint<10> ht_thr, in_t arr_i[NR_CALO_REG], in_t arr_o[NR_CALO_REG]);
out_t adder_tree(in_t arr_i[NR_CALO_REG]);
out2_t adder_tree_s(in2_t arr_i[NR_CALO_REG]);


#endif
