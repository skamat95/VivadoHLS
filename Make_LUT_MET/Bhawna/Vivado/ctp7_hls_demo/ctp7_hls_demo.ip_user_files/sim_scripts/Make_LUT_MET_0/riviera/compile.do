vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/xbip_utils_v3_0_7
vlib riviera/axi_utils_v2_0_3
vlib riviera/xbip_pipe_v3_0_3
vlib riviera/xbip_dsp48_wrapper_v3_0_4
vlib riviera/xbip_dsp48_addsub_v3_0_3
vlib riviera/xbip_dsp48_multadd_v3_0_3
vlib riviera/xbip_bram18k_v3_0_3
vlib riviera/mult_gen_v12_0_12
vlib riviera/floating_point_v7_1_3

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap xbip_utils_v3_0_7 riviera/xbip_utils_v3_0_7
vmap axi_utils_v2_0_3 riviera/axi_utils_v2_0_3
vmap xbip_pipe_v3_0_3 riviera/xbip_pipe_v3_0_3
vmap xbip_dsp48_wrapper_v3_0_4 riviera/xbip_dsp48_wrapper_v3_0_4
vmap xbip_dsp48_addsub_v3_0_3 riviera/xbip_dsp48_addsub_v3_0_3
vmap xbip_dsp48_multadd_v3_0_3 riviera/xbip_dsp48_multadd_v3_0_3
vmap xbip_bram18k_v3_0_3 riviera/xbip_bram18k_v3_0_3
vmap mult_gen_v12_0_12 riviera/mult_gen_v12_0_12
vmap floating_point_v7_1_3 riviera/floating_point_v7_1_3

vlog -work xil_defaultlib  -sv2k12 \
"/data/tools/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/data/tools/Vivado/2016.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/data/tools/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_7 -93 \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_3 -93 \
"../../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_3 -93 \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -93 \
"../../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_3 -93 \
"../../../ipstatic/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_3 -93 \
"../../../ipstatic/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_3 -93 \
"../../../ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_12 -93 \
"../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_1_3 -93 \
"../../../ipstatic/hdl/floating_point_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_sitozec.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_mac_fYi.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_mac_lbW.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_mac_rcU.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_mul_cud.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_mac_udo.vhd" \
"../../../ipstatic/hdl/vhdl/addsub_2.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_mul_pcA.vhd" \
"../../../ipstatic/hdl/vhdl/Comp_rgn_et_14.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_fpexxdS.vhd" \
"../../../ipstatic/hdl/vhdl/addsub_1.vhd" \
"../../../ipstatic/hdl/vhdl/range_redux_paynebkb.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_mac_mb6.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_mac_tde.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_mac_ncg.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_mac_sc4.vhd" \
"../../../ipstatic/hdl/vhdl/addsub.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_sitowdI.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_mac_jbC.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_fmulvdy.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_mul_hbi.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_mul_dEe.vhd" \
"../../../ipstatic/hdl/vhdl/Comp_rgn_et.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_dmulyd2.vhd" \
"../../../ipstatic/hdl/vhdl/sin_cos_range_redux_s.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_mac_ocq.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_mul_eOg.vhd" \
"../../../ipstatic/hdl/vhdl/p_hls_fptosi_double_s.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_mac_kbM.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_mul_qcK.vhd" \
"../../../ipstatic/hdl/vhdl/range_redux_payne_ha.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_mac_g8j.vhd" \
"../../../ipstatic/hdl/vhdl/Make_LUT_MET_mac_ibs.vhd" \
"../../../ipstatic/hdl/ip/Make_LUT_MET_ap_dmul_8_max_dsp_64.vhd" \
"../../../ipstatic/hdl/ip/Make_LUT_MET_ap_fmul_3_max_dsp_32.vhd" \
"../../../ipstatic/hdl/ip/Make_LUT_MET_ap_sitodp_4_no_dsp_32.vhd" \
"../../../ipstatic/hdl/ip/Make_LUT_MET_ap_fpext_0_no_dsp_32.vhd" \
"../../../ipstatic/hdl/ip/Make_LUT_MET_ap_sitofp_4_no_dsp_32.vhd" \
"../../../ip/Make_LUT_MET_0/sim/Make_LUT_MET_0.vhd" \

vlog -work xil_defaultlib "glbl.v"

