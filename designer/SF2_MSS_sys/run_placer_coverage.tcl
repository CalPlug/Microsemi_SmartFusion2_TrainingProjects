set_family {SmartFusion2}
read_adl {C:\Users\Hiperwall\Desktop\DigiKeyBoard\designer\SF2_MSS_sys\SF2_MSS_sys.adl}
map_netlist
read_sdc {C:\Users\Hiperwall\Desktop\DigiKeyBoard\constraint\SF2_MSS_sys_derived_constraints.sdc}
check_constraints {C:\Users\Hiperwall\Desktop\DigiKeyBoard\designer\SF2_MSS_sys\placer_coverage.log}
write_sdc -strict {C:\Users\Hiperwall\Desktop\DigiKeyBoard\designer\SF2_MSS_sys\place_route.sdc}
