# Copyright (C) 2020  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and any partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details, at
# https://fpgasoftware.intel.com/eula.

# Quartus Prime: Generate Tcl File for Project
# File: procesor.tcl
# Generated on: Thu Aug  5 21:19:41 2021

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "procesor"]} {
		puts "Project procesor is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists procesor]} {
		project_open -revision procesor procesor
	} else {
		project_new -revision procesor procesor
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone V"
	set_global_assignment -name DEVICE 5CEBA4F23C7
	set_global_assignment -name TOP_LEVEL_ENTITY top
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 20.1.1
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "15:45:39  AUGUST 02, 2021"
	set_global_assignment -name LAST_QUARTUS_VERSION "20.1.1 Lite Edition"
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 256
	set_global_assignment -name EDA_SIMULATION_TOOL "ModelSim-Altera (Verilog)"
	set_global_assignment -name EDA_TIME_SCALE "1 ps" -section_id eda_simulation
	set_global_assignment -name EDA_OUTPUT_DATA_FORMAT "VERILOG HDL" -section_id eda_simulation
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_timing
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_symbol
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_signal_integrity
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_boundary_scan
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name EDA_TEST_BENCH_ENABLE_STATUS TEST_BENCH_MODE -section_id eda_simulation
	set_global_assignment -name EDA_NATIVELINK_SIMULATION_TEST_BENCH sim -section_id eda_simulation
	set_global_assignment -name EDA_TEST_BENCH_NAME sim -section_id eda_simulation
	set_global_assignment -name EDA_DESIGN_INSTANCE_NAME NA -section_id sim
	set_global_assignment -name EDA_TEST_BENCH_MODULE_NAME sim -section_id sim
	set_global_assignment -name EDA_TEST_BENCH_FILE sim.v -section_id sim
	set_global_assignment -name SOURCE_FILE memory.mem
	set_global_assignment -name SOURCE_FILE regs.mem
	set_global_assignment -name VERILOG_FILE procesor.v
	set_global_assignment -name VERILOG_FILE def.v
	set_global_assignment -name VERILOG_FILE prog_mem.v
	set_global_assignment -name VERILOG_FILE top.v
	set_global_assignment -name VERILOG_FILE sim.v
	set_location_assignment PIN_M9 -to clk
	set_location_assignment PIN_M6 -to reset
	set_location_assignment PIN_U21 -to out0[6]
	set_location_assignment PIN_V21 -to out0[5]
	set_location_assignment PIN_W22 -to out0[4]
	set_location_assignment PIN_W21 -to out0[3]
	set_location_assignment PIN_Y22 -to out0[2]
	set_location_assignment PIN_Y21 -to out0[1]
	set_location_assignment PIN_AA22 -to out0[0]
	set_location_assignment PIN_AA20 -to out1[6]
	set_location_assignment PIN_AB20 -to out1[5]
	set_location_assignment PIN_AA19 -to out1[4]
	set_location_assignment PIN_AA18 -to out1[3]
	set_location_assignment PIN_AB18 -to out1[2]
	set_location_assignment PIN_AA17 -to out1[1]
	set_location_assignment PIN_U22 -to out1[0]
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
