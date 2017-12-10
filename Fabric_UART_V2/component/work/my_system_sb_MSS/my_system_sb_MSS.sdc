set_component my_system_sb_MSS
# Microsemi Corp.
# Date: 2017-Feb-06 11:43:17
#

create_clock -period 40 [ get_pins { MSS_ADLIB_INST/CLK_CONFIG_APB } ]
