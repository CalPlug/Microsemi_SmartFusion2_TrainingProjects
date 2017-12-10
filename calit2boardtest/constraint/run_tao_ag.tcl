set_device -family {SmartFusion2} -die {M2S010}
read_verilog -mode system_verilog {C:\Users\Hiperwall\Desktop\microsemilab\calit2boardtest\hdl\top.v}
set_top_level {top}
derive_constraints
write_sdc {C:\Users\Hiperwall\Desktop\microsemilab\calit2boardtest\constraint\top_fhb_auto_generated.sdc}
