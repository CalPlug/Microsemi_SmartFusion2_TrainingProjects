set_component SF2_MSS_sys_sb_MSS
# Microsemi Corp.
# Date: 2017-Nov-01 15:11:02
#

create_clock -period 28.5714 [ get_pins { MSS_ADLIB_INST/CLK_CONFIG_APB } ]
set_false_path -ignore_errors -through [ get_pins { MSS_ADLIB_INST/CONFIG_PRESET_N } ]
