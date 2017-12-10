onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/Fabric_Top_0/DEVRST_N
add wave -noupdate /testbench/Fabric_Top_0/PB_SW
add wave -noupdate -divider {SYSRESET signals}
add wave -noupdate /testbench/Fabric_Top_0/SYSRESET_0/DEVRST_N
add wave -noupdate /testbench/Fabric_Top_0/SYSRESET_0/POWER_ON_RESET_N
add wave -noupdate /testbench/Fabric_Top_0/SYSRESET_0/reset_n_int
add wave -noupdate -divider {FCCC signals}
add wave -noupdate /testbench/Fabric_Top_0/FCCC_0/RCOSC_25_50MHZ
add wave -noupdate /testbench/Fabric_Top_0/FCCC_0/LOCK
add wave -noupdate /testbench/Fabric_Top_0/FCCC_0/GL0
add wave -noupdate -divider {LED_ctrl signals}
add wave -noupdate /testbench/Fabric_Top_0/LED_ctrl_0/RESETn
add wave -noupdate /testbench/Fabric_Top_0/LED_ctrl_0/CLK
add wave -noupdate /testbench/Fabric_Top_0/LED_ctrl_0/sh_clk
add wave -noupdate -radix hexadecimal /testbench/Fabric_Top_0/LED_ctrl_0/LED
add wave -noupdate /testbench/Fabric_Top_0/LED_ctrl_0/PB_SW
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 fs} 0}
quietly wave cursor active 0
configure wave -namecolwidth 348
configure wave -valuecolwidth 79
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ms
update
WaveRestoreZoom {183790065234 fs} {2852654963672 fs}
