//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Feb 02 00:24:46 2017
// Version: v11.7 11.7.0.119
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// M2S_MSS_sb
module M2S_MSS_sb(
    // Inputs
    DEVRST_N,
    FAB_RESET_N,
    MDDR_DQS_TMATCH_0_IN,
    MMUART_0_RXD,
    MMUART_1_RXD,
    SDIF0_PRDATA,
    SDIF0_PREADY,
    SDIF0_PSLVERR,
    SDIF0_SPLL_LOCK,
    SPI_0_DI,
    SPI_1_DI,
    // Outputs
    DDR_READY,
    FAB_CCC_GL0,
    FAB_CCC_LOCK,
    GPIO_0_M2F,
    GPIO_1_M2F,
    GPIO_2_M2F,
    GPIO_3_M2F,
    INIT_APB_S_PCLK,
    INIT_APB_S_PRESET_N,
    INIT_DONE,
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
    MSS_READY,
    POWER_ON_RESET_N,
    SDIF0_0_CORE_RESET_N,
    SDIF0_1_CORE_RESET_N,
    SDIF0_PADDR,
    SDIF0_PENABLE,
    SDIF0_PHY_RESET_N,
    SDIF0_PSEL,
    SDIF0_PWDATA,
    SDIF0_PWRITE,
    SDIF_READY,
    SPI_0_DO,
    SPI_1_DO,
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
input         DEVRST_N;
input         FAB_RESET_N;
input         MDDR_DQS_TMATCH_0_IN;
input         MMUART_0_RXD;
input         MMUART_1_RXD;
input  [31:0] SDIF0_PRDATA;
input         SDIF0_PREADY;
input         SDIF0_PSLVERR;
input         SDIF0_SPLL_LOCK;
input         SPI_0_DI;
input         SPI_1_DI;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        DDR_READY;
output        FAB_CCC_GL0;
output        FAB_CCC_LOCK;
output        GPIO_0_M2F;
output        GPIO_1_M2F;
output        GPIO_2_M2F;
output        GPIO_3_M2F;
output        INIT_APB_S_PCLK;
output        INIT_APB_S_PRESET_N;
output        INIT_DONE;
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
output        MSS_READY;
output        POWER_ON_RESET_N;
output        SDIF0_0_CORE_RESET_N;
output        SDIF0_1_CORE_RESET_N;
output [15:2] SDIF0_PADDR;
output        SDIF0_PENABLE;
output        SDIF0_PHY_RESET_N;
output        SDIF0_PSEL;
output [31:0] SDIF0_PWDATA;
output        SDIF0_PWRITE;
output        SDIF_READY;
output        SPI_0_DO;
output        SPI_1_DO;
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
wire          CORECONFIGP_0_CONFIG1_DONE;
wire          CORECONFIGP_0_CONFIG2_DONE;
wire          CORECONFIGP_0_MDDR_APBmslave_PENABLE;
wire          CORECONFIGP_0_MDDR_APBmslave_PREADY;
wire          CORECONFIGP_0_MDDR_APBmslave_PSELx;
wire          CORECONFIGP_0_MDDR_APBmslave_PSLVERR;
wire          CORECONFIGP_0_MDDR_APBmslave_PWRITE;
wire          CORECONFIGP_0_SOFT_EXT_RESET_OUT;
wire          CORECONFIGP_0_SOFT_M3_RESET;
wire          CORECONFIGP_0_SOFT_MDDR_DDR_AXI_S_CORE_RESET;
wire          CORECONFIGP_0_SOFT_RESET_F2M;
wire          CORECONFIGP_0_SOFT_SDIF0_0_CORE_RESET;
wire          CORECONFIGP_0_SOFT_SDIF0_1_CORE_RESET;
wire          CORECONFIGP_0_SOFT_SDIF0_PHY_RESET;
wire          CORERESETP_0_M3_RESET_N;
wire          CORERESETP_0_RESET_N_F2M;
wire          CORERESETP_0_SDIF_RELEASED;
wire          DDR_READY_net_0;
wire          DEVRST_N;
wire          FAB_CCC_GL0_net_0;
wire          FAB_CCC_LOCK_net_0;
wire          FAB_RESET_N;
wire          FABOSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC;
wire          FABOSC_0_RCOSC_25_50MHZ_O2F;
wire          GPIO_0_M2F_net_0;
wire          GPIO_1_M2F_net_0;
wire          GPIO_2_M2F_net_0;
wire          GPIO_3_M2F_net_0;
wire          I2C_0_SCL;
wire          I2C_0_SDA;
wire          I2C_1_SCL;
wire          I2C_1_SDA;
wire          INIT_APB_S_PCLK_net_0;
wire          INIT_APB_S_PRESET_N_net_0;
wire          INIT_DONE_net_0;
wire          M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_M_PCLK;
wire          M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N;
wire          M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PENABLE;
wire   [31:0] M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PRDATA;
wire          M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PREADY;
wire          M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PSELx;
wire          M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PSLVERR;
wire   [31:0] M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PWDATA;
wire          M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PWRITE;
wire          M2S_MSS_sb_MSS_TMP_0_MSS_RESET_N_M2F;
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
wire          MSS_READY_net_0;
wire          POWER_ON_RESET_N_net_0;
wire          SDIF0_0_CORE_RESET_N_net_0;
wire          SDIF0_1_CORE_RESET_N_net_0;
wire   [15:2] SDIF0_INIT_APB_PADDR;
wire          SDIF0_INIT_APB_PENABLE;
wire   [31:0] SDIF0_PRDATA;
wire          SDIF0_PREADY;
wire          SDIF0_INIT_APB_PSELx;
wire          SDIF0_PSLVERR;
wire   [31:0] SDIF0_INIT_APB_PWDATA;
wire          SDIF0_INIT_APB_PWRITE;
wire          SDIF0_PHY_RESET_N_net_0;
wire          SDIF0_SPLL_LOCK;
wire          SDIF_READY_net_0;
wire          SPI_0_CLK;
wire          SPI_0_DI;
wire          SPI_0_DO_net_0;
wire          SPI_0_SS0;
wire          SPI_1_CLK;
wire          SPI_1_DI;
wire          SPI_1_DO_net_0;
wire          SPI_1_SS0;
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
wire   [15:0] MDDR_ADDR_net_1;
wire   [2:0]  MDDR_BA_net_1;
wire          POWER_ON_RESET_N_net_1;
wire          INIT_DONE_net_1;
wire          DDR_READY_net_1;
wire          SDIF_READY_net_1;
wire   [15:2] SDIF0_INIT_APB_PADDR_net_0;
wire          SDIF0_INIT_APB_PSELx_net_0;
wire          SDIF0_INIT_APB_PENABLE_net_0;
wire          SDIF0_INIT_APB_PWRITE_net_0;
wire   [31:0] SDIF0_INIT_APB_PWDATA_net_0;
wire          INIT_APB_S_PCLK_net_1;
wire          INIT_APB_S_PRESET_N_net_1;
wire          SDIF0_PHY_RESET_N_net_1;
wire          SDIF0_0_CORE_RESET_N_net_1;
wire          SDIF0_1_CORE_RESET_N_net_1;
wire          FAB_CCC_GL0_net_1;
wire          FAB_CCC_LOCK_net_1;
wire          MSS_READY_net_1;
wire          GPIO_0_M2F_net_1;
wire          GPIO_1_M2F_net_1;
wire          GPIO_2_M2F_net_1;
wire          GPIO_3_M2F_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [7:2]  PADDR_const_net_0;
wire   [7:0]  PWDATA_const_net_0;
wire   [31:0] FDDR_PRDATA_const_net_0;
wire          VCC_net;
wire   [31:0] SDIF1_PRDATA_const_net_0;
wire   [31:0] SDIF2_PRDATA_const_net_0;
wire   [31:0] SDIF3_PRDATA_const_net_0;
wire   [31:0] SDIF0_PRDATA_const_net_0;
wire   [31:0] SDIF1_PRDATA_const_net_1;
wire   [31:0] SDIF2_PRDATA_const_net_1;
wire   [31:0] SDIF3_PRDATA_const_net_1;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [10:2] CORECONFIGP_0_MDDR_APBmslave_PADDR_0_10to2;
wire   [10:2] CORECONFIGP_0_MDDR_APBmslave_PADDR_0;
wire   [15:2] CORECONFIGP_0_MDDR_APBmslave_PADDR;
wire   [15:0] CORECONFIGP_0_MDDR_APBmslave_PRDATA;
wire   [31:16]CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_31to16;
wire   [15:0] CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_15to0;
wire   [31:0] CORECONFIGP_0_MDDR_APBmslave_PRDATA_0;
wire   [15:0] CORECONFIGP_0_MDDR_APBmslave_PWDATA_0_15to0;
wire   [15:0] CORECONFIGP_0_MDDR_APBmslave_PWDATA_0;
wire   [31:0] CORECONFIGP_0_MDDR_APBmslave_PWDATA;
wire   [15:2] M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR;
wire   [16:16]M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR_0_16to16;
wire   [15:2] M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR_0_15to2;
wire   [16:2] M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                  = 1'b0;
assign PADDR_const_net_0        = 6'h00;
assign PWDATA_const_net_0       = 8'h00;
assign FDDR_PRDATA_const_net_0  = 32'h00000000;
assign VCC_net                  = 1'b1;
assign SDIF1_PRDATA_const_net_0 = 32'h00000000;
assign SDIF2_PRDATA_const_net_0 = 32'h00000000;
assign SDIF3_PRDATA_const_net_0 = 32'h00000000;
assign SDIF0_PRDATA_const_net_0 = 32'h00000000;
assign SDIF1_PRDATA_const_net_1 = 32'h00000000;
assign SDIF2_PRDATA_const_net_1 = 32'h00000000;
assign SDIF3_PRDATA_const_net_1 = 32'h00000000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign SPI_0_DO_net_1               = SPI_0_DO_net_0;
assign SPI_0_DO                     = SPI_0_DO_net_1;
assign SPI_1_DO_net_1               = SPI_1_DO_net_0;
assign SPI_1_DO                     = SPI_1_DO_net_1;
assign MMUART_1_TXD_net_1           = MMUART_1_TXD_net_0;
assign MMUART_1_TXD                 = MMUART_1_TXD_net_1;
assign MMUART_0_TXD_net_1           = MMUART_0_TXD_net_0;
assign MMUART_0_TXD                 = MMUART_0_TXD_net_1;
assign MDDR_DQS_TMATCH_0_OUT_net_1  = MDDR_DQS_TMATCH_0_OUT_net_0;
assign MDDR_DQS_TMATCH_0_OUT        = MDDR_DQS_TMATCH_0_OUT_net_1;
assign MDDR_CAS_N_net_1             = MDDR_CAS_N_net_0;
assign MDDR_CAS_N                   = MDDR_CAS_N_net_1;
assign MDDR_CLK_net_1               = MDDR_CLK_net_0;
assign MDDR_CLK                     = MDDR_CLK_net_1;
assign MDDR_CLK_N_net_1             = MDDR_CLK_N_net_0;
assign MDDR_CLK_N                   = MDDR_CLK_N_net_1;
assign MDDR_CKE_net_1               = MDDR_CKE_net_0;
assign MDDR_CKE                     = MDDR_CKE_net_1;
assign MDDR_CS_N_net_1              = MDDR_CS_N_net_0;
assign MDDR_CS_N                    = MDDR_CS_N_net_1;
assign MDDR_ODT_net_1               = MDDR_ODT_net_0;
assign MDDR_ODT                     = MDDR_ODT_net_1;
assign MDDR_RAS_N_net_1             = MDDR_RAS_N_net_0;
assign MDDR_RAS_N                   = MDDR_RAS_N_net_1;
assign MDDR_RESET_N_net_1           = MDDR_RESET_N_net_0;
assign MDDR_RESET_N                 = MDDR_RESET_N_net_1;
assign MDDR_WE_N_net_1              = MDDR_WE_N_net_0;
assign MDDR_WE_N                    = MDDR_WE_N_net_1;
assign MDDR_ADDR_net_1              = MDDR_ADDR_net_0;
assign MDDR_ADDR[15:0]              = MDDR_ADDR_net_1;
assign MDDR_BA_net_1                = MDDR_BA_net_0;
assign MDDR_BA[2:0]                 = MDDR_BA_net_1;
assign POWER_ON_RESET_N_net_1       = POWER_ON_RESET_N_net_0;
assign POWER_ON_RESET_N             = POWER_ON_RESET_N_net_1;
assign INIT_DONE_net_1              = INIT_DONE_net_0;
assign INIT_DONE                    = INIT_DONE_net_1;
assign DDR_READY_net_1              = DDR_READY_net_0;
assign DDR_READY                    = DDR_READY_net_1;
assign SDIF_READY_net_1             = SDIF_READY_net_0;
assign SDIF_READY                   = SDIF_READY_net_1;
assign SDIF0_INIT_APB_PADDR_net_0   = SDIF0_INIT_APB_PADDR;
assign SDIF0_PADDR[15:2]            = SDIF0_INIT_APB_PADDR_net_0;
assign SDIF0_INIT_APB_PSELx_net_0   = SDIF0_INIT_APB_PSELx;
assign SDIF0_PSEL                   = SDIF0_INIT_APB_PSELx_net_0;
assign SDIF0_INIT_APB_PENABLE_net_0 = SDIF0_INIT_APB_PENABLE;
assign SDIF0_PENABLE                = SDIF0_INIT_APB_PENABLE_net_0;
assign SDIF0_INIT_APB_PWRITE_net_0  = SDIF0_INIT_APB_PWRITE;
assign SDIF0_PWRITE                 = SDIF0_INIT_APB_PWRITE_net_0;
assign SDIF0_INIT_APB_PWDATA_net_0  = SDIF0_INIT_APB_PWDATA;
assign SDIF0_PWDATA[31:0]           = SDIF0_INIT_APB_PWDATA_net_0;
assign INIT_APB_S_PCLK_net_1        = INIT_APB_S_PCLK_net_0;
assign INIT_APB_S_PCLK              = INIT_APB_S_PCLK_net_1;
assign INIT_APB_S_PRESET_N_net_1    = INIT_APB_S_PRESET_N_net_0;
assign INIT_APB_S_PRESET_N          = INIT_APB_S_PRESET_N_net_1;
assign SDIF0_PHY_RESET_N_net_1      = SDIF0_PHY_RESET_N_net_0;
assign SDIF0_PHY_RESET_N            = SDIF0_PHY_RESET_N_net_1;
assign SDIF0_0_CORE_RESET_N_net_1   = SDIF0_0_CORE_RESET_N_net_0;
assign SDIF0_0_CORE_RESET_N         = SDIF0_0_CORE_RESET_N_net_1;
assign SDIF0_1_CORE_RESET_N_net_1   = SDIF0_1_CORE_RESET_N_net_0;
assign SDIF0_1_CORE_RESET_N         = SDIF0_1_CORE_RESET_N_net_1;
assign FAB_CCC_GL0_net_1            = FAB_CCC_GL0_net_0;
assign FAB_CCC_GL0                  = FAB_CCC_GL0_net_1;
assign FAB_CCC_LOCK_net_1           = FAB_CCC_LOCK_net_0;
assign FAB_CCC_LOCK                 = FAB_CCC_LOCK_net_1;
assign MSS_READY_net_1              = MSS_READY_net_0;
assign MSS_READY                    = MSS_READY_net_1;
assign GPIO_0_M2F_net_1             = GPIO_0_M2F_net_0;
assign GPIO_0_M2F                   = GPIO_0_M2F_net_1;
assign GPIO_1_M2F_net_1             = GPIO_1_M2F_net_0;
assign GPIO_1_M2F                   = GPIO_1_M2F_net_1;
assign GPIO_2_M2F_net_1             = GPIO_2_M2F_net_0;
assign GPIO_2_M2F                   = GPIO_2_M2F_net_1;
assign GPIO_3_M2F_net_1             = GPIO_3_M2F_net_0;
assign GPIO_3_M2F                   = GPIO_3_M2F_net_1;
//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign CORECONFIGP_0_MDDR_APBmslave_PADDR_0_10to2 = CORECONFIGP_0_MDDR_APBmslave_PADDR[10:2];
assign CORECONFIGP_0_MDDR_APBmslave_PADDR_0 = { CORECONFIGP_0_MDDR_APBmslave_PADDR_0_10to2 };

assign CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_31to16 = 16'h0;
assign CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_15to0 = CORECONFIGP_0_MDDR_APBmslave_PRDATA[15:0];
assign CORECONFIGP_0_MDDR_APBmslave_PRDATA_0 = { CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_31to16, CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_15to0 };

assign CORECONFIGP_0_MDDR_APBmslave_PWDATA_0_15to0 = CORECONFIGP_0_MDDR_APBmslave_PWDATA[15:0];
assign CORECONFIGP_0_MDDR_APBmslave_PWDATA_0 = { CORECONFIGP_0_MDDR_APBmslave_PWDATA_0_15to0 };

assign M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR_0_16to16 = 1'b0;
assign M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR_0_15to2 = M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR[15:2];
assign M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR_0 = { M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR_0_16to16, M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR_0_15to2 };

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------M2S_MSS_sb_CCC_0_FCCC   -   Actel:SgCore:FCCC:2.0.200
M2S_MSS_sb_CCC_0_FCCC CCC_0(
        // Inputs
        .RCOSC_25_50MHZ ( FABOSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC ),
        // Outputs
        .GL0            ( FAB_CCC_GL0_net_0 ),
        .LOCK           ( FAB_CCC_LOCK_net_0 ) 
        );

//--------CoreConfigP   -   Actel:DirectCore:CoreConfigP:7.0.105
CoreConfigP #( 
        .DEVICE_090         ( 1 ),
        .ENABLE_SOFT_RESETS ( 1 ),
        .FDDR_IN_USE        ( 0 ),
        .MDDR_IN_USE        ( 1 ),
        .SDIF0_IN_USE       ( 1 ),
        .SDIF0_PCIE         ( 0 ),
        .SDIF1_IN_USE       ( 0 ),
        .SDIF1_PCIE         ( 0 ),
        .SDIF2_IN_USE       ( 0 ),
        .SDIF2_PCIE         ( 0 ),
        .SDIF3_IN_USE       ( 0 ),
        .SDIF3_PCIE         ( 0 ) )
CORECONFIGP_0(
        // Inputs
        .FIC_2_APB_M_PRESET_N           ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N ),
        .FIC_2_APB_M_PCLK               ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_M_PCLK ),
        .SDIF_RELEASED                  ( CORERESETP_0_SDIF_RELEASED ),
        .INIT_DONE                      ( INIT_DONE_net_0 ),
        .FIC_2_APB_M_PSEL               ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PSELx ),
        .FIC_2_APB_M_PENABLE            ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PENABLE ),
        .FIC_2_APB_M_PWRITE             ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PWRITE ),
        .FIC_2_APB_M_PADDR              ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR_0 ),
        .FIC_2_APB_M_PWDATA             ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PWDATA ),
        .MDDR_PRDATA                    ( CORECONFIGP_0_MDDR_APBmslave_PRDATA_0 ),
        .MDDR_PREADY                    ( CORECONFIGP_0_MDDR_APBmslave_PREADY ),
        .MDDR_PSLVERR                   ( CORECONFIGP_0_MDDR_APBmslave_PSLVERR ),
        .FDDR_PRDATA                    ( FDDR_PRDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .FDDR_PREADY                    ( VCC_net ), // tied to 1'b1 from definition
        .FDDR_PSLVERR                   ( GND_net ), // tied to 1'b0 from definition
        .SDIF0_PRDATA                   ( SDIF0_PRDATA ),
        .SDIF0_PREADY                   ( SDIF0_PREADY ),
        .SDIF0_PSLVERR                  ( SDIF0_PSLVERR ),
        .SDIF1_PRDATA                   ( SDIF1_PRDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .SDIF1_PREADY                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF1_PSLVERR                  ( GND_net ), // tied to 1'b0 from definition
        .SDIF2_PRDATA                   ( SDIF2_PRDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .SDIF2_PREADY                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF2_PSLVERR                  ( GND_net ), // tied to 1'b0 from definition
        .SDIF3_PRDATA                   ( SDIF3_PRDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .SDIF3_PREADY                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF3_PSLVERR                  ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .APB_S_PCLK                     ( INIT_APB_S_PCLK_net_0 ),
        .APB_S_PRESET_N                 ( INIT_APB_S_PRESET_N_net_0 ),
        .CONFIG1_DONE                   ( CORECONFIGP_0_CONFIG1_DONE ),
        .CONFIG2_DONE                   ( CORECONFIGP_0_CONFIG2_DONE ),
        .FIC_2_APB_M_PRDATA             ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PRDATA ),
        .FIC_2_APB_M_PREADY             ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PREADY ),
        .FIC_2_APB_M_PSLVERR            ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PSLVERR ),
        .MDDR_PSEL                      ( CORECONFIGP_0_MDDR_APBmslave_PSELx ),
        .MDDR_PENABLE                   ( CORECONFIGP_0_MDDR_APBmslave_PENABLE ),
        .MDDR_PWRITE                    ( CORECONFIGP_0_MDDR_APBmslave_PWRITE ),
        .MDDR_PADDR                     ( CORECONFIGP_0_MDDR_APBmslave_PADDR ),
        .MDDR_PWDATA                    ( CORECONFIGP_0_MDDR_APBmslave_PWDATA ),
        .FDDR_PSEL                      (  ),
        .FDDR_PENABLE                   (  ),
        .FDDR_PWRITE                    (  ),
        .FDDR_PADDR                     (  ),
        .FDDR_PWDATA                    (  ),
        .SDIF0_PSEL                     ( SDIF0_INIT_APB_PSELx ),
        .SDIF0_PENABLE                  ( SDIF0_INIT_APB_PENABLE ),
        .SDIF0_PWRITE                   ( SDIF0_INIT_APB_PWRITE ),
        .SDIF0_PADDR                    ( SDIF0_INIT_APB_PADDR ),
        .SDIF0_PWDATA                   ( SDIF0_INIT_APB_PWDATA ),
        .SDIF1_PSEL                     (  ),
        .SDIF1_PENABLE                  (  ),
        .SDIF1_PWRITE                   (  ),
        .SDIF1_PADDR                    (  ),
        .SDIF1_PWDATA                   (  ),
        .SDIF2_PSEL                     (  ),
        .SDIF2_PENABLE                  (  ),
        .SDIF2_PWRITE                   (  ),
        .SDIF2_PADDR                    (  ),
        .SDIF2_PWDATA                   (  ),
        .SDIF3_PSEL                     (  ),
        .SDIF3_PENABLE                  (  ),
        .SDIF3_PWRITE                   (  ),
        .SDIF3_PADDR                    (  ),
        .SDIF3_PWDATA                   (  ),
        .SOFT_EXT_RESET_OUT             ( CORECONFIGP_0_SOFT_EXT_RESET_OUT ),
        .SOFT_RESET_F2M                 ( CORECONFIGP_0_SOFT_RESET_F2M ),
        .SOFT_M3_RESET                  ( CORECONFIGP_0_SOFT_M3_RESET ),
        .SOFT_MDDR_DDR_AXI_S_CORE_RESET ( CORECONFIGP_0_SOFT_MDDR_DDR_AXI_S_CORE_RESET ),
        .SOFT_FDDR_CORE_RESET           (  ),
        .SOFT_SDIF0_PHY_RESET           ( CORECONFIGP_0_SOFT_SDIF0_PHY_RESET ),
        .SOFT_SDIF0_CORE_RESET          (  ),
        .SOFT_SDIF0_0_CORE_RESET        ( CORECONFIGP_0_SOFT_SDIF0_0_CORE_RESET ),
        .SOFT_SDIF0_1_CORE_RESET        ( CORECONFIGP_0_SOFT_SDIF0_1_CORE_RESET ),
        .SOFT_SDIF1_PHY_RESET           (  ),
        .SOFT_SDIF1_CORE_RESET          (  ),
        .SOFT_SDIF2_PHY_RESET           (  ),
        .SOFT_SDIF2_CORE_RESET          (  ),
        .SOFT_SDIF3_PHY_RESET           (  ),
        .SOFT_SDIF3_CORE_RESET          (  ),
        .R_SDIF0_PSEL                   (  ),
        .R_SDIF0_PWRITE                 (  ),
        .R_SDIF0_PRDATA                 (  ),
        .R_SDIF1_PSEL                   (  ),
        .R_SDIF1_PWRITE                 (  ),
        .R_SDIF1_PRDATA                 (  ),
        .R_SDIF2_PSEL                   (  ),
        .R_SDIF2_PWRITE                 (  ),
        .R_SDIF2_PRDATA                 (  ),
        .R_SDIF3_PSEL                   (  ),
        .R_SDIF3_PWRITE                 (  ),
        .R_SDIF3_PRDATA                 (  ) 
        );

//--------CoreResetP   -   Actel:DirectCore:CoreResetP:7.0.104
CoreResetP #( 
        .DDR_WAIT            ( 200 ),
        .DEVICE_090          ( 1 ),
        .DEVICE_VOLTAGE      ( 2 ),
        .ENABLE_SOFT_RESETS  ( 1 ),
        .EXT_RESET_CFG       ( 0 ),
        .FDDR_IN_USE         ( 0 ),
        .MDDR_IN_USE         ( 1 ),
        .SDIF0_IN_USE        ( 1 ),
        .SDIF0_PCIE          ( 0 ),
        .SDIF0_PCIE_HOTRESET ( 1 ),
        .SDIF0_PCIE_L2P2     ( 1 ),
        .SDIF1_IN_USE        ( 0 ),
        .SDIF1_PCIE          ( 0 ),
        .SDIF1_PCIE_HOTRESET ( 1 ),
        .SDIF1_PCIE_L2P2     ( 1 ),
        .SDIF2_IN_USE        ( 0 ),
        .SDIF2_PCIE          ( 0 ),
        .SDIF2_PCIE_HOTRESET ( 1 ),
        .SDIF2_PCIE_L2P2     ( 1 ),
        .SDIF3_IN_USE        ( 0 ),
        .SDIF3_PCIE          ( 0 ),
        .SDIF3_PCIE_HOTRESET ( 1 ),
        .SDIF3_PCIE_L2P2     ( 1 ) )
CORERESETP_0(
        // Inputs
        .RESET_N_M2F                    ( M2S_MSS_sb_MSS_TMP_0_MSS_RESET_N_M2F ),
        .FIC_2_APB_M_PRESET_N           ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N ),
        .POWER_ON_RESET_N               ( POWER_ON_RESET_N_net_0 ),
        .FAB_RESET_N                    ( FAB_RESET_N ),
        .RCOSC_25_50MHZ                 ( FABOSC_0_RCOSC_25_50MHZ_O2F ),
        .CLK_BASE                       ( FAB_CCC_GL0_net_0 ),
        .CLK_LTSSM                      ( GND_net ), // tied to 1'b0 from definition
        .FPLL_LOCK                      ( VCC_net ), // tied to 1'b1 from definition
        .SDIF0_SPLL_LOCK                ( SDIF0_SPLL_LOCK ),
        .SDIF1_SPLL_LOCK                ( VCC_net ), // tied to 1'b1 from definition
        .SDIF2_SPLL_LOCK                ( VCC_net ), // tied to 1'b1 from definition
        .SDIF3_SPLL_LOCK                ( VCC_net ), // tied to 1'b1 from definition
        .CONFIG1_DONE                   ( CORECONFIGP_0_CONFIG1_DONE ),
        .CONFIG2_DONE                   ( CORECONFIGP_0_CONFIG2_DONE ),
        .SDIF0_PERST_N                  ( VCC_net ), // tied to 1'b1 from definition
        .SDIF1_PERST_N                  ( VCC_net ), // tied to 1'b1 from definition
        .SDIF2_PERST_N                  ( VCC_net ), // tied to 1'b1 from definition
        .SDIF3_PERST_N                  ( VCC_net ), // tied to 1'b1 from definition
        .SDIF0_PSEL                     ( GND_net ), // tied to 1'b0 from definition
        .SDIF0_PWRITE                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF0_PRDATA                   ( SDIF0_PRDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .SDIF1_PSEL                     ( GND_net ), // tied to 1'b0 from definition
        .SDIF1_PWRITE                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF1_PRDATA                   ( SDIF1_PRDATA_const_net_1 ), // tied to 32'h00000000 from definition
        .SDIF2_PSEL                     ( GND_net ), // tied to 1'b0 from definition
        .SDIF2_PWRITE                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF2_PRDATA                   ( SDIF2_PRDATA_const_net_1 ), // tied to 32'h00000000 from definition
        .SDIF3_PSEL                     ( GND_net ), // tied to 1'b0 from definition
        .SDIF3_PWRITE                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF3_PRDATA                   ( SDIF3_PRDATA_const_net_1 ), // tied to 32'h00000000 from definition
        .SOFT_EXT_RESET_OUT             ( CORECONFIGP_0_SOFT_EXT_RESET_OUT ),
        .SOFT_RESET_F2M                 ( CORECONFIGP_0_SOFT_RESET_F2M ),
        .SOFT_M3_RESET                  ( CORECONFIGP_0_SOFT_M3_RESET ),
        .SOFT_MDDR_DDR_AXI_S_CORE_RESET ( CORECONFIGP_0_SOFT_MDDR_DDR_AXI_S_CORE_RESET ),
        .SOFT_FDDR_CORE_RESET           ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF0_PHY_RESET           ( CORECONFIGP_0_SOFT_SDIF0_PHY_RESET ),
        .SOFT_SDIF0_CORE_RESET          ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF0_0_CORE_RESET        ( CORECONFIGP_0_SOFT_SDIF0_0_CORE_RESET ),
        .SOFT_SDIF0_1_CORE_RESET        ( CORECONFIGP_0_SOFT_SDIF0_1_CORE_RESET ),
        .SOFT_SDIF1_PHY_RESET           ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF1_CORE_RESET          ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF2_PHY_RESET           ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF2_CORE_RESET          ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF3_PHY_RESET           ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF3_CORE_RESET          ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .MSS_HPMS_READY                 ( MSS_READY_net_0 ),
        .DDR_READY                      ( DDR_READY_net_0 ),
        .SDIF_READY                     ( SDIF_READY_net_0 ),
        .RESET_N_F2M                    ( CORERESETP_0_RESET_N_F2M ),
        .M3_RESET_N                     ( CORERESETP_0_M3_RESET_N ),
        .EXT_RESET_OUT                  (  ),
        .MDDR_DDR_AXI_S_CORE_RESET_N    (  ),
        .FDDR_CORE_RESET_N              (  ),
        .SDIF0_CORE_RESET_N             (  ),
        .SDIF0_0_CORE_RESET_N           ( SDIF0_0_CORE_RESET_N_net_0 ),
        .SDIF0_1_CORE_RESET_N           ( SDIF0_1_CORE_RESET_N_net_0 ),
        .SDIF0_PHY_RESET_N              ( SDIF0_PHY_RESET_N_net_0 ),
        .SDIF1_CORE_RESET_N             (  ),
        .SDIF1_PHY_RESET_N              (  ),
        .SDIF2_CORE_RESET_N             (  ),
        .SDIF2_PHY_RESET_N              (  ),
        .SDIF3_CORE_RESET_N             (  ),
        .SDIF3_PHY_RESET_N              (  ),
        .SDIF_RELEASED                  ( CORERESETP_0_SDIF_RELEASED ),
        .INIT_DONE                      ( INIT_DONE_net_0 ) 
        );

//--------M2S_MSS_sb_FABOSC_0_OSC   -   Actel:SgCore:OSC:2.0.101
M2S_MSS_sb_FABOSC_0_OSC FABOSC_0(
        // Inputs
        .XTL                ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .RCOSC_25_50MHZ_CCC ( FABOSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC ),
        .RCOSC_25_50MHZ_O2F ( FABOSC_0_RCOSC_25_50MHZ_O2F ),
        .RCOSC_1MHZ_CCC     (  ),
        .RCOSC_1MHZ_O2F     (  ),
        .XTLOSC_CCC         (  ),
        .XTLOSC_O2F         (  ) 
        );

//--------M2S_MSS_sb_MSS
M2S_MSS_sb_MSS M2S_MSS_sb_MSS_0(
        // Inputs
        .SPI_0_DI               ( SPI_0_DI ),
        .SPI_1_DI               ( SPI_1_DI ),
        .MCCC_CLK_BASE          ( FAB_CCC_GL0_net_0 ),
        .MMUART_1_RXD           ( MMUART_1_RXD ),
        .MMUART_0_RXD           ( MMUART_0_RXD ),
        .MDDR_DQS_TMATCH_0_IN   ( MDDR_DQS_TMATCH_0_IN ),
        .MCCC_CLK_BASE_PLL_LOCK ( FAB_CCC_LOCK_net_0 ),
        .MSS_RESET_N_F2M        ( CORERESETP_0_RESET_N_F2M ),
        .M3_RESET_N             ( CORERESETP_0_M3_RESET_N ),
        .MDDR_APB_S_PRESET_N    ( INIT_APB_S_PRESET_N_net_0 ),
        .MDDR_APB_S_PCLK        ( INIT_APB_S_PCLK_net_0 ),
        .FIC_2_APB_M_PREADY     ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PREADY ),
        .FIC_2_APB_M_PSLVERR    ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PSLVERR ),
        .MDDR_APB_S_PWRITE      ( CORECONFIGP_0_MDDR_APBmslave_PWRITE ),
        .MDDR_APB_S_PENABLE     ( CORECONFIGP_0_MDDR_APBmslave_PENABLE ),
        .MDDR_APB_S_PSEL        ( CORECONFIGP_0_MDDR_APBmslave_PSELx ),
        .FIC_2_APB_M_PRDATA     ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PRDATA ),
        .MDDR_APB_S_PWDATA      ( CORECONFIGP_0_MDDR_APBmslave_PWDATA_0 ),
        .MDDR_APB_S_PADDR       ( CORECONFIGP_0_MDDR_APBmslave_PADDR_0 ),
        // Outputs
        .SPI_0_DO               ( SPI_0_DO_net_0 ),
        .SPI_1_DO               ( SPI_1_DO_net_0 ),
        .MMUART_1_TXD           ( MMUART_1_TXD_net_0 ),
        .MMUART_0_TXD           ( MMUART_0_TXD_net_0 ),
        .MDDR_DQS_TMATCH_0_OUT  ( MDDR_DQS_TMATCH_0_OUT_net_0 ),
        .MDDR_CAS_N             ( MDDR_CAS_N_net_0 ),
        .MDDR_CLK               ( MDDR_CLK_net_0 ),
        .MDDR_CLK_N             ( MDDR_CLK_N_net_0 ),
        .MDDR_CKE               ( MDDR_CKE_net_0 ),
        .MDDR_CS_N              ( MDDR_CS_N_net_0 ),
        .MDDR_ODT               ( MDDR_ODT_net_0 ),
        .MDDR_RAS_N             ( MDDR_RAS_N_net_0 ),
        .MDDR_RESET_N           ( MDDR_RESET_N_net_0 ),
        .MDDR_WE_N              ( MDDR_WE_N_net_0 ),
        .MSS_RESET_N_M2F        ( M2S_MSS_sb_MSS_TMP_0_MSS_RESET_N_M2F ),
        .GPIO_0_M2F             ( GPIO_0_M2F_net_0 ),
        .GPIO_1_M2F             ( GPIO_1_M2F_net_0 ),
        .GPIO_2_M2F             ( GPIO_2_M2F_net_0 ),
        .GPIO_3_M2F             ( GPIO_3_M2F_net_0 ),
        .FIC_2_APB_M_PRESET_N   ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N ),
        .FIC_2_APB_M_PCLK       ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_M_PCLK ),
        .FIC_2_APB_M_PWRITE     ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PWRITE ),
        .FIC_2_APB_M_PENABLE    ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PENABLE ),
        .FIC_2_APB_M_PSEL       ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PSELx ),
        .MDDR_APB_S_PREADY      ( CORECONFIGP_0_MDDR_APBmslave_PREADY ),
        .MDDR_APB_S_PSLVERR     ( CORECONFIGP_0_MDDR_APBmslave_PSLVERR ),
        .MDDR_ADDR              ( MDDR_ADDR_net_0 ),
        .MDDR_BA                ( MDDR_BA_net_0 ),
        .FIC_2_APB_M_PADDR      ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR ),
        .FIC_2_APB_M_PWDATA     ( M2S_MSS_sb_MSS_TMP_0_FIC_2_APB_MASTER_PWDATA ),
        .MDDR_APB_S_PRDATA      ( CORECONFIGP_0_MDDR_APBmslave_PRDATA ),
        // Inouts
        .I2C_0_SDA              ( I2C_0_SDA ),
        .I2C_0_SCL              ( I2C_0_SCL ),
        .I2C_1_SDA              ( I2C_1_SDA ),
        .I2C_1_SCL              ( I2C_1_SCL ),
        .SPI_0_CLK              ( SPI_0_CLK ),
        .SPI_0_SS0              ( SPI_0_SS0 ),
        .SPI_1_CLK              ( SPI_1_CLK ),
        .SPI_1_SS0              ( SPI_1_SS0 ),
        .MDDR_DM_RDQS           ( MDDR_DM_RDQS ),
        .MDDR_DQ                ( MDDR_DQ ),
        .MDDR_DQS               ( MDDR_DQS ),
        .MDDR_DQS_N             ( MDDR_DQS_N ) 
        );

//--------SYSRESET
SYSRESET SYSRESET_POR(
        // Inputs
        .DEVRST_N         ( DEVRST_N ),
        // Outputs
        .POWER_ON_RESET_N ( POWER_ON_RESET_N_net_0 ) 
        );


endmodule
