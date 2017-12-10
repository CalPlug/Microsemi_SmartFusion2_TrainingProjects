set_component Top_FCCC_0_FCCC
# Microsemi Corp.
# Date: 2017-Feb-01 03:21:02
#

create_clock -period 20 [ get_pins { CCC_INST/RCOSC_25_50MHZ } ]
create_generated_clock -multiply_by 2 -divide_by 200 -source [ get_pins { CCC_INST/RCOSC_25_50MHZ } ] -phase 0 [ get_pins { CCC_INST/GL0 } ]
