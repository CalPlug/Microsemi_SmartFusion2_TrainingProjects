set_family {SmartFusion2}
read_adl {C:\Users\Hiperwall\Desktop\microsemilab\calit2boardtest\designer\top\top.adl}
map_netlist
read_sdc {C:\Users\Hiperwall\Desktop\microsemilab\calit2boardtest\constraint\top_fhb_auto_generated.sdc}
check_constraints {C:\Users\Hiperwall\Desktop\microsemilab\calit2boardtest\constraint\placer_sdc_errors.log}
write_sdc -strict {C:\Users\Hiperwall\Desktop\microsemilab\calit2boardtest\designer\top\place_route.sdc}
