set_device \
    -family  SmartFusion2 \
    -die     PA4M7500_TS \
    -package fg484 \
    -speed   -1 \
    -tempr   {COM} \
    -voltr   {COM}
set_def {VOLTAGE} {1.2}
set_def {VCCI_1.2_VOLTR} {COM}
set_def {VCCI_1.5_VOLTR} {COM}
set_def {VCCI_1.8_VOLTR} {COM}
set_def {VCCI_2.5_VOLTR} {COM}
set_def {VCCI_3.3_VOLTR} {COM}
set_def USE_TCGEN 1
set_def NETLIST_TYPE EDIF
set_name M2S_MSS
set_workdir {C:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\designer\M2S_MSS}
set_log     {C:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\designer\M2S_MSS\M2S_MSS_sdc.log}
set_design_state pre_layout
