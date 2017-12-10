set_component SF2_MSS_sys_sb_CCC_0_FCCC
# Microsemi Corp.
# Date: 2017-Dec-08 20:32:41
#

create_clock -period 20 [ get_pins { CCC_INST/RCOSC_25_50MHZ } ]
create_generated_clock -multiply_by 7 -divide_by 5 -source [ get_pins { CCC_INST/RCOSC_25_50MHZ } ] -phase 0 [ get_pins { CCC_INST/GL0 } ]
create_generated_clock -multiply_by 7 -divide_by 350 -source [ get_pins { CCC_INST/RCOSC_25_50MHZ } ] -phase 0 [ get_pins { CCC_INST/GL1 } ]
