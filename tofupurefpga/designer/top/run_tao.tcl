set_family {SmartFusion2}
read_verilog -mode system_verilog {C:\Users\Hiperwall\Desktop\microsemilab\tofupurefpga\hdl\top.v}
set_top_level {top}
map_netlist
check_constraints {C:\Users\Hiperwall\Desktop\microsemilab\tofupurefpga\constraint\synthesis_sdc_errors.log}
write_fdc {C:\Users\Hiperwall\Desktop\microsemilab\tofupurefpga\designer\top\synthesis.fdc}
