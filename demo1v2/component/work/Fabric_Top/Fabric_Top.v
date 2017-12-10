//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Feb 01 03:19:11 2017
// Version: v11.7 11.7.0.119
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Fabric_Top
module Fabric_Top(
    // Inputs
    DEVRST_N,
    PB_SW,
    // Outputs
    LED
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input        DEVRST_N;
input        PB_SW;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [1:0] LED;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire         AND2_0_Y;
wire         DEVRST_N;
wire         FCCC_0_GL0;
wire         FCCC_0_LOCK;
wire   [1:0] LED_net_0;
wire         OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC;
wire         PB_SW;
wire         SYSRESET_0_POWER_ON_RESET_N;
wire   [1:0] LED_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire         GND_net;
wire   [7:2] PADDR_const_net_0;
wire   [7:0] PWDATA_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net            = 1'b0;
assign PADDR_const_net_0  = 6'h00;
assign PWDATA_const_net_0 = 8'h00;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign LED_net_1 = LED_net_0;
assign LED[1:0]  = LED_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AND2
AND2 AND2_0(
        // Inputs
        .A ( FCCC_0_LOCK ),
        .B ( SYSRESET_0_POWER_ON_RESET_N ),
        // Outputs
        .Y ( AND2_0_Y ) 
        );

//--------Fabric_Top_FCCC_0_FCCC   -   Actel:SgCore:FCCC:2.0.201
Fabric_Top_FCCC_0_FCCC FCCC_0(
        // Inputs
        .RCOSC_25_50MHZ ( OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC ),
        // Outputs
        .GL0            ( FCCC_0_GL0 ),
        .LOCK           ( FCCC_0_LOCK ) 
        );

//--------LED_ctrl
LED_ctrl LED_ctrl_0(
        // Inputs
        .CLK    ( FCCC_0_GL0 ),
        .RESETn ( AND2_0_Y ),
        .PB_SW  ( PB_SW ),
        // Outputs
        .LED    ( LED_net_0 ) 
        );

//--------Fabric_Top_OSC_0_OSC   -   Actel:SgCore:OSC:2.0.101
Fabric_Top_OSC_0_OSC OSC_0(
        // Inputs
        .XTL                ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .RCOSC_25_50MHZ_CCC ( OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC ),
        .RCOSC_25_50MHZ_O2F (  ),
        .RCOSC_1MHZ_CCC     (  ),
        .RCOSC_1MHZ_O2F     (  ),
        .XTLOSC_CCC         (  ),
        .XTLOSC_O2F         (  ) 
        );

//--------SYSRESET
SYSRESET SYSRESET_0(
        // Inputs
        .DEVRST_N         ( DEVRST_N ),
        // Outputs
        .POWER_ON_RESET_N ( SYSRESET_0_POWER_ON_RESET_N ) 
        );


endmodule
