# Written by Synplify Pro version mapact, Build 1659R. Synopsys Run ID: sid1486025525 
# Top Level Design Parameters 

# Clocks 
create_clock -period 10.000 -waveform {0.000 5.000} -name {M2S_MSS|CLK_BASE} [get_ports {CLK_BASE}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {M2S_MSS|APB_S_PCLK} [get_ports {APB_S_PCLK}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {M2S_MSS_sb_MSS|FIC_2_APB_M_PCLK_inferred_clock} [get_pins {M2S_MSS_sb_0/M2S_MSS_sb_MSS_0/MSS_ADLIB_INST:CLK_CONFIG_APB}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {M2S_MSS_sb_CCC_0_FCCC|GL0_net_inferred_clock} [get_pins {M2S_MSS_sb_0/CCC_0/CCC_INST:GL0}] 

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
set Inferred_clkgroup_1 [list M2S_MSS|APB_S_PCLK]
set Inferred_clkgroup_0 [list M2S_MSS|CLK_BASE]
set Inferred_clkgroup_3 [list M2S_MSS_sb_CCC_0_FCCC|GL0_net_inferred_clock]
set Inferred_clkgroup_2 [list M2S_MSS_sb_MSS|FIC_2_APB_M_PCLK_inferred_clock]
set_clock_groups -asynchronous -group $Inferred_clkgroup_1
set_clock_groups -asynchronous -group $Inferred_clkgroup_0
set_clock_groups -asynchronous -group $Inferred_clkgroup_3
set_clock_groups -asynchronous -group $Inferred_clkgroup_2


# syn_mode Attributes 

# Cells 

# Port DRC Rules 

# Input Transition Constraints 

# Unused constraints (intentionally commented out) 

# Non-forward-annotatable constraints (intentionally commented out) 

# Block Path constraints 

