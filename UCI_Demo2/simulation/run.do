quietly set ACTELLIBNAME SmartFusion2
quietly set PROJECT_DIR "C:/Users/Hiperwall/Desktop/microsemilab/UCI_Demo2"
onerror { quit -f }
onbreak { quit -f }
source "${PROJECT_DIR}/simulation/SERDESIF_0_compile_bfm.tcl";source "${PROJECT_DIR}/simulation/CM3_compile_bfm.tcl";

if {[file exists postsynth/_info]} {
   echo "INFO: Simulation library postsynth already exists"
} else {
   file delete -force postsynth 
   vlib postsynth
}
vmap postsynth postsynth
vmap SmartFusion2 "C:/Microsemi/Libero_SoC_v11.7/Designer/lib/modelsim/precompiled/vlog/SmartFusion2"

vlog  -work postsynth "${PROJECT_DIR}/synthesis/M2S_MSS.v"

vsim -L SmartFusion2 -L postsynth  -t 1fs postsynth.M2S_MSS
# The following lines are commented because no testbench is associated with the project
# add wave /testbench/*
# run 1000ns
# log /testbench/*
exit
