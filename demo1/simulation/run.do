quietly set ACTELLIBNAME SmartFusion2
quietly set PROJECT_DIR "C:/Users/Hiperwall/Desktop/microsemilab/demo1"
onerror { quit -f }
onbreak { quit -f }

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap SmartFusion2 "C:/Microsemi/Libero_SoC_v11.7/Designer/lib/modelsim/precompiled/vlog/SmartFusion2"

vlog  -work presynth "${PROJECT_DIR}/component/work/Top/FCCC_0/Top_FCCC_0_FCCC.v"
vlog  -work presynth "${PROJECT_DIR}/component/work/Top/OSC_0/Top_OSC_0_OSC.v"
vlog  -work presynth "${PROJECT_DIR}/component/work/Top/Top.v"
vlog "+incdir+${PROJECT_DIR}/stimulus"  -work presynth "${PROJECT_DIR}/stimulus/user_testbench.v"

vsim -L SmartFusion2 -L presynth  -t 1fs presynth.testbench
add wave /testbench/*
run 1000ns
log /testbench/*
exit
