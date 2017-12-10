quietly set ACTELLIBNAME SmartFusion2
quietly set PROJECT_DIR "C:/Users/Hiperwall/Desktop/test/test"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap SmartFusion2 "C:/Microsemi/Libero_SoC_v11.7/Designer/lib/modelsim/precompiled/vhdl/SmartFusion2"

vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/debounce.vhd"

vsim -L SmartFusion2 -L presynth  -t 1fs presynth.debounce
# The following lines are commented because no testbench is associated with the project
# add wave /testbench/*
# run 1000ns
