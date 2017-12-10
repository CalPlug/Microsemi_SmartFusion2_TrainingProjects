# Netlist Viewer TCL File
set_family -name SmartFusion2
top_module -name top
addfile -view RTL -lib work -type VLOG -mode system_verilog -name {C:/Users/Hiperwall/Desktop/microsemilab/calit2boardtest/component/Actel/SgCore/OSC/2.0.101/osc_comps.v}
addfile -view RTL -lib work -type VLOG -mode system_verilog -name {C:/Users/Hiperwall/Desktop/microsemilab/calit2boardtest/hdl/top.v}
addfile -view HIER -lib work -type VLOG -mode system_verilog -name {C:/Users/Hiperwall/Desktop/microsemilab/calit2boardtest/synthesis/top.vm}
addfile -view FLAT -lib work -type AFL -mode NONE -name {C:/Users/Hiperwall/Desktop/microsemilab/calit2boardtest/designer/top/COMPILE/top.afl}