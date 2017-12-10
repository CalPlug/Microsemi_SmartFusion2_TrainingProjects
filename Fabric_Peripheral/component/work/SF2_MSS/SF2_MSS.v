//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Feb 02 01:42:53 2017
// Version: v11.7 11.7.0.119
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// SF2_MSS
module SF2_MSS(
    // Inputs
    DEVRST_N,
    MMUART_0_RXD,
    RX,
    SPI_0_DI,
    // Outputs
    MMUART_0_TXD,
    SPI_0_DO,
    TX,
    // Inouts
    COREI2C_0_0_SCL_IO,
    COREI2C_0_0_SDA_IO,
    I2C_0_SCL,
    I2C_0_SDA,
    SPI_0_CLK,
    SPI_0_SS0
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  DEVRST_N;
input  MMUART_0_RXD;
input  RX;
input  SPI_0_DI;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output MMUART_0_TXD;
output SPI_0_DO;
output TX;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout  COREI2C_0_0_SCL_IO;
inout  COREI2C_0_0_SDA_IO;
inout  I2C_0_SCL;
inout  I2C_0_SDA;
inout  SPI_0_CLK;
inout  SPI_0_SS0;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   COREI2C_0_0_SCL_IO;
wire   COREI2C_0_0_SDA_IO;
wire   DEVRST_N;
wire   I2C_0_SCL;
wire   I2C_0_SDA;
wire   MMUART_0_RXD;
wire   MMUART_0_TXD_net_0;
wire   RX;
wire   SPI_0_CLK;
wire   SPI_0_DI;
wire   SPI_0_DO_net_0;
wire   SPI_0_SS0;
wire   TX_net_0;
wire   SPI_0_DO_net_1;
wire   MMUART_0_TXD_net_1;
wire   TX_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   VCC_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net = 1'b1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign SPI_0_DO_net_1     = SPI_0_DO_net_0;
assign SPI_0_DO           = SPI_0_DO_net_1;
assign MMUART_0_TXD_net_1 = MMUART_0_TXD_net_0;
assign MMUART_0_TXD       = MMUART_0_TXD_net_1;
assign TX_net_1           = TX_net_0;
assign TX                 = TX_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------SF2_MSS_sb
SF2_MSS_sb SF2_MSS_sb_0(
        // Inputs
        .SPI_0_DI           ( SPI_0_DI ),
        .MMUART_0_RXD       ( MMUART_0_RXD ),
        .FAB_RESET_N        ( VCC_net ),
        .DEVRST_N           ( DEVRST_N ),
        .RX                 ( RX ),
        // Outputs
        .SPI_0_DO           ( SPI_0_DO_net_0 ),
        .MMUART_0_TXD       ( MMUART_0_TXD_net_0 ),
        .POWER_ON_RESET_N   (  ),
        .INIT_DONE          (  ),
        .FAB_CCC_GL0        (  ),
        .FAB_CCC_LOCK       (  ),
        .MSS_READY          (  ),
        .TX                 ( TX_net_0 ),
        .GPIO_0_M2F         (  ),
        // Inouts
        .I2C_0_SDA          ( I2C_0_SDA ),
        .I2C_0_SCL          ( I2C_0_SCL ),
        .SPI_0_CLK          ( SPI_0_CLK ),
        .SPI_0_SS0          ( SPI_0_SS0 ),
        .COREI2C_0_0_SDA_IO ( COREI2C_0_0_SDA_IO ),
        .COREI2C_0_0_SCL_IO ( COREI2C_0_0_SCL_IO ) 
        );


endmodule
