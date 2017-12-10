//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Feb 02 00:50:55 2017
// Version: v11.7 11.7.0.119
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// M2S_MSS
module M2S_MSS(
    // Inputs
    APB_S_PCLK,
    APB_S_PRESET_N,
    CLK_BASE,
    DEVRST_N,
    MDDR_DQS_TMATCH_0_IN,
    MMUART_0_RXD,
    MMUART_1_RXD,
    PCIE_0_CORE_RESET_N,
    PCIE_0_INTERRUPT,
    PCIE_0_PERST_N,
    PHY_RESET_N,
    REFCLK0_N,
    REFCLK0_P,
    RXD0_N,
    RXD0_P,
    RXD1_N,
    RXD1_P,
    RXD2_N,
    RXD2_P,
    RXD3_N,
    RXD3_P,
    SDIF0_SPLL_LOCK,
    SPI_0_DI,
    SPI_1_DI,
    // Outputs
    FAB_CCC_GL0,
    FAB_CCC_LOCK,
    GPIO_0_M2F,
    GPIO_1_M2F,
    GPIO_2_M2F,
    GPIO_3_M2F,
    MDDR_ADDR,
    MDDR_BA,
    MDDR_CAS_N,
    MDDR_CKE,
    MDDR_CLK,
    MDDR_CLK_N,
    MDDR_CS_N,
    MDDR_DQS_TMATCH_0_OUT,
    MDDR_ODT,
    MDDR_RAS_N,
    MDDR_RESET_N,
    MDDR_WE_N,
    MMUART_0_TXD,
    MMUART_1_TXD,
    SDIF0_0_CORE_RESET_N,
    SDIF0_1_CORE_RESET_N,
    SDIF0_PHY_RESET_N,
    SPI_0_DO,
    SPI_1_DO,
    TXD0_N,
    TXD0_P,
    TXD1_N,
    TXD1_P,
    TXD2_N,
    TXD2_P,
    TXD3_N,
    TXD3_P,
    // Inouts
    I2C_0_SCL,
    I2C_0_SDA,
    I2C_1_SCL,
    I2C_1_SDA,
    MDDR_DM_RDQS,
    MDDR_DQ,
    MDDR_DQS,
    MDDR_DQS_N,
    SPI_0_CLK,
    SPI_0_SS0,
    SPI_1_CLK,
    SPI_1_SS0
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         APB_S_PCLK;
input         APB_S_PRESET_N;
input         CLK_BASE;
input         DEVRST_N;
input         MDDR_DQS_TMATCH_0_IN;
input         MMUART_0_RXD;
input         MMUART_1_RXD;
input         PCIE_0_CORE_RESET_N;
input  [3:0]  PCIE_0_INTERRUPT;
input         PCIE_0_PERST_N;
input         PHY_RESET_N;
input         REFCLK0_N;
input         REFCLK0_P;
input         RXD0_N;
input         RXD0_P;
input         RXD1_N;
input         RXD1_P;
input         RXD2_N;
input         RXD2_P;
input         RXD3_N;
input         RXD3_P;
input         SDIF0_SPLL_LOCK;
input         SPI_0_DI;
input         SPI_1_DI;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        FAB_CCC_GL0;
output        FAB_CCC_LOCK;
output        GPIO_0_M2F;
output        GPIO_1_M2F;
output        GPIO_2_M2F;
output        GPIO_3_M2F;
output [15:0] MDDR_ADDR;
output [2:0]  MDDR_BA;
output        MDDR_CAS_N;
output        MDDR_CKE;
output        MDDR_CLK;
output        MDDR_CLK_N;
output        MDDR_CS_N;
output        MDDR_DQS_TMATCH_0_OUT;
output        MDDR_ODT;
output        MDDR_RAS_N;
output        MDDR_RESET_N;
output        MDDR_WE_N;
output        MMUART_0_TXD;
output        MMUART_1_TXD;
output        SDIF0_0_CORE_RESET_N;
output        SDIF0_1_CORE_RESET_N;
output        SDIF0_PHY_RESET_N;
output        SPI_0_DO;
output        SPI_1_DO;
output        TXD0_N;
output        TXD0_P;
output        TXD1_N;
output        TXD1_P;
output        TXD2_N;
output        TXD2_P;
output        TXD3_N;
output        TXD3_P;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout         I2C_0_SCL;
inout         I2C_0_SDA;
inout         I2C_1_SCL;
inout         I2C_1_SDA;
inout  [0:0]  MDDR_DM_RDQS;
inout  [7:0]  MDDR_DQ;
inout  [0:0]  MDDR_DQS;
inout  [0:0]  MDDR_DQS_N;
inout         SPI_0_CLK;
inout         SPI_0_SS0;
inout         SPI_1_CLK;
inout         SPI_1_SS0;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          APB_S_PCLK;
wire          APB_S_PRESET_N;
wire          CLK_BASE;
wire          DEVRST_N;
wire          FAB_CCC_GL0_net_0;
wire          FAB_CCC_LOCK_net_0;
wire          GPIO_0_M2F_net_0;
wire          GPIO_1_M2F_net_0;
wire          GPIO_2_M2F_net_0;
wire          GPIO_3_M2F_net_0;
wire          I2C_0_SCL;
wire          I2C_0_SDA;
wire          I2C_1_SCL;
wire          I2C_1_SDA;
wire          M2S_MSS_sb_0_SDIF0_INIT_APB_PENABLE;
wire   [31:0] M2S_MSS_sb_0_SDIF0_INIT_APB_PRDATA;
wire          M2S_MSS_sb_0_SDIF0_INIT_APB_PREADY;
wire          M2S_MSS_sb_0_SDIF0_INIT_APB_PSELx;
wire          M2S_MSS_sb_0_SDIF0_INIT_APB_PSLVERR;
wire   [31:0] M2S_MSS_sb_0_SDIF0_INIT_APB_PWDATA;
wire          M2S_MSS_sb_0_SDIF0_INIT_APB_PWRITE;
wire   [15:0] MDDR_ADDR_net_0;
wire   [2:0]  MDDR_BA_net_0;
wire          MDDR_CAS_N_net_0;
wire          MDDR_CKE_net_0;
wire          MDDR_CLK_net_0;
wire          MDDR_CLK_N_net_0;
wire          MDDR_CS_N_net_0;
wire   [0:0]  MDDR_DM_RDQS;
wire   [7:0]  MDDR_DQ;
wire   [0:0]  MDDR_DQS;
wire   [0:0]  MDDR_DQS_N;
wire          MDDR_DQS_TMATCH_0_IN;
wire          MDDR_DQS_TMATCH_0_OUT_net_0;
wire          MDDR_ODT_net_0;
wire          MDDR_RAS_N_net_0;
wire          MDDR_RESET_N_net_0;
wire          MDDR_WE_N_net_0;
wire          MMUART_0_RXD;
wire          MMUART_0_TXD_net_0;
wire          MMUART_1_RXD;
wire          MMUART_1_TXD_net_0;
wire          PCIE_0_CORE_RESET_N;
wire   [3:0]  PCIE_0_INTERRUPT;
wire          PCIE_0_PERST_N;
wire          PHY_RESET_N;
wire          REFCLK0_N;
wire          REFCLK0_P;
wire          RXD0_N;
wire          RXD0_P;
wire          RXD1_N;
wire          RXD1_P;
wire          RXD2_N;
wire          RXD2_P;
wire          RXD3_N;
wire          RXD3_P;
wire          SDIF0_0_CORE_RESET_N_net_0;
wire          SDIF0_1_CORE_RESET_N_net_0;
wire          SDIF0_PHY_RESET_N_net_0;
wire          SDIF0_SPLL_LOCK;
wire          SPI_0_CLK;
wire          SPI_0_DI;
wire          SPI_0_DO_net_0;
wire          SPI_0_SS0;
wire          SPI_1_CLK;
wire          SPI_1_DI;
wire          SPI_1_DO_net_0;
wire          SPI_1_SS0;
wire          TXD0_N_net_0;
wire          TXD0_P_net_0;
wire          TXD1_N_net_0;
wire          TXD1_P_net_0;
wire          TXD2_N_net_0;
wire          TXD2_P_net_0;
wire          TXD3_N_net_0;
wire          TXD3_P_net_0;
wire          SPI_0_DO_net_1;
wire          SPI_1_DO_net_1;
wire          MMUART_1_TXD_net_1;
wire          MMUART_0_TXD_net_1;
wire          MDDR_DQS_TMATCH_0_OUT_net_1;
wire          MDDR_CAS_N_net_1;
wire          MDDR_CLK_net_1;
wire          MDDR_CLK_N_net_1;
wire          MDDR_CKE_net_1;
wire          MDDR_CS_N_net_1;
wire          MDDR_ODT_net_1;
wire          MDDR_RAS_N_net_1;
wire          MDDR_RESET_N_net_1;
wire          MDDR_WE_N_net_1;
wire          GPIO_1_M2F_net_1;
wire          GPIO_0_M2F_net_1;
wire          GPIO_2_M2F_net_1;
wire          GPIO_3_M2F_net_1;
wire          TXD0_P_net_1;
wire          TXD0_N_net_1;
wire          TXD1_P_net_1;
wire          TXD1_N_net_1;
wire          TXD2_P_net_1;
wire          TXD2_N_net_1;
wire          TXD3_P_net_1;
wire          TXD3_N_net_1;
wire   [15:0] MDDR_ADDR_net_1;
wire   [2:0]  MDDR_BA_net_1;
wire          FAB_CCC_GL0_net_1;
wire          SDIF0_PHY_RESET_N_net_1;
wire          SDIF0_0_CORE_RESET_N_net_1;
wire          SDIF0_1_CORE_RESET_N_net_1;
wire          FAB_CCC_LOCK_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          VCC_net;
wire          GND_net;
wire   [19:0] EPCS_0_TX_DATA_const_net_0;
wire   [19:0] EPCS_1_TX_DATA_const_net_0;
wire   [19:0] EPCS_2_TX_DATA_const_net_0;
wire   [19:0] EPCS_3_TX_DATA_const_net_0;
wire   [9:0]  SGMII_TX_DATA_const_net_0;
wire   [3:0]  AXI_0_S_AWID_const_net_0;
wire   [31:0] AXI_0_S_AWADDR_const_net_0;
wire   [3:0]  AXI_0_S_AWLEN_const_net_0;
wire   [1:0]  AXI_0_S_AWSIZE_const_net_0;
wire   [1:0]  AXI_0_S_AWBURST_const_net_0;
wire   [1:0]  AXI_0_S_AWLOCK_const_net_0;
wire   [3:0]  AXI_0_S_WID_const_net_0;
wire   [7:0]  AXI_0_S_WSTRB_const_net_0;
wire   [63:0] AXI_0_S_WDATA_const_net_0;
wire   [3:0]  AXI_0_S_ARID_const_net_0;
wire   [31:0] AXI_0_S_ARADDR_const_net_0;
wire   [3:0]  AXI_0_S_ARLEN_const_net_0;
wire   [1:0]  AXI_0_S_ARSIZE_const_net_0;
wire   [1:0]  AXI_0_S_ARBURST_const_net_0;
wire   [1:0]  AXI_0_S_ARLOCK_const_net_0;
wire   [3:0]  AXI_1_M_BID_const_net_0;
wire   [1:0]  AXI_1_M_BRESP_const_net_0;
wire   [3:0]  AXI_1_M_RID_const_net_0;
wire   [63:0] AXI_1_M_RDATA_const_net_0;
wire   [1:0]  AXI_1_M_RRESP_const_net_0;
wire   [3:0]  AXI_1_S_AWID_const_net_0;
wire   [31:0] AXI_1_S_AWADDR_const_net_0;
wire   [3:0]  AXI_1_S_AWLEN_const_net_0;
wire   [1:0]  AXI_1_S_AWSIZE_const_net_0;
wire   [1:0]  AXI_1_S_AWBURST_const_net_0;
wire   [1:0]  AXI_1_S_AWLOCK_const_net_0;
wire   [3:0]  AXI_1_S_WID_const_net_0;
wire   [7:0]  AXI_1_S_WSTRB_const_net_0;
wire   [63:0] AXI_1_S_WDATA_const_net_0;
wire   [3:0]  AXI_1_S_ARID_const_net_0;
wire   [31:0] AXI_1_S_ARADDR_const_net_0;
wire   [3:0]  AXI_1_S_ARLEN_const_net_0;
wire   [1:0]  AXI_1_S_ARSIZE_const_net_0;
wire   [1:0]  AXI_1_S_ARBURST_const_net_0;
wire   [1:0]  AXI_1_S_ARLOCK_const_net_0;
wire   [31:0] AHB_0_M_HRDATA_const_net_0;
wire   [31:0] AHB_0_S_HADDR_const_net_0;
wire   [2:0]  AHB_0_S_HBURST_const_net_0;
wire   [1:0]  AHB_0_S_HSIZE_const_net_0;
wire   [1:0]  AHB_0_S_HTRANS_const_net_0;
wire   [31:0] AHB_0_S_HWDATA_const_net_0;
wire   [31:0] AHB_1_M_HRDATA_const_net_0;
wire   [31:0] AHB_1_S_HADDR_const_net_0;
wire   [2:0]  AHB_1_S_HBURST_const_net_0;
wire   [1:0]  AHB_1_S_HSIZE_const_net_0;
wire   [1:0]  AHB_1_S_HTRANS_const_net_0;
wire   [31:0] AHB_1_S_HWDATA_const_net_0;
wire   [4:0]  XAUI_MMD_PRTAD_const_net_0;
wire   [4:0]  XAUI_MMD_DEVID_const_net_0;
wire   [63:0] XAUI_TXD_const_net_0;
wire   [7:0]  XAUI_TXC_const_net_0;
wire   [3:0]  PCIE_1_INTERRUPT_const_net_0;
wire   [3:0]  AXI_0_M_BID_const_net_0;
wire   [1:0]  AXI_0_M_BRESP_const_net_0;
wire   [3:0]  AXI_0_M_RID_const_net_0;
wire   [63:0] AXI_0_M_RDATA_const_net_0;
wire   [1:0]  AXI_0_M_RRESP_const_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [14:2] M2S_MSS_sb_0_SDIF0_INIT_APB_PADDR_0_14to2;
wire   [14:2] M2S_MSS_sb_0_SDIF0_INIT_APB_PADDR_0;
wire   [15:2] M2S_MSS_sb_0_SDIF0_INIT_APB_PADDR;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net                      = 1'b1;
assign GND_net                      = 1'b0;
assign EPCS_0_TX_DATA_const_net_0   = 20'h00000;
assign EPCS_1_TX_DATA_const_net_0   = 20'h00000;
assign EPCS_2_TX_DATA_const_net_0   = 20'h00000;
assign EPCS_3_TX_DATA_const_net_0   = 20'h00000;
assign SGMII_TX_DATA_const_net_0    = 10'h000;
assign AXI_0_S_AWID_const_net_0     = 4'h0;
assign AXI_0_S_AWADDR_const_net_0   = 32'h00000000;
assign AXI_0_S_AWLEN_const_net_0    = 4'h0;
assign AXI_0_S_AWSIZE_const_net_0   = 2'h0;
assign AXI_0_S_AWBURST_const_net_0  = 2'h0;
assign AXI_0_S_AWLOCK_const_net_0   = 2'h0;
assign AXI_0_S_WID_const_net_0      = 4'h0;
assign AXI_0_S_WSTRB_const_net_0    = 8'h00;
assign AXI_0_S_WDATA_const_net_0    = 64'h0000000000000000;
assign AXI_0_S_ARID_const_net_0     = 4'h0;
assign AXI_0_S_ARADDR_const_net_0   = 32'h00000000;
assign AXI_0_S_ARLEN_const_net_0    = 4'h0;
assign AXI_0_S_ARSIZE_const_net_0   = 2'h0;
assign AXI_0_S_ARBURST_const_net_0  = 2'h0;
assign AXI_0_S_ARLOCK_const_net_0   = 2'h0;
assign AXI_1_M_BID_const_net_0      = 4'h0;
assign AXI_1_M_BRESP_const_net_0    = 2'h0;
assign AXI_1_M_RID_const_net_0      = 4'h0;
assign AXI_1_M_RDATA_const_net_0    = 64'h0000000000000000;
assign AXI_1_M_RRESP_const_net_0    = 2'h0;
assign AXI_1_S_AWID_const_net_0     = 4'h0;
assign AXI_1_S_AWADDR_const_net_0   = 32'h00000000;
assign AXI_1_S_AWLEN_const_net_0    = 4'h0;
assign AXI_1_S_AWSIZE_const_net_0   = 2'h0;
assign AXI_1_S_AWBURST_const_net_0  = 2'h0;
assign AXI_1_S_AWLOCK_const_net_0   = 2'h0;
assign AXI_1_S_WID_const_net_0      = 4'h0;
assign AXI_1_S_WSTRB_const_net_0    = 8'h00;
assign AXI_1_S_WDATA_const_net_0    = 64'h0000000000000000;
assign AXI_1_S_ARID_const_net_0     = 4'h0;
assign AXI_1_S_ARADDR_const_net_0   = 32'h00000000;
assign AXI_1_S_ARLEN_const_net_0    = 4'h0;
assign AXI_1_S_ARSIZE_const_net_0   = 2'h0;
assign AXI_1_S_ARBURST_const_net_0  = 2'h0;
assign AXI_1_S_ARLOCK_const_net_0   = 2'h0;
assign AHB_0_M_HRDATA_const_net_0   = 32'h00000000;
assign AHB_0_S_HADDR_const_net_0    = 32'h00000000;
assign AHB_0_S_HBURST_const_net_0   = 3'h0;
assign AHB_0_S_HSIZE_const_net_0    = 2'h0;
assign AHB_0_S_HTRANS_const_net_0   = 2'h0;
assign AHB_0_S_HWDATA_const_net_0   = 32'h00000000;
assign AHB_1_M_HRDATA_const_net_0   = 32'h00000000;
assign AHB_1_S_HADDR_const_net_0    = 32'h00000000;
assign AHB_1_S_HBURST_const_net_0   = 3'h0;
assign AHB_1_S_HSIZE_const_net_0    = 2'h0;
assign AHB_1_S_HTRANS_const_net_0   = 2'h0;
assign AHB_1_S_HWDATA_const_net_0   = 32'h00000000;
assign XAUI_MMD_PRTAD_const_net_0   = 5'h00;
assign XAUI_MMD_DEVID_const_net_0   = 5'h00;
assign XAUI_TXD_const_net_0         = 64'h0000000000000000;
assign XAUI_TXC_const_net_0         = 8'h00;
assign PCIE_1_INTERRUPT_const_net_0 = 4'h0;
assign AXI_0_M_BID_const_net_0      = 4'h0;
assign AXI_0_M_BRESP_const_net_0    = 2'h0;
assign AXI_0_M_RID_const_net_0      = 4'h0;
assign AXI_0_M_RDATA_const_net_0    = 64'h0000000000000000;
assign AXI_0_M_RRESP_const_net_0    = 2'h0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign SPI_0_DO_net_1              = SPI_0_DO_net_0;
assign SPI_0_DO                    = SPI_0_DO_net_1;
assign SPI_1_DO_net_1              = SPI_1_DO_net_0;
assign SPI_1_DO                    = SPI_1_DO_net_1;
assign MMUART_1_TXD_net_1          = MMUART_1_TXD_net_0;
assign MMUART_1_TXD                = MMUART_1_TXD_net_1;
assign MMUART_0_TXD_net_1          = MMUART_0_TXD_net_0;
assign MMUART_0_TXD                = MMUART_0_TXD_net_1;
assign MDDR_DQS_TMATCH_0_OUT_net_1 = MDDR_DQS_TMATCH_0_OUT_net_0;
assign MDDR_DQS_TMATCH_0_OUT       = MDDR_DQS_TMATCH_0_OUT_net_1;
assign MDDR_CAS_N_net_1            = MDDR_CAS_N_net_0;
assign MDDR_CAS_N                  = MDDR_CAS_N_net_1;
assign MDDR_CLK_net_1              = MDDR_CLK_net_0;
assign MDDR_CLK                    = MDDR_CLK_net_1;
assign MDDR_CLK_N_net_1            = MDDR_CLK_N_net_0;
assign MDDR_CLK_N                  = MDDR_CLK_N_net_1;
assign MDDR_CKE_net_1              = MDDR_CKE_net_0;
assign MDDR_CKE                    = MDDR_CKE_net_1;
assign MDDR_CS_N_net_1             = MDDR_CS_N_net_0;
assign MDDR_CS_N                   = MDDR_CS_N_net_1;
assign MDDR_ODT_net_1              = MDDR_ODT_net_0;
assign MDDR_ODT                    = MDDR_ODT_net_1;
assign MDDR_RAS_N_net_1            = MDDR_RAS_N_net_0;
assign MDDR_RAS_N                  = MDDR_RAS_N_net_1;
assign MDDR_RESET_N_net_1          = MDDR_RESET_N_net_0;
assign MDDR_RESET_N                = MDDR_RESET_N_net_1;
assign MDDR_WE_N_net_1             = MDDR_WE_N_net_0;
assign MDDR_WE_N                   = MDDR_WE_N_net_1;
assign GPIO_1_M2F_net_1            = GPIO_1_M2F_net_0;
assign GPIO_1_M2F                  = GPIO_1_M2F_net_1;
assign GPIO_0_M2F_net_1            = GPIO_0_M2F_net_0;
assign GPIO_0_M2F                  = GPIO_0_M2F_net_1;
assign GPIO_2_M2F_net_1            = GPIO_2_M2F_net_0;
assign GPIO_2_M2F                  = GPIO_2_M2F_net_1;
assign GPIO_3_M2F_net_1            = GPIO_3_M2F_net_0;
assign GPIO_3_M2F                  = GPIO_3_M2F_net_1;
assign TXD0_P_net_1                = TXD0_P_net_0;
assign TXD0_P                      = TXD0_P_net_1;
assign TXD0_N_net_1                = TXD0_N_net_0;
assign TXD0_N                      = TXD0_N_net_1;
assign TXD1_P_net_1                = TXD1_P_net_0;
assign TXD1_P                      = TXD1_P_net_1;
assign TXD1_N_net_1                = TXD1_N_net_0;
assign TXD1_N                      = TXD1_N_net_1;
assign TXD2_P_net_1                = TXD2_P_net_0;
assign TXD2_P                      = TXD2_P_net_1;
assign TXD2_N_net_1                = TXD2_N_net_0;
assign TXD2_N                      = TXD2_N_net_1;
assign TXD3_P_net_1                = TXD3_P_net_0;
assign TXD3_P                      = TXD3_P_net_1;
assign TXD3_N_net_1                = TXD3_N_net_0;
assign TXD3_N                      = TXD3_N_net_1;
assign MDDR_ADDR_net_1             = MDDR_ADDR_net_0;
assign MDDR_ADDR[15:0]             = MDDR_ADDR_net_1;
assign MDDR_BA_net_1               = MDDR_BA_net_0;
assign MDDR_BA[2:0]                = MDDR_BA_net_1;
assign FAB_CCC_GL0_net_1           = FAB_CCC_GL0_net_0;
assign FAB_CCC_GL0                 = FAB_CCC_GL0_net_1;
assign SDIF0_PHY_RESET_N_net_1     = SDIF0_PHY_RESET_N_net_0;
assign SDIF0_PHY_RESET_N           = SDIF0_PHY_RESET_N_net_1;
assign SDIF0_0_CORE_RESET_N_net_1  = SDIF0_0_CORE_RESET_N_net_0;
assign SDIF0_0_CORE_RESET_N        = SDIF0_0_CORE_RESET_N_net_1;
assign SDIF0_1_CORE_RESET_N_net_1  = SDIF0_1_CORE_RESET_N_net_0;
assign SDIF0_1_CORE_RESET_N        = SDIF0_1_CORE_RESET_N_net_1;
assign FAB_CCC_LOCK_net_1          = FAB_CCC_LOCK_net_0;
assign FAB_CCC_LOCK                = FAB_CCC_LOCK_net_1;
//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign M2S_MSS_sb_0_SDIF0_INIT_APB_PADDR_0_14to2 = M2S_MSS_sb_0_SDIF0_INIT_APB_PADDR[14:2];
assign M2S_MSS_sb_0_SDIF0_INIT_APB_PADDR_0 = { M2S_MSS_sb_0_SDIF0_INIT_APB_PADDR_0_14to2 };

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------M2S_MSS_sb
M2S_MSS_sb M2S_MSS_sb_0(
        // Inputs
        .SPI_0_DI              ( SPI_0_DI ),
        .SPI_1_DI              ( SPI_1_DI ),
        .MMUART_1_RXD          ( MMUART_1_RXD ),
        .MMUART_0_RXD          ( MMUART_0_RXD ),
        .MDDR_DQS_TMATCH_0_IN  ( MDDR_DQS_TMATCH_0_IN ),
        .FAB_RESET_N           ( VCC_net ),
        .SDIF0_PREADY          ( M2S_MSS_sb_0_SDIF0_INIT_APB_PREADY ),
        .SDIF0_PSLVERR         ( M2S_MSS_sb_0_SDIF0_INIT_APB_PSLVERR ),
        .DEVRST_N              ( DEVRST_N ),
        .SDIF0_SPLL_LOCK       ( SDIF0_SPLL_LOCK ),
        .SDIF0_PRDATA          ( M2S_MSS_sb_0_SDIF0_INIT_APB_PRDATA ),
        // Outputs
        .SPI_0_DO              ( SPI_0_DO_net_0 ),
        .SPI_1_DO              ( SPI_1_DO_net_0 ),
        .MMUART_1_TXD          ( MMUART_1_TXD_net_0 ),
        .MMUART_0_TXD          ( MMUART_0_TXD_net_0 ),
        .MDDR_DQS_TMATCH_0_OUT ( MDDR_DQS_TMATCH_0_OUT_net_0 ),
        .MDDR_CAS_N            ( MDDR_CAS_N_net_0 ),
        .MDDR_CLK              ( MDDR_CLK_net_0 ),
        .MDDR_CLK_N            ( MDDR_CLK_N_net_0 ),
        .MDDR_CKE              ( MDDR_CKE_net_0 ),
        .MDDR_CS_N             ( MDDR_CS_N_net_0 ),
        .MDDR_ODT              ( MDDR_ODT_net_0 ),
        .MDDR_RAS_N            ( MDDR_RAS_N_net_0 ),
        .MDDR_RESET_N          ( MDDR_RESET_N_net_0 ),
        .MDDR_WE_N             ( MDDR_WE_N_net_0 ),
        .POWER_ON_RESET_N      (  ),
        .INIT_DONE             (  ),
        .DDR_READY             (  ),
        .SDIF_READY            (  ),
        .SDIF0_PSEL            ( M2S_MSS_sb_0_SDIF0_INIT_APB_PSELx ),
        .SDIF0_PENABLE         ( M2S_MSS_sb_0_SDIF0_INIT_APB_PENABLE ),
        .SDIF0_PWRITE          ( M2S_MSS_sb_0_SDIF0_INIT_APB_PWRITE ),
        .INIT_APB_S_PCLK       (  ),
        .INIT_APB_S_PRESET_N   (  ),
        .SDIF0_PHY_RESET_N     ( SDIF0_PHY_RESET_N_net_0 ),
        .SDIF0_0_CORE_RESET_N  ( SDIF0_0_CORE_RESET_N_net_0 ),
        .SDIF0_1_CORE_RESET_N  ( SDIF0_1_CORE_RESET_N_net_0 ),
        .FAB_CCC_GL0           ( FAB_CCC_GL0_net_0 ),
        .FAB_CCC_LOCK          ( FAB_CCC_LOCK_net_0 ),
        .MSS_READY             (  ),
        .GPIO_0_M2F            ( GPIO_0_M2F_net_0 ),
        .GPIO_1_M2F            ( GPIO_1_M2F_net_0 ),
        .GPIO_2_M2F            ( GPIO_2_M2F_net_0 ),
        .GPIO_3_M2F            ( GPIO_3_M2F_net_0 ),
        .MDDR_ADDR             ( MDDR_ADDR_net_0 ),
        .MDDR_BA               ( MDDR_BA_net_0 ),
        .SDIF0_PADDR           ( M2S_MSS_sb_0_SDIF0_INIT_APB_PADDR ),
        .SDIF0_PWDATA          ( M2S_MSS_sb_0_SDIF0_INIT_APB_PWDATA ),
        // Inouts
        .I2C_0_SDA             ( I2C_0_SDA ),
        .I2C_0_SCL             ( I2C_0_SCL ),
        .I2C_1_SDA             ( I2C_1_SDA ),
        .I2C_1_SCL             ( I2C_1_SCL ),
        .SPI_0_CLK             ( SPI_0_CLK ),
        .SPI_0_SS0             ( SPI_0_SS0 ),
        .SPI_1_CLK             ( SPI_1_CLK ),
        .SPI_1_SS0             ( SPI_1_SS0 ),
        .MDDR_DM_RDQS          ( MDDR_DM_RDQS ),
        .MDDR_DQ               ( MDDR_DQ ),
        .MDDR_DQS              ( MDDR_DQS ),
        .MDDR_DQS_N            ( MDDR_DQS_N ) 
        );

//--------M2S_MSS_SERDES_IF2_0_SERDES_IF2   -   Actel:SgCore:SERDES_IF2:1.2.212
M2S_MSS_SERDES_IF2_0_SERDES_IF2 SERDES_IF2_0(
        // Inputs
        .APB_S_PENABLE       ( M2S_MSS_sb_0_SDIF0_INIT_APB_PENABLE ),
        .APB_S_PSEL          ( M2S_MSS_sb_0_SDIF0_INIT_APB_PSELx ),
        .APB_S_PWRITE        ( M2S_MSS_sb_0_SDIF0_INIT_APB_PWRITE ),
        .AXI_0_M_AWREADY     ( GND_net ), // tied to 1'b0 from definition
        .AXI_0_M_WREADY      ( GND_net ), // tied to 1'b0 from definition
        .AXI_0_M_BVALID      ( GND_net ), // tied to 1'b0 from definition
        .AXI_0_M_ARREADY     ( GND_net ), // tied to 1'b0 from definition
        .AXI_0_M_RLAST       ( GND_net ), // tied to 1'b0 from definition
        .AXI_0_M_RVALID      ( GND_net ), // tied to 1'b0 from definition
        .PCIE_0_CORE_RESET_N ( PCIE_0_CORE_RESET_N ),
        .PHY_RESET_N         ( PHY_RESET_N ),
        .APB_S_PRESET_N      ( APB_S_PRESET_N ),
        .CLK_BASE            ( CLK_BASE ),
        .APB_S_PCLK          ( APB_S_PCLK ),
        .PCIE_0_PERST_N      ( PCIE_0_PERST_N ),
        .REFCLK0_P           ( REFCLK0_P ),
        .REFCLK0_N           ( REFCLK0_N ),
        .RXD0_P              ( RXD0_P ),
        .RXD0_N              ( RXD0_N ),
        .RXD1_P              ( RXD1_P ),
        .RXD1_N              ( RXD1_N ),
        .RXD2_P              ( RXD2_P ),
        .RXD2_N              ( RXD2_N ),
        .RXD3_P              ( RXD3_P ),
        .RXD3_N              ( RXD3_N ),
        .APB_S_PADDR         ( M2S_MSS_sb_0_SDIF0_INIT_APB_PADDR_0 ),
        .APB_S_PWDATA        ( M2S_MSS_sb_0_SDIF0_INIT_APB_PWDATA ),
        .AXI_0_M_BID         ( AXI_0_M_BID_const_net_0 ), // tied to 4'h0 from definition
        .AXI_0_M_BRESP       ( AXI_0_M_BRESP_const_net_0 ), // tied to 2'h0 from definition
        .AXI_0_M_RID         ( AXI_0_M_RID_const_net_0 ), // tied to 4'h0 from definition
        .AXI_0_M_RDATA       ( AXI_0_M_RDATA_const_net_0 ), // tied to 64'h0000000000000000 from definition
        .AXI_0_M_RRESP       ( AXI_0_M_RRESP_const_net_0 ), // tied to 2'h0 from definition
        .PCIE_0_INTERRUPT    ( PCIE_0_INTERRUPT ),
        // Outputs
        .APB_S_PREADY        ( M2S_MSS_sb_0_SDIF0_INIT_APB_PREADY ),
        .APB_S_PSLVERR       ( M2S_MSS_sb_0_SDIF0_INIT_APB_PSLVERR ),
        .AXI_0_M_AWVALID     (  ),
        .AXI_0_M_WLAST       (  ),
        .AXI_0_M_WVALID      (  ),
        .AXI_0_M_BREADY      (  ),
        .AXI_0_M_ARVALID     (  ),
        .AXI_0_M_RREADY      (  ),
        .PCIE_0_SYSTEM_INT   (  ),
        .PLL_LOCK_INT        (  ),
        .PLL_LOCKLOST_INT    (  ),
        .SPLL_LOCK           (  ),
        .PCIE_0_EV_1US       (  ),
        .REFCLK0_OUT         (  ),
        .PCIE_0_L2P2_ACTIVE  (  ),
        .PCIE_0_RESET_PHASE  (  ),
        .TXD0_P              ( TXD0_P_net_0 ),
        .TXD0_N              ( TXD0_N_net_0 ),
        .TXD1_P              ( TXD1_P_net_0 ),
        .TXD1_N              ( TXD1_N_net_0 ),
        .TXD2_P              ( TXD2_P_net_0 ),
        .TXD2_N              ( TXD2_N_net_0 ),
        .TXD3_P              ( TXD3_P_net_0 ),
        .TXD3_N              ( TXD3_N_net_0 ),
        .APB_S_PRDATA        ( M2S_MSS_sb_0_SDIF0_INIT_APB_PRDATA ),
        .AXI_0_M_AWID        (  ),
        .AXI_0_M_AWADDR      (  ),
        .AXI_0_M_AWLEN       (  ),
        .AXI_0_M_AWSIZE      (  ),
        .AXI_0_M_AWBURST     (  ),
        .AXI_0_M_WID         (  ),
        .AXI_0_M_WSTRB       (  ),
        .AXI_0_M_WDATA       (  ),
        .AXI_0_M_ARID        (  ),
        .AXI_0_M_ARADDR      (  ),
        .AXI_0_M_ARLEN       (  ),
        .AXI_0_M_ARSIZE      (  ),
        .AXI_0_M_ARBURST     (  ),
        .PCIE_0_LTSSM        (  ) 
        );


endmodule
