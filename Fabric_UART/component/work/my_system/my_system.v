//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Feb 03 17:07:24 2017
// Version: v11.7 11.7.0.119
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// my_system
module my_system(
    // Inputs
    DEVRST_N,
    I2C_0_SCL_F2M,
    I2C_0_SDA_F2M,
    I2C_1_SCL_F2M,
    I2C_1_SDA_F2M,
    MMUART_0_RXD_F2M,
    MMUART_1_RXD_F2M,
    RX,
    RX_0,
    RX_1,
    SPI_0_CLK_F2M,
    SPI_0_DI_F2M,
    SPI_0_SS0_F2M,
    SPI_1_CLK_F2M,
    SPI_1_DI_F2M,
    SPI_1_SS0_F2M,
    // Outputs
    FAB_CCC_GL0,
    FAB_CCC_LOCK,
    I2C_0_SCL_M2F,
    I2C_0_SCL_M2F_OE,
    I2C_0_SDA_M2F,
    I2C_0_SDA_M2F_OE,
    I2C_1_SCL_M2F,
    I2C_1_SCL_M2F_OE,
    I2C_1_SDA_M2F,
    I2C_1_SDA_M2F_OE,
    MMUART_0_TXD_M2F,
    MMUART_1_TXD_M2F,
    SPI_0_CLK_M2F,
    SPI_0_DO_M2F,
    SPI_0_SS0_M2F,
    SPI_0_SS0_M2F_OE,
    SPI_1_CLK_M2F,
    SPI_1_DO_M2F,
    SPI_1_SS0_M2F,
    SPI_1_SS0_M2F_OE,
    TX,
    TX_1
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  DEVRST_N;
input  I2C_0_SCL_F2M;
input  I2C_0_SDA_F2M;
input  I2C_1_SCL_F2M;
input  I2C_1_SDA_F2M;
input  MMUART_0_RXD_F2M;
input  MMUART_1_RXD_F2M;
input  RX;
input  RX_0;
input  RX_1;
input  SPI_0_CLK_F2M;
input  SPI_0_DI_F2M;
input  SPI_0_SS0_F2M;
input  SPI_1_CLK_F2M;
input  SPI_1_DI_F2M;
input  SPI_1_SS0_F2M;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output FAB_CCC_GL0;
output FAB_CCC_LOCK;
output I2C_0_SCL_M2F;
output I2C_0_SCL_M2F_OE;
output I2C_0_SDA_M2F;
output I2C_0_SDA_M2F_OE;
output I2C_1_SCL_M2F;
output I2C_1_SCL_M2F_OE;
output I2C_1_SDA_M2F;
output I2C_1_SDA_M2F_OE;
output MMUART_0_TXD_M2F;
output MMUART_1_TXD_M2F;
output SPI_0_CLK_M2F;
output SPI_0_DO_M2F;
output SPI_0_SS0_M2F;
output SPI_0_SS0_M2F_OE;
output SPI_1_CLK_M2F;
output SPI_1_DO_M2F;
output SPI_1_SS0_M2F;
output SPI_1_SS0_M2F_OE;
output TX;
output TX_1;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   DEVRST_N;
wire   FAB_CCC_GL0_net_0;
wire   FAB_CCC_LOCK_net_0;
wire   I2C_0_SCL_F2M;
wire   I2C_0_SCL_M2F_net_0;
wire   I2C_0_SCL_M2F_OE_net_0;
wire   I2C_0_SDA_F2M;
wire   I2C_0_SDA_M2F_net_0;
wire   I2C_0_SDA_M2F_OE_net_0;
wire   I2C_1_SCL_F2M;
wire   I2C_1_SCL_M2F_net_0;
wire   I2C_1_SCL_M2F_OE_net_0;
wire   I2C_1_SDA_F2M;
wire   I2C_1_SDA_M2F_net_0;
wire   I2C_1_SDA_M2F_OE_net_0;
wire   MMUART_0_RXD_F2M;
wire   MMUART_0_TXD_M2F_net_0;
wire   MMUART_1_RXD_F2M;
wire   MMUART_1_TXD_M2F_net_0;
wire   RX;
wire   RX_0;
wire   RX_1;
wire   SPI_0_CLK_F2M;
wire   SPI_0_CLK_M2F_net_0;
wire   SPI_0_DI_F2M;
wire   SPI_0_DO_M2F_net_0;
wire   SPI_0_SS0_F2M;
wire   SPI_0_SS0_M2F_net_0;
wire   SPI_0_SS0_M2F_OE_net_0;
wire   SPI_1_CLK_F2M;
wire   SPI_1_CLK_M2F_net_0;
wire   SPI_1_DI_F2M;
wire   SPI_1_DO_M2F_net_0;
wire   SPI_1_SS0_F2M;
wire   SPI_1_SS0_M2F_net_0;
wire   SPI_1_SS0_M2F_OE_net_0;
wire   TX_net_0;
wire   TX_1_net_0;
wire   TX_1_net_1;
wire   TX_net_1;
wire   I2C_1_SCL_M2F_OE_net_1;
wire   I2C_0_SCL_M2F_net_1;
wire   I2C_0_SDA_M2F_net_1;
wire   I2C_0_SDA_M2F_OE_net_1;
wire   I2C_0_SCL_M2F_OE_net_1;
wire   SPI_0_SS0_M2F_OE_net_1;
wire   SPI_1_SS0_M2F_net_1;
wire   SPI_0_CLK_M2F_net_1;
wire   SPI_1_CLK_M2F_net_1;
wire   MMUART_1_TXD_M2F_net_1;
wire   SPI_1_SS0_M2F_OE_net_1;
wire   FAB_CCC_LOCK_net_1;
wire   I2C_1_SCL_M2F_net_1;
wire   I2C_1_SDA_M2F_net_1;
wire   I2C_1_SDA_M2F_OE_net_1;
wire   FAB_CCC_GL0_net_1;
wire   MMUART_0_TXD_M2F_net_1;
wire   SPI_1_DO_M2F_net_1;
wire   SPI_0_SS0_M2F_net_1;
wire   SPI_0_DO_M2F_net_1;
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
assign TX_1_net_1             = TX_1_net_0;
assign TX_1                   = TX_1_net_1;
assign TX_net_1               = TX_net_0;
assign TX                     = TX_net_1;
assign I2C_1_SCL_M2F_OE_net_1 = I2C_1_SCL_M2F_OE_net_0;
assign I2C_1_SCL_M2F_OE       = I2C_1_SCL_M2F_OE_net_1;
assign I2C_0_SCL_M2F_net_1    = I2C_0_SCL_M2F_net_0;
assign I2C_0_SCL_M2F          = I2C_0_SCL_M2F_net_1;
assign I2C_0_SDA_M2F_net_1    = I2C_0_SDA_M2F_net_0;
assign I2C_0_SDA_M2F          = I2C_0_SDA_M2F_net_1;
assign I2C_0_SDA_M2F_OE_net_1 = I2C_0_SDA_M2F_OE_net_0;
assign I2C_0_SDA_M2F_OE       = I2C_0_SDA_M2F_OE_net_1;
assign I2C_0_SCL_M2F_OE_net_1 = I2C_0_SCL_M2F_OE_net_0;
assign I2C_0_SCL_M2F_OE       = I2C_0_SCL_M2F_OE_net_1;
assign SPI_0_SS0_M2F_OE_net_1 = SPI_0_SS0_M2F_OE_net_0;
assign SPI_0_SS0_M2F_OE       = SPI_0_SS0_M2F_OE_net_1;
assign SPI_1_SS0_M2F_net_1    = SPI_1_SS0_M2F_net_0;
assign SPI_1_SS0_M2F          = SPI_1_SS0_M2F_net_1;
assign SPI_0_CLK_M2F_net_1    = SPI_0_CLK_M2F_net_0;
assign SPI_0_CLK_M2F          = SPI_0_CLK_M2F_net_1;
assign SPI_1_CLK_M2F_net_1    = SPI_1_CLK_M2F_net_0;
assign SPI_1_CLK_M2F          = SPI_1_CLK_M2F_net_1;
assign MMUART_1_TXD_M2F_net_1 = MMUART_1_TXD_M2F_net_0;
assign MMUART_1_TXD_M2F       = MMUART_1_TXD_M2F_net_1;
assign SPI_1_SS0_M2F_OE_net_1 = SPI_1_SS0_M2F_OE_net_0;
assign SPI_1_SS0_M2F_OE       = SPI_1_SS0_M2F_OE_net_1;
assign FAB_CCC_LOCK_net_1     = FAB_CCC_LOCK_net_0;
assign FAB_CCC_LOCK           = FAB_CCC_LOCK_net_1;
assign I2C_1_SCL_M2F_net_1    = I2C_1_SCL_M2F_net_0;
assign I2C_1_SCL_M2F          = I2C_1_SCL_M2F_net_1;
assign I2C_1_SDA_M2F_net_1    = I2C_1_SDA_M2F_net_0;
assign I2C_1_SDA_M2F          = I2C_1_SDA_M2F_net_1;
assign I2C_1_SDA_M2F_OE_net_1 = I2C_1_SDA_M2F_OE_net_0;
assign I2C_1_SDA_M2F_OE       = I2C_1_SDA_M2F_OE_net_1;
assign FAB_CCC_GL0_net_1      = FAB_CCC_GL0_net_0;
assign FAB_CCC_GL0            = FAB_CCC_GL0_net_1;
assign MMUART_0_TXD_M2F_net_1 = MMUART_0_TXD_M2F_net_0;
assign MMUART_0_TXD_M2F       = MMUART_0_TXD_M2F_net_1;
assign SPI_1_DO_M2F_net_1     = SPI_1_DO_M2F_net_0;
assign SPI_1_DO_M2F           = SPI_1_DO_M2F_net_1;
assign SPI_0_SS0_M2F_net_1    = SPI_0_SS0_M2F_net_0;
assign SPI_0_SS0_M2F          = SPI_0_SS0_M2F_net_1;
assign SPI_0_DO_M2F_net_1     = SPI_0_DO_M2F_net_0;
assign SPI_0_DO_M2F           = SPI_0_DO_M2F_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------my_system_sb
my_system_sb my_system_sb_0(
        // Inputs
        .FAB_RESET_N      ( VCC_net ),
        .DEVRST_N         ( DEVRST_N ),
        .RX               ( RX ),
        .RX_0             ( RX_0 ),
        .RX_1             ( RX_1 ),
        .SPI_1_DI_F2M     ( SPI_1_DI_F2M ),
        .SPI_1_CLK_F2M    ( SPI_1_CLK_F2M ),
        .SPI_1_SS0_F2M    ( SPI_1_SS0_F2M ),
        .MMUART_0_RXD_F2M ( MMUART_0_RXD_F2M ),
        .MMUART_1_RXD_F2M ( MMUART_1_RXD_F2M ),
        .I2C_0_SDA_F2M    ( I2C_0_SDA_F2M ),
        .I2C_0_SCL_F2M    ( I2C_0_SCL_F2M ),
        .I2C_1_SDA_F2M    ( I2C_1_SDA_F2M ),
        .I2C_1_SCL_F2M    ( I2C_1_SCL_F2M ),
        .SPI_0_DI_F2M     ( SPI_0_DI_F2M ),
        .SPI_0_CLK_F2M    ( SPI_0_CLK_F2M ),
        .SPI_0_SS0_F2M    ( SPI_0_SS0_F2M ),
        // Outputs
        .POWER_ON_RESET_N (  ),
        .INIT_DONE        (  ),
        .FAB_CCC_GL0      ( FAB_CCC_GL0_net_0 ),
        .FAB_CCC_LOCK     ( FAB_CCC_LOCK_net_0 ),
        .MSS_READY        (  ),
        .TX               ( TX_net_0 ),
        .TX_0             (  ),
        .TX_1             ( TX_1_net_0 ),
        .SPI_1_DO_M2F     ( SPI_1_DO_M2F_net_0 ),
        .SPI_1_CLK_M2F    ( SPI_1_CLK_M2F_net_0 ),
        .SPI_1_SS0_M2F    ( SPI_1_SS0_M2F_net_0 ),
        .SPI_1_SS0_M2F_OE ( SPI_1_SS0_M2F_OE_net_0 ),
        .MMUART_0_TXD_M2F ( MMUART_0_TXD_M2F_net_0 ),
        .MMUART_1_TXD_M2F ( MMUART_1_TXD_M2F_net_0 ),
        .I2C_0_SDA_M2F    ( I2C_0_SDA_M2F_net_0 ),
        .I2C_0_SDA_M2F_OE ( I2C_0_SDA_M2F_OE_net_0 ),
        .I2C_0_SCL_M2F    ( I2C_0_SCL_M2F_net_0 ),
        .I2C_0_SCL_M2F_OE ( I2C_0_SCL_M2F_OE_net_0 ),
        .I2C_1_SDA_M2F    ( I2C_1_SDA_M2F_net_0 ),
        .I2C_1_SDA_M2F_OE ( I2C_1_SDA_M2F_OE_net_0 ),
        .I2C_1_SCL_M2F    ( I2C_1_SCL_M2F_net_0 ),
        .I2C_1_SCL_M2F_OE ( I2C_1_SCL_M2F_OE_net_0 ),
        .SPI_0_DO_M2F     ( SPI_0_DO_M2F_net_0 ),
        .SPI_0_CLK_M2F    ( SPI_0_CLK_M2F_net_0 ),
        .SPI_0_SS0_M2F    ( SPI_0_SS0_M2F_net_0 ),
        .SPI_0_SS0_M2F_OE ( SPI_0_SS0_M2F_OE_net_0 ) 
        );


endmodule
