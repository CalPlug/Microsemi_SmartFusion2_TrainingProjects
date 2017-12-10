set_device \
    -family  SmartFusion2 \
    -die     PA4M1000_N \
    -package tq144 \
    -speed   STD \
    -tempr   {COM} \
    -voltr   {COM}
set_def {VOLTAGE} {1.2}
set_def {VCCI_1.2_VOLTR} {COM}
set_def {VCCI_1.5_VOLTR} {COM}
set_def {VCCI_1.8_VOLTR} {COM}
set_def {VCCI_2.5_VOLTR} {COM}
set_def {VCCI_3.3_VOLTR} {COM}
set_def {PLL_SUPPLY} {PLL_SUPPLY_25}
set_netlist -afl {C:\Users\Hiperwall\Desktop\test\test\designer\debounce\debounce.afl} -adl {C:\Users\Hiperwall\Desktop\test\test\designer\debounce\debounce.adl}
set_constraints   {C:\Users\Hiperwall\Desktop\test\test\designer\debounce\debounce.tcml}
set_placement   {C:\Users\Hiperwall\Desktop\test\test\designer\debounce\debounce.loc}
set_routing     {C:\Users\Hiperwall\Desktop\test\test\designer\debounce\debounce.seg}
