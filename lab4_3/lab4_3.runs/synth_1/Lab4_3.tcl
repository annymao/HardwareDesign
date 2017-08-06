# 
# Synthesis run script generated by Vivado
# 

create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/anny/Nthu_10601/HardwareDesign/lab4_3/lab4_3.cache/wt [current_project]
set_property parent.project_path D:/anny/Nthu_10601/HardwareDesign/lab4_3/lab4_3.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/anny/Nthu_10601/HardwareDesign/lab4_3/lab4_3.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  D:/anny/Nthu_10601/HardwareDesign/lab4_3/lab4_3.srcs/sources_1/imports/HardwareDesign/clock_divider.v
  D:/anny/Nthu_10601/HardwareDesign/lab4_3/lab4_3.srcs/sources_1/imports/HardwareDesign/debounce.v
  D:/anny/Nthu_10601/HardwareDesign/lab4_3/lab4_3.srcs/sources_1/imports/HardwareDesign/lab2_1.v
  D:/anny/Nthu_10601/HardwareDesign/lab4_3/lab4_3.srcs/sources_1/imports/HardwareDesign/lab2_2.v
  D:/anny/Nthu_10601/HardwareDesign/lab4_3/lab4_3.srcs/sources_1/imports/HardwareDesign/seven_segment.v
  D:/anny/Nthu_10601/HardwareDesign/lab4_3/lab4_3.srcs/sources_1/new/lab4_3.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/anny/Nthu_10601/HardwareDesign/lab4_3/lab4_3.srcs/constrs_1/imports/lab4_3/lab4_3_cons.xdc
set_property used_in_implementation false [get_files D:/anny/Nthu_10601/HardwareDesign/lab4_3/lab4_3.srcs/constrs_1/imports/lab4_3/lab4_3_cons.xdc]


synth_design -top Lab4_3 -part xc7a35tcpg236-1


write_checkpoint -force -noxdef Lab4_3.dcp

catch { report_utilization -file Lab4_3_utilization_synth.rpt -pb Lab4_3_utilization_synth.pb }
