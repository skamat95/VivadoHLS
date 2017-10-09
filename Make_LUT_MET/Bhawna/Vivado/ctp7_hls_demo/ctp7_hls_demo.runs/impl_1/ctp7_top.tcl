proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.cache/wt [current_project]
  set_property parent.project_path /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.xpr [current_project]
  set_property ip_repo_paths /data/skamat/HLS/METB/solution1 [current_project]
  set_property ip_output_repo /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.runs/synth_1/ctp7_top.dcp
  add_files -quiet /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/pattern_bram/pattern_bram.dcp
  set_property netlist_only true [get_files /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/pattern_bram/pattern_bram.dcp]
  add_files -quiet /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/ila_0/ila_0.dcp
  set_property netlist_only true [get_files /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/ila_0/ila_0.dcp]
  add_files -quiet /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/ila_hls/ila_hls.dcp
  set_property netlist_only true [get_files /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/ila_hls/ila_hls.dcp]
  add_files -quiet /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/Make_LUT_MET_0/Make_LUT_MET_0.dcp
  set_property netlist_only true [get_files /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/Make_LUT_MET_0/Make_LUT_MET_0.dcp]
  read_xdc -ref v7_bd_axi_chip2chip_0_0 -cells inst /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ip/v7_bd_axi_chip2chip_0_0/v7_bd_axi_chip2chip_0_0.xdc
  set_property processing_order EARLY [get_files /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ip/v7_bd_axi_chip2chip_0_0/v7_bd_axi_chip2chip_0_0.xdc]
  read_xdc -prop_thru_buffers -ref v7_bd_clk_wiz_0_0 -cells inst /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ip/v7_bd_clk_wiz_0_0/v7_bd_clk_wiz_0_0_board.xdc
  set_property processing_order EARLY [get_files /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ip/v7_bd_clk_wiz_0_0/v7_bd_clk_wiz_0_0_board.xdc]
  read_xdc -ref v7_bd_clk_wiz_0_0 -cells inst /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ip/v7_bd_clk_wiz_0_0/v7_bd_clk_wiz_0_0.xdc
  set_property processing_order EARLY [get_files /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ip/v7_bd_clk_wiz_0_0/v7_bd_clk_wiz_0_0.xdc]
  read_xdc -prop_thru_buffers -ref v7_bd_proc_sys_reset_0_0 -cells U0 /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ip/v7_bd_proc_sys_reset_0_0/v7_bd_proc_sys_reset_0_0_board.xdc
  set_property processing_order EARLY [get_files /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ip/v7_bd_proc_sys_reset_0_0/v7_bd_proc_sys_reset_0_0_board.xdc]
  read_xdc -ref v7_bd_proc_sys_reset_0_0 -cells U0 /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ip/v7_bd_proc_sys_reset_0_0/v7_bd_proc_sys_reset_0_0.xdc
  set_property processing_order EARLY [get_files /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ip/v7_bd_proc_sys_reset_0_0/v7_bd_proc_sys_reset_0_0.xdc]
  read_xdc -ref v7_bd_xadc_wiz_0_0 -cells U0 /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ip/v7_bd_xadc_wiz_0_0/v7_bd_xadc_wiz_0_0.xdc
  set_property processing_order EARLY [get_files /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ip/v7_bd_xadc_wiz_0_0/v7_bd_xadc_wiz_0_0.xdc]
  read_xdc -mode out_of_context -ref pattern_bram -cells U0 /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/pattern_bram/pattern_bram_ooc.xdc
  set_property processing_order EARLY [get_files /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/pattern_bram/pattern_bram_ooc.xdc]
  read_xdc -mode out_of_context -ref ila_0 -cells U0 /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/ila_0/ila_0_ooc.xdc
  set_property processing_order EARLY [get_files /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/ila_0/ila_0_ooc.xdc]
  read_xdc -ref ila_0 -cells U0 /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/ila_0/ila_v6_2/constraints/ila.xdc
  set_property processing_order EARLY [get_files /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/ila_0/ila_v6_2/constraints/ila.xdc]
  read_xdc -mode out_of_context -ref ila_hls -cells U0 /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/ila_hls/ila_hls_ooc.xdc
  set_property processing_order EARLY [get_files /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/ila_hls/ila_hls_ooc.xdc]
  read_xdc -ref ila_hls -cells U0 /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/ila_hls/ila_v6_2/constraints/ila.xdc
  set_property processing_order EARLY [get_files /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/ila_hls/ila_v6_2/constraints/ila.xdc]
  read_xdc -mode out_of_context -ref Make_LUT_MET_0 -cells U0 /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/Make_LUT_MET_0/constraints/Make_LUT_MET_ooc.xdc
  set_property processing_order EARLY [get_files /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/ip/Make_LUT_MET_0/constraints/Make_LUT_MET_ooc.xdc]
  read_xdc /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/constrs_1/new/constraints.xdc
  read_xdc -ref v7_bd_axi_chip2chip_0_0 -cells inst /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ip/v7_bd_axi_chip2chip_0_0/v7_bd_axi_chip2chip_0_0_clocks.xdc
  set_property processing_order LATE [get_files /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ip/v7_bd_axi_chip2chip_0_0/v7_bd_axi_chip2chip_0_0_clocks.xdc]
  read_xdc -ref v7_bd_clk_wiz_0_0 -cells inst /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ip/v7_bd_clk_wiz_0_0/v7_bd_clk_wiz_0_0_late.xdc
  set_property processing_order LATE [get_files /data/skamat/Github/VivadoHLS/Make_LUT_MET/Bhawna/Vivado/ctp7_hls_demo/ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ip/v7_bd_clk_wiz_0_0/v7_bd_clk_wiz_0_0_late.xdc]
  link_design -top ctp7_top -part xc7vx690tffg1927-2
  write_hwdef -file ctp7_top.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force ctp7_top_opt.dcp
  catch { report_drc -file ctp7_top_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force ctp7_top_placed.dcp
  catch { report_io -file ctp7_top_io_placed.rpt }
  catch { report_utilization -file ctp7_top_utilization_placed.rpt -pb ctp7_top_utilization_placed.pb }
  catch { report_control_sets -verbose -file ctp7_top_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force ctp7_top_routed.dcp
  catch { report_drc -file ctp7_top_drc_routed.rpt -pb ctp7_top_drc_routed.pb -rpx ctp7_top_drc_routed.rpx }
  catch { report_methodology -file ctp7_top_methodology_drc_routed.rpt -rpx ctp7_top_methodology_drc_routed.rpx }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file ctp7_top_timing_summary_routed.rpt -rpx ctp7_top_timing_summary_routed.rpx }
  catch { report_power -file ctp7_top_power_routed.rpt -pb ctp7_top_power_summary_routed.pb -rpx ctp7_top_power_routed.rpx }
  catch { report_route_status -file ctp7_top_route_status.rpt -pb ctp7_top_route_status.pb }
  catch { report_clock_utilization -file ctp7_top_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force ctp7_top_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  catch { write_mem_info -force ctp7_top.mmi }
  write_bitstream -force -no_partial_bitfile ctp7_top.bit 
  catch { write_sysdef -hwdef ctp7_top.hwdef -bitfile ctp7_top.bit -meminfo ctp7_top.mmi -file ctp7_top.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

