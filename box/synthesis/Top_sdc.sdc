# Written by Synplify Pro version mapact, Build 1659R. Synopsys Run ID: sid1486513741 
# Top Level Design Parameters 

# Clocks 
create_clock -period 10.000 -waveform {0.000 5.000} -name {Top_FCCC_0_FCCC|GL0_net_inferred_clock} [get_pins {FCCC_0/CCC_INST:GL0}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {LED_ctrl|counter_inferred_clock[17]} [get_pins {LED_ctrl_0/counter[17]:Q}] 

# Virtual Clocks 

# Generated Clocks 

# Paths Between Clocks 

# Multicycle Constraints 

# Point-to-point Delay Constraints 

# False Path Constraints 

# Output Load Constraints 

# Driving Cell Constraints 

# Input Delay Constraints 

# Output Delay Constraints 

# Wire Loads 

# Other Constraints 

# syn_hier Attributes 

# set_case Attributes 

# Clock Delay Constraints 
set Inferred_clkgroup_0 [list Top_FCCC_0_FCCC|GL0_net_inferred_clock]
set Inferred_clkgroup_1 [list LED_ctrl|counter_inferred_clock\[17\]]
set_clock_groups -asynchronous -group $Inferred_clkgroup_0
set_clock_groups -asynchronous -group $Inferred_clkgroup_1


# syn_mode Attributes 

# Cells 

# Port DRC Rules 

# Input Transition Constraints 

# Unused constraints (intentionally commented out) 

# Non-forward-annotatable constraints (intentionally commented out) 

# Block Path constraints 

