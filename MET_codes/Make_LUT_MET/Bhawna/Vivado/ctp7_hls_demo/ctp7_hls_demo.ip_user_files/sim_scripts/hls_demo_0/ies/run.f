-makelib ies/xil_defaultlib -sv \
  "/opt/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/opt/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies/xpm \
  "/opt/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../ipstatic/hdl/vhdl/hls_demo.vhd" \
  "../../../ipstatic/hdl/vhdl/hls_demo_sdiv_20nbkb.vhd" \
  "../../../ipstatic/hdl/vhdl/hls_demo_mul_31s_cud.vhd" \
  "../../../ip/hls_demo_0/sim/hls_demo_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

