//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Feb 02 00:24:39 2017
// Version: v11.7 11.7.0.119
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// M2S_MSS_sb_MSS
module M2S_MSS_sb_MSS(
    // Inputs
    FIC_2_APB_M_PRDATA,
    FIC_2_APB_M_PREADY,
    FIC_2_APB_M_PSLVERR,
    M3_RESET_N,
    MCCC_CLK_BASE,
    MCCC_CLK_BASE_PLL_LOCK,
    MDDR_APB_S_PADDR,
    MDDR_APB_S_PCLK,
    MDDR_APB_S_PENABLE,
    MDDR_APB_S_PRESET_N,
    MDDR_APB_S_PSEL,
    MDDR_APB_S_PWDATA,
    MDDR_APB_S_PWRITE,
    MDDR_DQS_TMATCH_0_IN,
    MMUART_0_RXD,
    MMUART_1_RXD,
    MSS_RESET_N_F2M,
    SPI_0_DI,
    SPI_1_DI,
    // Outputs
    FIC_2_APB_M_PADDR,
    FIC_2_APB_M_PCLK,
    FIC_2_APB_M_PENABLE,
    FIC_2_APB_M_PRESET_N,
    FIC_2_APB_M_PSEL,
    FIC_2_APB_M_PWDATA,
    FIC_2_APB_M_PWRITE,
    GPIO_0_M2F,
    GPIO_1_M2F,
    GPIO_2_M2F,
    GPIO_3_M2F,
    MDDR_ADDR,
    MDDR_APB_S_PRDATA,
    MDDR_APB_S_PREADY,
    MDDR_APB_S_PSLVERR,
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
    MSS_RESET_N_M2F,
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
input  [31:0] FIC_2_APB_M_PRDATA;
input         FIC_2_APB_M_PREADY;
input         FIC_2_APB_M_PSLVERR;
input         M3_RESET_N;
input         MCCC_CLK_BASE;
input         MCCC_CLK_BASE_PLL_LOCK;
input  [10:2] MDDR_APB_S_PADDR;
input         MDDR_APB_S_PCLK;
input         MDDR_APB_S_PENABLE;
input         MDDR_APB_S_PRESET_N;
input         MDDR_APB_S_PSEL;
input  [15:0] MDDR_APB_S_PWDATA;
input         MDDR_APB_S_PWRITE;
input         MDDR_DQS_TMATCH_0_IN;
input         MMUART_0_RXD;
input         MMUART_1_RXD;
input         MSS_RESET_N_F2M;
input         SPI_0_DI;
input         SPI_1_DI;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [15:2] FIC_2_APB_M_PADDR;
output        FIC_2_APB_M_PCLK;
output        FIC_2_APB_M_PENABLE;
output        FIC_2_APB_M_PRESET_N;
output        FIC_2_APB_M_PSEL;
output [31:0] FIC_2_APB_M_PWDATA;
output        FIC_2_APB_M_PWRITE;
output        GPIO_0_M2F;
output        GPIO_1_M2F;
output        GPIO_2_M2F;
output        GPIO_3_M2F;
output [15:0] MDDR_ADDR;
output [15:0] MDDR_APB_S_PRDATA;
output        MDDR_APB_S_PREADY;
output        MDDR_APB_S_PSLVERR;
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
output        MSS_RESET_N_M2F;
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
wire           FIC_2_APB_M_PCLK_0;
wire           FIC_2_APB_M_PRESET_N_0;
wire   [15:2]  FIC_2_APB_MASTER_0_PADDR;
wire           FIC_2_APB_MASTER_0_PENABLE;
wire   [31:0]  FIC_2_APB_M_PRDATA;
wire           FIC_2_APB_M_PREADY;
wire           FIC_2_APB_MASTER_0_PSELx;
wire           FIC_2_APB_M_PSLVERR;
wire   [31:0]  FIC_2_APB_MASTER_0_PWDATA;
wire           FIC_2_APB_MASTER_0_PWRITE;
wire           GPIO_0_M2F_net_0;
wire           GPIO_1_M2F_net_0;
wire           GPIO_2_M2F_net_0;
wire           GPIO_3_M2F_net_0;
wire           I2C_0_SCL;
wire           I2C_0_SCL_PAD_Y;
wire           I2C_0_SDA;
wire           I2C_0_SDA_PAD_Y;
wire           I2C_1_SCL;
wire           I2C_1_SCL_PAD_Y;
wire           I2C_1_SDA;
wire           I2C_1_SDA_PAD_Y;
wire           M3_RESET_N;
wire           MCCC_CLK_BASE;
wire           MCCC_CLK_BASE_PLL_LOCK;
wire           MDDR_ADDR_net_0;
wire           MDDR_ADDR_0;
wire           MDDR_ADDR_1;
wire           MDDR_ADDR_2;
wire           MDDR_ADDR_3;
wire           MDDR_ADDR_4;
wire           MDDR_ADDR_5;
wire           MDDR_ADDR_6;
wire           MDDR_ADDR_7;
wire           MDDR_ADDR_8;
wire           MDDR_ADDR_9;
wire           MDDR_ADDR_10;
wire           MDDR_ADDR_11;
wire           MDDR_ADDR_12;
wire           MDDR_ADDR_13;
wire           MDDR_ADDR_14;
wire           MDDR_APB_S_PCLK;
wire           MDDR_APB_S_PRESET_N;
wire   [10:2]  MDDR_APB_S_PADDR;
wire           MDDR_APB_S_PENABLE;
wire   [15:0]  MDDR_APB_SLAVE_PRDATA;
wire           MDDR_APB_SLAVE_PREADY;
wire           MDDR_APB_S_PSEL;
wire           MDDR_APB_SLAVE_PSLVERR;
wire   [15:0]  MDDR_APB_S_PWDATA;
wire           MDDR_APB_S_PWRITE;
wire           MDDR_BA_net_0;
wire           MDDR_BA_0;
wire           MDDR_BA_1;
wire           MDDR_CAS_N_net_0;
wire           MDDR_CKE_net_0;
wire           MDDR_CLK_net_0;
wire           MDDR_CLK_N_net_0;
wire           MDDR_CS_N_net_0;
wire           MDDR_DM_RDQS_0_PAD_Y;
wire           MDDR_DQ_0_PAD_Y;
wire           MDDR_DQ_1_PAD_Y;
wire           MDDR_DQ_2_PAD_Y;
wire           MDDR_DQ_3_PAD_Y;
wire           MDDR_DQ_4_PAD_Y;
wire           MDDR_DQ_5_PAD_Y;
wire           MDDR_DQ_6_PAD_Y;
wire           MDDR_DQ_7_PAD_Y;
wire           MDDR_DQS_0_PAD_Y;
wire           MDDR_DQS_TMATCH_0_IN;
wire           MDDR_DQS_TMATCH_0_IN_PAD_Y;
wire           MDDR_DQS_TMATCH_0_OUT_net_0;
wire           MDDR_ODT_net_0;
wire           MDDR_RAS_N_net_0;
wire           MDDR_RESET_N_net_0;
wire           MDDR_WE_N_net_0;
wire           MMUART_0_RXD;
wire           MMUART_0_RXD_PAD_Y;
wire           MMUART_0_TXD_net_0;
wire           MMUART_1_RXD;
wire           MMUART_1_RXD_PAD_Y;
wire           MMUART_1_TXD_net_0;
wire   [0:0]   MSS_ADLIB_INST_DM_OE0to0;
wire   [0:0]   MSS_ADLIB_INST_DRAM_ADDR0to0;
wire   [1:1]   MSS_ADLIB_INST_DRAM_ADDR1to1;
wire   [2:2]   MSS_ADLIB_INST_DRAM_ADDR2to2;
wire   [3:3]   MSS_ADLIB_INST_DRAM_ADDR3to3;
wire   [4:4]   MSS_ADLIB_INST_DRAM_ADDR4to4;
wire   [5:5]   MSS_ADLIB_INST_DRAM_ADDR5to5;
wire   [6:6]   MSS_ADLIB_INST_DRAM_ADDR6to6;
wire   [7:7]   MSS_ADLIB_INST_DRAM_ADDR7to7;
wire   [8:8]   MSS_ADLIB_INST_DRAM_ADDR8to8;
wire   [9:9]   MSS_ADLIB_INST_DRAM_ADDR9to9;
wire   [10:10] MSS_ADLIB_INST_DRAM_ADDR10to10;
wire   [11:11] MSS_ADLIB_INST_DRAM_ADDR11to11;
wire   [12:12] MSS_ADLIB_INST_DRAM_ADDR12to12;
wire   [13:13] MSS_ADLIB_INST_DRAM_ADDR13to13;
wire   [14:14] MSS_ADLIB_INST_DRAM_ADDR14to14;
wire   [15:15] MSS_ADLIB_INST_DRAM_ADDR15to15;
wire   [0:0]   MSS_ADLIB_INST_DRAM_BA0to0;
wire   [1:1]   MSS_ADLIB_INST_DRAM_BA1to1;
wire   [2:2]   MSS_ADLIB_INST_DRAM_BA2to2;
wire           MSS_ADLIB_INST_DRAM_CASN;
wire           MSS_ADLIB_INST_DRAM_CKE;
wire           MSS_ADLIB_INST_DRAM_CLK;
wire           MSS_ADLIB_INST_DRAM_CSN;
wire   [0:0]   MSS_ADLIB_INST_DRAM_DM_RDQS_OUT0to0;
wire   [0:0]   MSS_ADLIB_INST_DRAM_DQ_OE0to0;
wire   [1:1]   MSS_ADLIB_INST_DRAM_DQ_OE1to1;
wire   [2:2]   MSS_ADLIB_INST_DRAM_DQ_OE2to2;
wire   [3:3]   MSS_ADLIB_INST_DRAM_DQ_OE3to3;
wire   [4:4]   MSS_ADLIB_INST_DRAM_DQ_OE4to4;
wire   [5:5]   MSS_ADLIB_INST_DRAM_DQ_OE5to5;
wire   [6:6]   MSS_ADLIB_INST_DRAM_DQ_OE6to6;
wire   [7:7]   MSS_ADLIB_INST_DRAM_DQ_OE7to7;
wire   [0:0]   MSS_ADLIB_INST_DRAM_DQ_OUT0to0;
wire   [1:1]   MSS_ADLIB_INST_DRAM_DQ_OUT1to1;
wire   [2:2]   MSS_ADLIB_INST_DRAM_DQ_OUT2to2;
wire   [3:3]   MSS_ADLIB_INST_DRAM_DQ_OUT3to3;
wire   [4:4]   MSS_ADLIB_INST_DRAM_DQ_OUT4to4;
wire   [5:5]   MSS_ADLIB_INST_DRAM_DQ_OUT5to5;
wire   [6:6]   MSS_ADLIB_INST_DRAM_DQ_OUT6to6;
wire   [7:7]   MSS_ADLIB_INST_DRAM_DQ_OUT7to7;
wire   [0:0]   MSS_ADLIB_INST_DRAM_DQS_OE0to0;
wire   [0:0]   MSS_ADLIB_INST_DRAM_DQS_OUT0to0;
wire   [0:0]   MSS_ADLIB_INST_DRAM_FIFO_WE_OUT0to0;
wire           MSS_ADLIB_INST_DRAM_ODT;
wire           MSS_ADLIB_INST_DRAM_RASN;
wire           MSS_ADLIB_INST_DRAM_RSTN;
wire           MSS_ADLIB_INST_DRAM_WEN;
wire           MSS_ADLIB_INST_I2C0_SCL_USBC_DATA1_MGPIO31B_OE;
wire           MSS_ADLIB_INST_I2C0_SCL_USBC_DATA1_MGPIO31B_OUT;
wire           MSS_ADLIB_INST_I2C0_SDA_USBC_DATA0_MGPIO30B_OE;
wire           MSS_ADLIB_INST_I2C0_SDA_USBC_DATA0_MGPIO30B_OUT;
wire           MSS_ADLIB_INST_I2C1_SCL_USBA_DATA4_MGPIO1A_OE;
wire           MSS_ADLIB_INST_I2C1_SCL_USBA_DATA4_MGPIO1A_OUT;
wire           MSS_ADLIB_INST_I2C1_SDA_USBA_DATA3_MGPIO0A_OE;
wire           MSS_ADLIB_INST_I2C1_SDA_USBA_DATA3_MGPIO0A_OUT;
wire           MSS_ADLIB_INST_MMUART0_TXD_USBC_DIR_MGPIO27B_OE;
wire           MSS_ADLIB_INST_MMUART0_TXD_USBC_DIR_MGPIO27B_OUT;
wire           MSS_ADLIB_INST_MMUART1_TXD_USBC_DATA2_MGPIO24B_OE;
wire           MSS_ADLIB_INST_MMUART1_TXD_USBC_DATA2_MGPIO24B_OUT;
wire           MSS_ADLIB_INST_SPI0_SCK_USBA_XCLK_OE;
wire           MSS_ADLIB_INST_SPI0_SCK_USBA_XCLK_OUT;
wire           MSS_ADLIB_INST_SPI0_SDO_USBA_STP_MGPIO6A_OE;
wire           MSS_ADLIB_INST_SPI0_SDO_USBA_STP_MGPIO6A_OUT;
wire           MSS_ADLIB_INST_SPI0_SS0_USBA_NXT_MGPIO7A_OE;
wire           MSS_ADLIB_INST_SPI0_SS0_USBA_NXT_MGPIO7A_OUT;
wire           MSS_ADLIB_INST_SPI1_SCK_OE;
wire           MSS_ADLIB_INST_SPI1_SCK_OUT;
wire           MSS_ADLIB_INST_SPI1_SDO_MGPIO12A_OE;
wire           MSS_ADLIB_INST_SPI1_SDO_MGPIO12A_OUT;
wire           MSS_ADLIB_INST_SPI1_SS0_MGPIO13A_OE;
wire           MSS_ADLIB_INST_SPI1_SS0_MGPIO13A_OUT;
wire           MSS_RESET_N_F2M;
wire           MSS_RESET_N_M2F_net_0;
wire           SPI_0_CLK;
wire           SPI_0_CLK_PAD_Y;
wire           SPI_0_DI;
wire           SPI_0_DI_PAD_Y;
wire           SPI_0_DO_net_0;
wire           SPI_0_SS0;
wire           SPI_0_SS0_PAD_Y;
wire           SPI_1_CLK;
wire           SPI_1_CLK_PAD_Y;
wire           SPI_1_DI;
wire           SPI_1_DI_PAD_Y;
wire           SPI_1_DO_net_0;
wire           SPI_1_SS0;
wire           SPI_1_SS0_PAD_Y;
wire           SPI_0_DO_net_1;
wire           SPI_1_DO_net_1;
wire           MMUART_1_TXD_net_1;
wire           MMUART_0_TXD_net_1;
wire           MDDR_DQS_TMATCH_0_OUT_net_1;
wire           MDDR_CAS_N_net_1;
wire           MDDR_CLK_net_1;
wire           MDDR_CLK_N_net_1;
wire           MDDR_CKE_net_1;
wire           MDDR_CS_N_net_1;
wire           MDDR_ODT_net_1;
wire           MDDR_RAS_N_net_1;
wire           MDDR_RESET_N_net_1;
wire           MDDR_WE_N_net_1;
wire           MSS_RESET_N_M2F_net_1;
wire           GPIO_0_M2F_net_1;
wire           GPIO_1_M2F_net_1;
wire           GPIO_2_M2F_net_1;
wire           GPIO_3_M2F_net_1;
wire           FIC_2_APB_M_PRESET_N_0_net_0;
wire           FIC_2_APB_M_PCLK_0_net_0;
wire           FIC_2_APB_MASTER_0_PWRITE_net_0;
wire           FIC_2_APB_MASTER_0_PENABLE_net_0;
wire           FIC_2_APB_MASTER_0_PSELx_net_0;
wire           MDDR_APB_SLAVE_PREADY_net_0;
wire           MDDR_APB_SLAVE_PSLVERR_net_0;
wire   [0:0]   MDDR_ADDR_14_net_0;
wire   [10:10] MDDR_ADDR_4_net_0;
wire   [11:11] MDDR_ADDR_3_net_0;
wire   [12:12] MDDR_ADDR_2_net_0;
wire   [13:13] MDDR_ADDR_1_net_0;
wire   [14:14] MDDR_ADDR_0_net_0;
wire   [15:15] MDDR_ADDR_net_1;
wire   [1:1]   MDDR_ADDR_13_net_0;
wire   [2:2]   MDDR_ADDR_12_net_0;
wire   [3:3]   MDDR_ADDR_11_net_0;
wire   [4:4]   MDDR_ADDR_10_net_0;
wire   [5:5]   MDDR_ADDR_9_net_0;
wire   [6:6]   MDDR_ADDR_8_net_0;
wire   [7:7]   MDDR_ADDR_7_net_0;
wire   [8:8]   MDDR_ADDR_6_net_0;
wire   [9:9]   MDDR_ADDR_5_net_0;
wire   [0:0]   MDDR_BA_1_net_0;
wire   [1:1]   MDDR_BA_0_net_0;
wire   [2:2]   MDDR_BA_net_1;
wire   [15:2]  FIC_2_APB_MASTER_0_PADDR_net_0;
wire   [31:0]  FIC_2_APB_MASTER_0_PWDATA_net_0;
wire   [15:0]  MDDR_APB_SLAVE_PRDATA_net_0;
wire   [1:1]   DRAM_DM_RDQS_OUT_slice_0;
wire   [2:2]   DRAM_DM_RDQS_OUT_slice_1;
wire   [10:10] DRAM_DQ_OUT_slice_0;
wire   [11:11] DRAM_DQ_OUT_slice_1;
wire   [12:12] DRAM_DQ_OUT_slice_2;
wire   [13:13] DRAM_DQ_OUT_slice_3;
wire   [14:14] DRAM_DQ_OUT_slice_4;
wire   [15:15] DRAM_DQ_OUT_slice_5;
wire   [16:16] DRAM_DQ_OUT_slice_6;
wire   [17:17] DRAM_DQ_OUT_slice_7;
wire   [8:8]   DRAM_DQ_OUT_slice_8;
wire   [9:9]   DRAM_DQ_OUT_slice_9;
wire   [1:1]   DRAM_DQS_OUT_slice_0;
wire   [2:2]   DRAM_DQS_OUT_slice_1;
wire   [1:1]   DRAM_FIFO_WE_OUT_slice_0;
wire   [1:1]   DM_OE_slice_0;
wire   [2:2]   DM_OE_slice_1;
wire   [10:10] DRAM_DQ_OE_slice_0;
wire   [11:11] DRAM_DQ_OE_slice_1;
wire   [12:12] DRAM_DQ_OE_slice_2;
wire   [13:13] DRAM_DQ_OE_slice_3;
wire   [14:14] DRAM_DQ_OE_slice_4;
wire   [15:15] DRAM_DQ_OE_slice_5;
wire   [16:16] DRAM_DQ_OE_slice_6;
wire   [17:17] DRAM_DQ_OE_slice_7;
wire   [8:8]   DRAM_DQ_OE_slice_8;
wire   [9:9]   DRAM_DQ_OE_slice_9;
wire   [1:1]   DRAM_DQS_OE_slice_0;
wire   [2:2]   DRAM_DQS_OE_slice_1;
wire   [2:0]   DM_IN_net_0;
wire   [17:0]  DRAM_DQ_IN_net_0;
wire   [2:0]   DRAM_DQS_IN_net_0;
wire   [1:0]   DRAM_FIFO_WE_IN_net_0;
wire   [15:0]  DRAM_ADDR_net_0;
wire   [2:0]   DRAM_BA_net_0;
wire   [2:0]   DRAM_DM_RDQS_OUT_net_0;
wire   [17:0]  DRAM_DQ_OUT_net_0;
wire   [2:0]   DRAM_DQS_OUT_net_0;
wire   [1:0]   DRAM_FIFO_WE_OUT_net_0;
wire   [2:0]   DM_OE_net_0;
wire   [17:0]  DRAM_DQ_OE_net_0;
wire   [2:0]   DRAM_DQS_OE_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire           GND_net;
wire           VCC_net;
wire   [1:0]   F2_DMAREADY_const_net_0;
wire   [15:0]  F2H_INTERRUPT_const_net_0;
wire   [1:0]   F_DMAREADY_const_net_0;
wire   [31:0]  F_FM0_ADDR_const_net_0;
wire   [1:0]   F_FM0_SIZE_const_net_0;
wire   [31:0]  F_FM0_WDATA_const_net_0;
wire   [31:0]  F_HM0_RDATA_const_net_0;
wire   [1:0]   FAB_LINESTATE_const_net_0;
wire   [7:0]   FAB_VSTATUS_const_net_0;
wire   [7:0]   FAB_XDATAIN_const_net_0;
wire   [9:0]   RCGF_const_net_0;
wire   [7:0]   RXDF_const_net_0;
wire   [31:0]  F_ARADDR_HADDR1_const_net_0;
wire   [1:0]   F_ARBURST_HTRANS1_const_net_0;
wire   [3:0]   F_ARID_HSEL1_const_net_0;
wire   [3:0]   F_ARLEN_HBURST1_const_net_0;
wire   [1:0]   F_ARLOCK_HMASTLOCK1_const_net_0;
wire   [1:0]   F_ARSIZE_HSIZE1_const_net_0;
wire   [31:0]  F_AWADDR_HADDR0_const_net_0;
wire   [1:0]   F_AWBURST_HTRANS0_const_net_0;
wire   [3:0]   F_AWID_HSEL0_const_net_0;
wire   [3:0]   F_AWLEN_HBURST0_const_net_0;
wire   [1:0]   F_AWLOCK_HMASTLOCK0_const_net_0;
wire   [1:0]   F_AWSIZE_HSIZE0_const_net_0;
wire   [63:0]  F_WDATA_HWDATA01_const_net_0;
wire   [3:0]   F_WID_HREADY01_const_net_0;
wire   [7:0]   F_WSTRB_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                         = 1'b0;
assign VCC_net                         = 1'b1;
assign F2_DMAREADY_const_net_0         = 2'h3;
assign F2H_INTERRUPT_const_net_0       = 16'h0000;
assign F_DMAREADY_const_net_0          = 2'h3;
assign F_FM0_ADDR_const_net_0          = 32'h00000000;
assign F_FM0_SIZE_const_net_0          = 2'h0;
assign F_FM0_WDATA_const_net_0         = 32'h00000000;
assign F_HM0_RDATA_const_net_0         = 32'h00000000;
assign FAB_LINESTATE_const_net_0       = 2'h3;
assign FAB_VSTATUS_const_net_0         = 8'hFF;
assign FAB_XDATAIN_const_net_0         = 8'hFF;
assign RCGF_const_net_0                = 10'h3FF;
assign RXDF_const_net_0                = 8'hFF;
assign F_ARADDR_HADDR1_const_net_0     = 32'hFFFFFFFF;
assign F_ARBURST_HTRANS1_const_net_0   = 2'h0;
assign F_ARID_HSEL1_const_net_0        = 4'h0;
assign F_ARLEN_HBURST1_const_net_0     = 4'h0;
assign F_ARLOCK_HMASTLOCK1_const_net_0 = 2'h0;
assign F_ARSIZE_HSIZE1_const_net_0     = 2'h0;
assign F_AWADDR_HADDR0_const_net_0     = 32'hFFFFFFFF;
assign F_AWBURST_HTRANS0_const_net_0   = 2'h0;
assign F_AWID_HSEL0_const_net_0        = 4'h0;
assign F_AWLEN_HBURST0_const_net_0     = 4'h0;
assign F_AWLOCK_HMASTLOCK0_const_net_0 = 2'h0;
assign F_AWSIZE_HSIZE0_const_net_0     = 2'h0;
assign F_WDATA_HWDATA01_const_net_0    = 64'hFFFFFFFFFFFFFFFF;
assign F_WID_HREADY01_const_net_0      = 4'h0;
assign F_WSTRB_const_net_0             = 8'h00;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign SPI_0_DO_net_1                   = SPI_0_DO_net_0;
assign SPI_0_DO                         = SPI_0_DO_net_1;
assign SPI_1_DO_net_1                   = SPI_1_DO_net_0;
assign SPI_1_DO                         = SPI_1_DO_net_1;
assign MMUART_1_TXD_net_1               = MMUART_1_TXD_net_0;
assign MMUART_1_TXD                     = MMUART_1_TXD_net_1;
assign MMUART_0_TXD_net_1               = MMUART_0_TXD_net_0;
assign MMUART_0_TXD                     = MMUART_0_TXD_net_1;
assign MDDR_DQS_TMATCH_0_OUT_net_1      = MDDR_DQS_TMATCH_0_OUT_net_0;
assign MDDR_DQS_TMATCH_0_OUT            = MDDR_DQS_TMATCH_0_OUT_net_1;
assign MDDR_CAS_N_net_1                 = MDDR_CAS_N_net_0;
assign MDDR_CAS_N                       = MDDR_CAS_N_net_1;
assign MDDR_CLK_net_1                   = MDDR_CLK_net_0;
assign MDDR_CLK                         = MDDR_CLK_net_1;
assign MDDR_CLK_N_net_1                 = MDDR_CLK_N_net_0;
assign MDDR_CLK_N                       = MDDR_CLK_N_net_1;
assign MDDR_CKE_net_1                   = MDDR_CKE_net_0;
assign MDDR_CKE                         = MDDR_CKE_net_1;
assign MDDR_CS_N_net_1                  = MDDR_CS_N_net_0;
assign MDDR_CS_N                        = MDDR_CS_N_net_1;
assign MDDR_ODT_net_1                   = MDDR_ODT_net_0;
assign MDDR_ODT                         = MDDR_ODT_net_1;
assign MDDR_RAS_N_net_1                 = MDDR_RAS_N_net_0;
assign MDDR_RAS_N                       = MDDR_RAS_N_net_1;
assign MDDR_RESET_N_net_1               = MDDR_RESET_N_net_0;
assign MDDR_RESET_N                     = MDDR_RESET_N_net_1;
assign MDDR_WE_N_net_1                  = MDDR_WE_N_net_0;
assign MDDR_WE_N                        = MDDR_WE_N_net_1;
assign MSS_RESET_N_M2F_net_1            = MSS_RESET_N_M2F_net_0;
assign MSS_RESET_N_M2F                  = MSS_RESET_N_M2F_net_1;
assign GPIO_0_M2F_net_1                 = GPIO_0_M2F_net_0;
assign GPIO_0_M2F                       = GPIO_0_M2F_net_1;
assign GPIO_1_M2F_net_1                 = GPIO_1_M2F_net_0;
assign GPIO_1_M2F                       = GPIO_1_M2F_net_1;
assign GPIO_2_M2F_net_1                 = GPIO_2_M2F_net_0;
assign GPIO_2_M2F                       = GPIO_2_M2F_net_1;
assign GPIO_3_M2F_net_1                 = GPIO_3_M2F_net_0;
assign GPIO_3_M2F                       = GPIO_3_M2F_net_1;
assign FIC_2_APB_M_PRESET_N_0_net_0     = FIC_2_APB_M_PRESET_N_0;
assign FIC_2_APB_M_PRESET_N             = FIC_2_APB_M_PRESET_N_0_net_0;
assign FIC_2_APB_M_PCLK_0_net_0         = FIC_2_APB_M_PCLK_0;
assign FIC_2_APB_M_PCLK                 = FIC_2_APB_M_PCLK_0_net_0;
assign FIC_2_APB_MASTER_0_PWRITE_net_0  = FIC_2_APB_MASTER_0_PWRITE;
assign FIC_2_APB_M_PWRITE               = FIC_2_APB_MASTER_0_PWRITE_net_0;
assign FIC_2_APB_MASTER_0_PENABLE_net_0 = FIC_2_APB_MASTER_0_PENABLE;
assign FIC_2_APB_M_PENABLE              = FIC_2_APB_MASTER_0_PENABLE_net_0;
assign FIC_2_APB_MASTER_0_PSELx_net_0   = FIC_2_APB_MASTER_0_PSELx;
assign FIC_2_APB_M_PSEL                 = FIC_2_APB_MASTER_0_PSELx_net_0;
assign MDDR_APB_SLAVE_PREADY_net_0      = MDDR_APB_SLAVE_PREADY;
assign MDDR_APB_S_PREADY                = MDDR_APB_SLAVE_PREADY_net_0;
assign MDDR_APB_SLAVE_PSLVERR_net_0     = MDDR_APB_SLAVE_PSLVERR;
assign MDDR_APB_S_PSLVERR               = MDDR_APB_SLAVE_PSLVERR_net_0;
assign MDDR_ADDR_14_net_0[0]            = MDDR_ADDR_14;
assign MDDR_ADDR[0:0]                   = MDDR_ADDR_14_net_0[0];
assign MDDR_ADDR_4_net_0[10]            = MDDR_ADDR_4;
assign MDDR_ADDR[10:10]                 = MDDR_ADDR_4_net_0[10];
assign MDDR_ADDR_3_net_0[11]            = MDDR_ADDR_3;
assign MDDR_ADDR[11:11]                 = MDDR_ADDR_3_net_0[11];
assign MDDR_ADDR_2_net_0[12]            = MDDR_ADDR_2;
assign MDDR_ADDR[12:12]                 = MDDR_ADDR_2_net_0[12];
assign MDDR_ADDR_1_net_0[13]            = MDDR_ADDR_1;
assign MDDR_ADDR[13:13]                 = MDDR_ADDR_1_net_0[13];
assign MDDR_ADDR_0_net_0[14]            = MDDR_ADDR_0;
assign MDDR_ADDR[14:14]                 = MDDR_ADDR_0_net_0[14];
assign MDDR_ADDR_net_1[15]              = MDDR_ADDR_net_0;
assign MDDR_ADDR[15:15]                 = MDDR_ADDR_net_1[15];
assign MDDR_ADDR_13_net_0[1]            = MDDR_ADDR_13;
assign MDDR_ADDR[1:1]                   = MDDR_ADDR_13_net_0[1];
assign MDDR_ADDR_12_net_0[2]            = MDDR_ADDR_12;
assign MDDR_ADDR[2:2]                   = MDDR_ADDR_12_net_0[2];
assign MDDR_ADDR_11_net_0[3]            = MDDR_ADDR_11;
assign MDDR_ADDR[3:3]                   = MDDR_ADDR_11_net_0[3];
assign MDDR_ADDR_10_net_0[4]            = MDDR_ADDR_10;
assign MDDR_ADDR[4:4]                   = MDDR_ADDR_10_net_0[4];
assign MDDR_ADDR_9_net_0[5]             = MDDR_ADDR_9;
assign MDDR_ADDR[5:5]                   = MDDR_ADDR_9_net_0[5];
assign MDDR_ADDR_8_net_0[6]             = MDDR_ADDR_8;
assign MDDR_ADDR[6:6]                   = MDDR_ADDR_8_net_0[6];
assign MDDR_ADDR_7_net_0[7]             = MDDR_ADDR_7;
assign MDDR_ADDR[7:7]                   = MDDR_ADDR_7_net_0[7];
assign MDDR_ADDR_6_net_0[8]             = MDDR_ADDR_6;
assign MDDR_ADDR[8:8]                   = MDDR_ADDR_6_net_0[8];
assign MDDR_ADDR_5_net_0[9]             = MDDR_ADDR_5;
assign MDDR_ADDR[9:9]                   = MDDR_ADDR_5_net_0[9];
assign MDDR_BA_1_net_0[0]               = MDDR_BA_1;
assign MDDR_BA[0:0]                     = MDDR_BA_1_net_0[0];
assign MDDR_BA_0_net_0[1]               = MDDR_BA_0;
assign MDDR_BA[1:1]                     = MDDR_BA_0_net_0[1];
assign MDDR_BA_net_1[2]                 = MDDR_BA_net_0;
assign MDDR_BA[2:2]                     = MDDR_BA_net_1[2];
assign FIC_2_APB_MASTER_0_PADDR_net_0   = FIC_2_APB_MASTER_0_PADDR;
assign FIC_2_APB_M_PADDR[15:2]          = FIC_2_APB_MASTER_0_PADDR_net_0;
assign FIC_2_APB_MASTER_0_PWDATA_net_0  = FIC_2_APB_MASTER_0_PWDATA;
assign FIC_2_APB_M_PWDATA[31:0]         = FIC_2_APB_MASTER_0_PWDATA_net_0;
assign MDDR_APB_SLAVE_PRDATA_net_0      = MDDR_APB_SLAVE_PRDATA;
assign MDDR_APB_S_PRDATA[15:0]          = MDDR_APB_SLAVE_PRDATA_net_0;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign MSS_ADLIB_INST_DM_OE0to0[0]            = DM_OE_net_0[0:0];
assign MSS_ADLIB_INST_DRAM_ADDR0to0[0]        = DRAM_ADDR_net_0[0:0];
assign MSS_ADLIB_INST_DRAM_ADDR1to1[1]        = DRAM_ADDR_net_0[1:1];
assign MSS_ADLIB_INST_DRAM_ADDR2to2[2]        = DRAM_ADDR_net_0[2:2];
assign MSS_ADLIB_INST_DRAM_ADDR3to3[3]        = DRAM_ADDR_net_0[3:3];
assign MSS_ADLIB_INST_DRAM_ADDR4to4[4]        = DRAM_ADDR_net_0[4:4];
assign MSS_ADLIB_INST_DRAM_ADDR5to5[5]        = DRAM_ADDR_net_0[5:5];
assign MSS_ADLIB_INST_DRAM_ADDR6to6[6]        = DRAM_ADDR_net_0[6:6];
assign MSS_ADLIB_INST_DRAM_ADDR7to7[7]        = DRAM_ADDR_net_0[7:7];
assign MSS_ADLIB_INST_DRAM_ADDR8to8[8]        = DRAM_ADDR_net_0[8:8];
assign MSS_ADLIB_INST_DRAM_ADDR9to9[9]        = DRAM_ADDR_net_0[9:9];
assign MSS_ADLIB_INST_DRAM_ADDR10to10[10]     = DRAM_ADDR_net_0[10:10];
assign MSS_ADLIB_INST_DRAM_ADDR11to11[11]     = DRAM_ADDR_net_0[11:11];
assign MSS_ADLIB_INST_DRAM_ADDR12to12[12]     = DRAM_ADDR_net_0[12:12];
assign MSS_ADLIB_INST_DRAM_ADDR13to13[13]     = DRAM_ADDR_net_0[13:13];
assign MSS_ADLIB_INST_DRAM_ADDR14to14[14]     = DRAM_ADDR_net_0[14:14];
assign MSS_ADLIB_INST_DRAM_ADDR15to15[15]     = DRAM_ADDR_net_0[15:15];
assign MSS_ADLIB_INST_DRAM_BA0to0[0]          = DRAM_BA_net_0[0:0];
assign MSS_ADLIB_INST_DRAM_BA1to1[1]          = DRAM_BA_net_0[1:1];
assign MSS_ADLIB_INST_DRAM_BA2to2[2]          = DRAM_BA_net_0[2:2];
assign MSS_ADLIB_INST_DRAM_DM_RDQS_OUT0to0[0] = DRAM_DM_RDQS_OUT_net_0[0:0];
assign MSS_ADLIB_INST_DRAM_DQ_OE0to0[0]       = DRAM_DQ_OE_net_0[0:0];
assign MSS_ADLIB_INST_DRAM_DQ_OE1to1[1]       = DRAM_DQ_OE_net_0[1:1];
assign MSS_ADLIB_INST_DRAM_DQ_OE2to2[2]       = DRAM_DQ_OE_net_0[2:2];
assign MSS_ADLIB_INST_DRAM_DQ_OE3to3[3]       = DRAM_DQ_OE_net_0[3:3];
assign MSS_ADLIB_INST_DRAM_DQ_OE4to4[4]       = DRAM_DQ_OE_net_0[4:4];
assign MSS_ADLIB_INST_DRAM_DQ_OE5to5[5]       = DRAM_DQ_OE_net_0[5:5];
assign MSS_ADLIB_INST_DRAM_DQ_OE6to6[6]       = DRAM_DQ_OE_net_0[6:6];
assign MSS_ADLIB_INST_DRAM_DQ_OE7to7[7]       = DRAM_DQ_OE_net_0[7:7];
assign MSS_ADLIB_INST_DRAM_DQ_OUT0to0[0]      = DRAM_DQ_OUT_net_0[0:0];
assign MSS_ADLIB_INST_DRAM_DQ_OUT1to1[1]      = DRAM_DQ_OUT_net_0[1:1];
assign MSS_ADLIB_INST_DRAM_DQ_OUT2to2[2]      = DRAM_DQ_OUT_net_0[2:2];
assign MSS_ADLIB_INST_DRAM_DQ_OUT3to3[3]      = DRAM_DQ_OUT_net_0[3:3];
assign MSS_ADLIB_INST_DRAM_DQ_OUT4to4[4]      = DRAM_DQ_OUT_net_0[4:4];
assign MSS_ADLIB_INST_DRAM_DQ_OUT5to5[5]      = DRAM_DQ_OUT_net_0[5:5];
assign MSS_ADLIB_INST_DRAM_DQ_OUT6to6[6]      = DRAM_DQ_OUT_net_0[6:6];
assign MSS_ADLIB_INST_DRAM_DQ_OUT7to7[7]      = DRAM_DQ_OUT_net_0[7:7];
assign MSS_ADLIB_INST_DRAM_DQS_OE0to0[0]      = DRAM_DQS_OE_net_0[0:0];
assign MSS_ADLIB_INST_DRAM_DQS_OUT0to0[0]     = DRAM_DQS_OUT_net_0[0:0];
assign MSS_ADLIB_INST_DRAM_FIFO_WE_OUT0to0[0] = DRAM_FIFO_WE_OUT_net_0[0:0];
assign DRAM_DM_RDQS_OUT_slice_0[1]            = DRAM_DM_RDQS_OUT_net_0[1:1];
assign DRAM_DM_RDQS_OUT_slice_1[2]            = DRAM_DM_RDQS_OUT_net_0[2:2];
assign DRAM_DQ_OUT_slice_0[10]                = DRAM_DQ_OUT_net_0[10:10];
assign DRAM_DQ_OUT_slice_1[11]                = DRAM_DQ_OUT_net_0[11:11];
assign DRAM_DQ_OUT_slice_2[12]                = DRAM_DQ_OUT_net_0[12:12];
assign DRAM_DQ_OUT_slice_3[13]                = DRAM_DQ_OUT_net_0[13:13];
assign DRAM_DQ_OUT_slice_4[14]                = DRAM_DQ_OUT_net_0[14:14];
assign DRAM_DQ_OUT_slice_5[15]                = DRAM_DQ_OUT_net_0[15:15];
assign DRAM_DQ_OUT_slice_6[16]                = DRAM_DQ_OUT_net_0[16:16];
assign DRAM_DQ_OUT_slice_7[17]                = DRAM_DQ_OUT_net_0[17:17];
assign DRAM_DQ_OUT_slice_8[8]                 = DRAM_DQ_OUT_net_0[8:8];
assign DRAM_DQ_OUT_slice_9[9]                 = DRAM_DQ_OUT_net_0[9:9];
assign DRAM_DQS_OUT_slice_0[1]                = DRAM_DQS_OUT_net_0[1:1];
assign DRAM_DQS_OUT_slice_1[2]                = DRAM_DQS_OUT_net_0[2:2];
assign DRAM_FIFO_WE_OUT_slice_0[1]            = DRAM_FIFO_WE_OUT_net_0[1:1];
assign DM_OE_slice_0[1]                       = DM_OE_net_0[1:1];
assign DM_OE_slice_1[2]                       = DM_OE_net_0[2:2];
assign DRAM_DQ_OE_slice_0[10]                 = DRAM_DQ_OE_net_0[10:10];
assign DRAM_DQ_OE_slice_1[11]                 = DRAM_DQ_OE_net_0[11:11];
assign DRAM_DQ_OE_slice_2[12]                 = DRAM_DQ_OE_net_0[12:12];
assign DRAM_DQ_OE_slice_3[13]                 = DRAM_DQ_OE_net_0[13:13];
assign DRAM_DQ_OE_slice_4[14]                 = DRAM_DQ_OE_net_0[14:14];
assign DRAM_DQ_OE_slice_5[15]                 = DRAM_DQ_OE_net_0[15:15];
assign DRAM_DQ_OE_slice_6[16]                 = DRAM_DQ_OE_net_0[16:16];
assign DRAM_DQ_OE_slice_7[17]                 = DRAM_DQ_OE_net_0[17:17];
assign DRAM_DQ_OE_slice_8[8]                  = DRAM_DQ_OE_net_0[8:8];
assign DRAM_DQ_OE_slice_9[9]                  = DRAM_DQ_OE_net_0[9:9];
assign DRAM_DQS_OE_slice_0[1]                 = DRAM_DQS_OE_net_0[1:1];
assign DRAM_DQS_OE_slice_1[2]                 = DRAM_DQS_OE_net_0[2:2];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign DM_IN_net_0           = { 1'b0 , 1'b0 , MDDR_DM_RDQS_0_PAD_Y };
assign DRAM_DQ_IN_net_0      = { 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , MDDR_DQ_7_PAD_Y , MDDR_DQ_6_PAD_Y , MDDR_DQ_5_PAD_Y , MDDR_DQ_4_PAD_Y , MDDR_DQ_3_PAD_Y , MDDR_DQ_2_PAD_Y , MDDR_DQ_1_PAD_Y , MDDR_DQ_0_PAD_Y };
assign DRAM_DQS_IN_net_0     = { 1'b0 , 1'b0 , MDDR_DQS_0_PAD_Y };
assign DRAM_FIFO_WE_IN_net_0 = { 1'b0 , MDDR_DQS_TMATCH_0_IN_PAD_Y };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------BIBUF
BIBUF I2C_0_SCL_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_I2C0_SCL_USBC_DATA1_MGPIO31B_OUT ),
        .E   ( MSS_ADLIB_INST_I2C0_SCL_USBC_DATA1_MGPIO31B_OE ),
        // Outputs
        .Y   ( I2C_0_SCL_PAD_Y ),
        // Inouts
        .PAD ( I2C_0_SCL ) 
        );

//--------BIBUF
BIBUF I2C_0_SDA_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_I2C0_SDA_USBC_DATA0_MGPIO30B_OUT ),
        .E   ( MSS_ADLIB_INST_I2C0_SDA_USBC_DATA0_MGPIO30B_OE ),
        // Outputs
        .Y   ( I2C_0_SDA_PAD_Y ),
        // Inouts
        .PAD ( I2C_0_SDA ) 
        );

//--------BIBUF
BIBUF I2C_1_SCL_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_I2C1_SCL_USBA_DATA4_MGPIO1A_OUT ),
        .E   ( MSS_ADLIB_INST_I2C1_SCL_USBA_DATA4_MGPIO1A_OE ),
        // Outputs
        .Y   ( I2C_1_SCL_PAD_Y ),
        // Inouts
        .PAD ( I2C_1_SCL ) 
        );

//--------BIBUF
BIBUF I2C_1_SDA_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_I2C1_SDA_USBA_DATA3_MGPIO0A_OUT ),
        .E   ( MSS_ADLIB_INST_I2C1_SDA_USBA_DATA3_MGPIO0A_OE ),
        // Outputs
        .Y   ( I2C_1_SDA_PAD_Y ),
        // Inouts
        .PAD ( I2C_1_SDA ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_ADDR_0_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR0to0 ),
        // Outputs
        .PAD ( MDDR_ADDR_14 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_ADDR_1_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR1to1 ),
        // Outputs
        .PAD ( MDDR_ADDR_13 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_ADDR_2_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR2to2 ),
        // Outputs
        .PAD ( MDDR_ADDR_12 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_ADDR_3_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR3to3 ),
        // Outputs
        .PAD ( MDDR_ADDR_11 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_ADDR_4_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR4to4 ),
        // Outputs
        .PAD ( MDDR_ADDR_10 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_ADDR_5_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR5to5 ),
        // Outputs
        .PAD ( MDDR_ADDR_9 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_ADDR_6_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR6to6 ),
        // Outputs
        .PAD ( MDDR_ADDR_8 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_ADDR_7_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR7to7 ),
        // Outputs
        .PAD ( MDDR_ADDR_7 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_ADDR_8_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR8to8 ),
        // Outputs
        .PAD ( MDDR_ADDR_6 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_ADDR_9_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR9to9 ),
        // Outputs
        .PAD ( MDDR_ADDR_5 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_ADDR_10_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR10to10 ),
        // Outputs
        .PAD ( MDDR_ADDR_4 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_ADDR_11_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR11to11 ),
        // Outputs
        .PAD ( MDDR_ADDR_3 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_ADDR_12_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR12to12 ),
        // Outputs
        .PAD ( MDDR_ADDR_2 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_ADDR_13_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR13to13 ),
        // Outputs
        .PAD ( MDDR_ADDR_1 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_ADDR_14_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR14to14 ),
        // Outputs
        .PAD ( MDDR_ADDR_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_ADDR_15_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR15to15 ),
        // Outputs
        .PAD ( MDDR_ADDR_net_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_BA_0_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_BA0to0 ),
        // Outputs
        .PAD ( MDDR_BA_1 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_BA_1_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_BA1to1 ),
        // Outputs
        .PAD ( MDDR_BA_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_BA_2_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_BA2to2 ),
        // Outputs
        .PAD ( MDDR_BA_net_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_CAS_N_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_CASN ),
        // Outputs
        .PAD ( MDDR_CAS_N_net_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_CKE_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_CKE ),
        // Outputs
        .PAD ( MDDR_CKE_net_0 ) 
        );

//--------OUTBUF_DIFF
OUTBUF_DIFF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_CLK_PAD(
        // Inputs
        .D    ( MSS_ADLIB_INST_DRAM_CLK ),
        // Outputs
        .PADP ( MDDR_CLK_net_0 ),
        .PADN ( MDDR_CLK_N_net_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_CS_N_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_CSN ),
        // Outputs
        .PAD ( MDDR_CS_N_net_0 ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_DM_RDQS_0_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DM_RDQS_OUT0to0 ),
        .E   ( MSS_ADLIB_INST_DM_OE0to0 ),
        // Outputs
        .Y   ( MDDR_DM_RDQS_0_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DM_RDQS[0:0] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_DQ_0_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT0to0 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE0to0 ),
        // Outputs
        .Y   ( MDDR_DQ_0_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[0:0] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_DQ_1_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT1to1 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE1to1 ),
        // Outputs
        .Y   ( MDDR_DQ_1_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[1:1] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_DQ_2_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT2to2 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE2to2 ),
        // Outputs
        .Y   ( MDDR_DQ_2_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[2:2] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_DQ_3_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT3to3 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE3to3 ),
        // Outputs
        .Y   ( MDDR_DQ_3_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[3:3] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_DQ_4_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT4to4 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE4to4 ),
        // Outputs
        .Y   ( MDDR_DQ_4_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[4:4] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_DQ_5_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT5to5 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE5to5 ),
        // Outputs
        .Y   ( MDDR_DQ_5_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[5:5] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_DQ_6_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT6to6 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE6to6 ),
        // Outputs
        .Y   ( MDDR_DQ_6_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[6:6] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_DQ_7_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT7to7 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE7to7 ),
        // Outputs
        .Y   ( MDDR_DQ_7_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[7:7] ) 
        );

//--------BIBUF_DIFF
BIBUF_DIFF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_DQS_0_PAD(
        // Inputs
        .D    ( MSS_ADLIB_INST_DRAM_DQS_OUT0to0 ),
        .E    ( MSS_ADLIB_INST_DRAM_DQS_OE0to0 ),
        // Outputs
        .Y    ( MDDR_DQS_0_PAD_Y ),
        // Inouts
        .PADP ( MDDR_DQS[0:0] ),
        .PADN ( MDDR_DQS_N[0:0] ) 
        );

//--------INBUF
INBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_DQS_TMATCH_0_IN_PAD(
        // Inputs
        .PAD ( MDDR_DQS_TMATCH_0_IN ),
        // Outputs
        .Y   ( MDDR_DQS_TMATCH_0_IN_PAD_Y ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_DQS_TMATCH_0_OUT_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_FIFO_WE_OUT0to0 ),
        // Outputs
        .PAD ( MDDR_DQS_TMATCH_0_OUT_net_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_ODT_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ODT ),
        // Outputs
        .PAD ( MDDR_ODT_net_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_RAS_N_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_RASN ),
        // Outputs
        .PAD ( MDDR_RAS_N_net_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_RESET_N_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_RSTN ),
        // Outputs
        .PAD ( MDDR_RESET_N_net_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18I" ) )
MDDR_WE_N_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_WEN ),
        // Outputs
        .PAD ( MDDR_WE_N_net_0 ) 
        );

//--------INBUF
INBUF MMUART_0_RXD_PAD(
        // Inputs
        .PAD ( MMUART_0_RXD ),
        // Outputs
        .Y   ( MMUART_0_RXD_PAD_Y ) 
        );

//--------TRIBUFF
TRIBUFF MMUART_0_TXD_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_MMUART0_TXD_USBC_DIR_MGPIO27B_OUT ),
        .E   ( MSS_ADLIB_INST_MMUART0_TXD_USBC_DIR_MGPIO27B_OE ),
        // Outputs
        .PAD ( MMUART_0_TXD_net_0 ) 
        );

//--------INBUF
INBUF MMUART_1_RXD_PAD(
        // Inputs
        .PAD ( MMUART_1_RXD ),
        // Outputs
        .Y   ( MMUART_1_RXD_PAD_Y ) 
        );

//--------TRIBUFF
TRIBUFF MMUART_1_TXD_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_MMUART1_TXD_USBC_DATA2_MGPIO24B_OUT ),
        .E   ( MSS_ADLIB_INST_MMUART1_TXD_USBC_DATA2_MGPIO24B_OE ),
        // Outputs
        .PAD ( MMUART_1_TXD_net_0 ) 
        );

//--------MSS_075
MSS_075 #( 
        .ACT_UBITS         ( 56'hFFFFFFFFFFFFFF ),
        .DDR_CLK_FREQ      ( 332.000 ),
        .INIT              ( 1438'h00000401003612000000000000000036100080000000000000000000000000000000000012036100000000000000000001203610000000001004000000000000000000000000000F00000000F000000000000000000000000000000007FFFFFFFB000001007C33F00020200E0864A560003FFFFE4000000000000400000000F0F01C00000002D814010842108421000001FE34001FF8000000400000000000EF1007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
        .MEMORYFILE        ( "ENVM_init.mem" ),
        .RTC_MAIN_XTL_FREQ ( 0.0 ),
        .RTC_MAIN_XTL_MODE ( "" ) )
MSS_ADLIB_INST(
        // Inputs
        .CAN_RXBUS_F2H_SCP                       ( VCC_net ), // tied to 1'b1 from definition
        .CAN_TX_EBL_F2H_SCP                      ( VCC_net ), // tied to 1'b1 from definition
        .CAN_TXBUS_F2H_SCP                       ( VCC_net ), // tied to 1'b1 from definition
        .COLF                                    ( VCC_net ), // tied to 1'b1 from definition
        .CRSF                                    ( VCC_net ), // tied to 1'b1 from definition
        .F2_DMAREADY                             ( F2_DMAREADY_const_net_0 ), // tied to 2'h3 from definition
        .F2H_INTERRUPT                           ( F2H_INTERRUPT_const_net_0 ), // tied to 16'h0000 from definition
        .F2HCALIB                                ( VCC_net ), // tied to 1'b1 from definition
        .F_DMAREADY                              ( F_DMAREADY_const_net_0 ), // tied to 2'h3 from definition
        .F_FM0_ADDR                              ( F_FM0_ADDR_const_net_0 ), // tied to 32'h00000000 from definition
        .F_FM0_ENABLE                            ( GND_net ), // tied to 1'b0 from definition
        .F_FM0_MASTLOCK                          ( GND_net ), // tied to 1'b0 from definition
        .F_FM0_READY                             ( VCC_net ), // tied to 1'b1 from definition
        .F_FM0_SEL                               ( GND_net ), // tied to 1'b0 from definition
        .F_FM0_SIZE                              ( F_FM0_SIZE_const_net_0 ), // tied to 2'h0 from definition
        .F_FM0_TRANS1                            ( GND_net ), // tied to 1'b0 from definition
        .F_FM0_WDATA                             ( F_FM0_WDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .F_FM0_WRITE                             ( GND_net ), // tied to 1'b0 from definition
        .F_HM0_RDATA                             ( F_HM0_RDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .F_HM0_READY                             ( VCC_net ), // tied to 1'b1 from definition
        .F_HM0_RESP                              ( GND_net ), // tied to 1'b0 from definition
        .FAB_AVALID                              ( VCC_net ), // tied to 1'b1 from definition
        .FAB_HOSTDISCON                          ( VCC_net ), // tied to 1'b1 from definition
        .FAB_IDDIG                               ( VCC_net ), // tied to 1'b1 from definition
        .FAB_LINESTATE                           ( FAB_LINESTATE_const_net_0 ), // tied to 2'h3 from definition
        .FAB_M3_RESET_N                          ( M3_RESET_N ),
        .FAB_PLL_LOCK                            ( MCCC_CLK_BASE_PLL_LOCK ),
        .FAB_RXACTIVE                            ( VCC_net ), // tied to 1'b1 from definition
        .FAB_RXERROR                             ( VCC_net ), // tied to 1'b1 from definition
        .FAB_RXVALID                             ( VCC_net ), // tied to 1'b1 from definition
        .FAB_RXVALIDH                            ( GND_net ), // tied to 1'b0 from definition
        .FAB_SESSEND                             ( VCC_net ), // tied to 1'b1 from definition
        .FAB_TXREADY                             ( VCC_net ), // tied to 1'b1 from definition
        .FAB_VBUSVALID                           ( VCC_net ), // tied to 1'b1 from definition
        .FAB_VSTATUS                             ( FAB_VSTATUS_const_net_0 ), // tied to 8'hFF from definition
        .FAB_XDATAIN                             ( FAB_XDATAIN_const_net_0 ), // tied to 8'hFF from definition
        .GTX_CLKPF                               ( VCC_net ), // tied to 1'b1 from definition
        .I2C0_BCLK                               ( VCC_net ), // tied to 1'b1 from definition
        .I2C0_SCL_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .I2C0_SDA_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .I2C1_BCLK                               ( VCC_net ), // tied to 1'b1 from definition
        .I2C1_SCL_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .I2C1_SDA_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .MDIF                                    ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO0A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO10A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO11A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO11B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO12A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO13A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO14A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO15A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO16A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO17B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO18B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO19B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO1A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO20B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO21B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO22B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO24B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO25B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO26B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO27B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO28B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO29B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO2A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO30B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO31B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO3A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO4A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO5A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO6A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO7A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO8A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO9A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_CTS_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_DCD_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_DSR_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_DTR_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_RI_F2H_SCP                      ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_RTS_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_RXD_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_SCK_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_TXD_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_CTS_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_DCD_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_DSR_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_RI_F2H_SCP                      ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_RTS_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_RXD_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_SCK_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_TXD_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .PER2_FABRIC_PRDATA                      ( FIC_2_APB_M_PRDATA ),
        .PER2_FABRIC_PREADY                      ( FIC_2_APB_M_PREADY ),
        .PER2_FABRIC_PSLVERR                     ( FIC_2_APB_M_PSLVERR ),
        .RCGF                                    ( RCGF_const_net_0 ), // tied to 10'h3FF from definition
        .RX_CLKPF                                ( VCC_net ), // tied to 1'b1 from definition
        .RX_DVF                                  ( VCC_net ), // tied to 1'b1 from definition
        .RX_ERRF                                 ( VCC_net ), // tied to 1'b1 from definition
        .RX_EV                                   ( VCC_net ), // tied to 1'b1 from definition
        .RXDF                                    ( RXDF_const_net_0 ), // tied to 8'hFF from definition
        .SLEEPHOLDREQ                            ( GND_net ), // tied to 1'b0 from definition
        .SMBALERT_NI0                            ( VCC_net ), // tied to 1'b1 from definition
        .SMBALERT_NI1                            ( VCC_net ), // tied to 1'b1 from definition
        .SMBSUS_NI0                              ( VCC_net ), // tied to 1'b1 from definition
        .SMBSUS_NI1                              ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_CLK_IN                             ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_SDI_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_SDO_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_SS0_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_SS1_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_SS2_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_SS3_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_CLK_IN                             ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_SDI_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_SDO_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_SS0_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_SS1_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_SS2_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_SS3_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .TX_CLKPF                                ( VCC_net ), // tied to 1'b1 from definition
        .USER_MSS_GPIO_RESET_N                   ( VCC_net ), // tied to 1'b1 from definition
        .USER_MSS_RESET_N                        ( MSS_RESET_N_F2M ),
        .XCLK_FAB                                ( VCC_net ), // tied to 1'b1 from definition
        .CLK_BASE                                ( MCCC_CLK_BASE ),
        .CLK_MDDR_APB                            ( MDDR_APB_S_PCLK ),
        .F_ARADDR_HADDR1                         ( F_ARADDR_HADDR1_const_net_0 ), // tied to 32'hFFFFFFFF from definition
        .F_ARBURST_HTRANS1                       ( F_ARBURST_HTRANS1_const_net_0 ), // tied to 2'h0 from definition
        .F_ARID_HSEL1                            ( F_ARID_HSEL1_const_net_0 ), // tied to 4'h0 from definition
        .F_ARLEN_HBURST1                         ( F_ARLEN_HBURST1_const_net_0 ), // tied to 4'h0 from definition
        .F_ARLOCK_HMASTLOCK1                     ( F_ARLOCK_HMASTLOCK1_const_net_0 ), // tied to 2'h0 from definition
        .F_ARSIZE_HSIZE1                         ( F_ARSIZE_HSIZE1_const_net_0 ), // tied to 2'h0 from definition
        .F_ARVALID_HWRITE1                       ( GND_net ), // tied to 1'b0 from definition
        .F_AWADDR_HADDR0                         ( F_AWADDR_HADDR0_const_net_0 ), // tied to 32'hFFFFFFFF from definition
        .F_AWBURST_HTRANS0                       ( F_AWBURST_HTRANS0_const_net_0 ), // tied to 2'h0 from definition
        .F_AWID_HSEL0                            ( F_AWID_HSEL0_const_net_0 ), // tied to 4'h0 from definition
        .F_AWLEN_HBURST0                         ( F_AWLEN_HBURST0_const_net_0 ), // tied to 4'h0 from definition
        .F_AWLOCK_HMASTLOCK0                     ( F_AWLOCK_HMASTLOCK0_const_net_0 ), // tied to 2'h0 from definition
        .F_AWSIZE_HSIZE0                         ( F_AWSIZE_HSIZE0_const_net_0 ), // tied to 2'h0 from definition
        .F_AWVALID_HWRITE0                       ( GND_net ), // tied to 1'b0 from definition
        .F_BREADY                                ( GND_net ), // tied to 1'b0 from definition
        .F_RMW_AXI                               ( GND_net ), // tied to 1'b0 from definition
        .F_RREADY                                ( GND_net ), // tied to 1'b0 from definition
        .F_WDATA_HWDATA01                        ( F_WDATA_HWDATA01_const_net_0 ), // tied to 64'hFFFFFFFFFFFFFFFF from definition
        .F_WID_HREADY01                          ( F_WID_HREADY01_const_net_0 ), // tied to 4'h0 from definition
        .F_WLAST                                 ( GND_net ), // tied to 1'b0 from definition
        .F_WSTRB                                 ( F_WSTRB_const_net_0 ), // tied to 8'h00 from definition
        .F_WVALID                                ( GND_net ), // tied to 1'b0 from definition
        .FPGA_MDDR_ARESET_N                      ( VCC_net ), // tied to 1'b1 from definition
        .MDDR_FABRIC_PADDR                       ( MDDR_APB_S_PADDR ),
        .MDDR_FABRIC_PENABLE                     ( MDDR_APB_S_PENABLE ),
        .MDDR_FABRIC_PSEL                        ( MDDR_APB_S_PSEL ),
        .MDDR_FABRIC_PWDATA                      ( MDDR_APB_S_PWDATA ),
        .MDDR_FABRIC_PWRITE                      ( MDDR_APB_S_PWRITE ),
        .PRESET_N                                ( MDDR_APB_S_PRESET_N ),
        .CAN_RXBUS_USBA_DATA1_MGPIO3A_IN         ( GND_net ),
        .CAN_TX_EBL_USBA_DATA2_MGPIO4A_IN        ( GND_net ),
        .CAN_TXBUS_USBA_DATA0_MGPIO2A_IN         ( GND_net ),
        .DM_IN                                   ( DM_IN_net_0 ),
        .DRAM_DQ_IN                              ( DRAM_DQ_IN_net_0 ),
        .DRAM_DQS_IN                             ( DRAM_DQS_IN_net_0 ),
        .DRAM_FIFO_WE_IN                         ( DRAM_FIFO_WE_IN_net_0 ),
        .I2C0_SCL_USBC_DATA1_MGPIO31B_IN         ( I2C_0_SCL_PAD_Y ),
        .I2C0_SDA_USBC_DATA0_MGPIO30B_IN         ( I2C_0_SDA_PAD_Y ),
        .I2C1_SCL_USBA_DATA4_MGPIO1A_IN          ( I2C_1_SCL_PAD_Y ),
        .I2C1_SDA_USBA_DATA3_MGPIO0A_IN          ( I2C_1_SDA_PAD_Y ),
        .MGPIO0B_IN                              ( GND_net ),
        .MGPIO10B_IN                             ( GND_net ),
        .MGPIO1B_IN                              ( GND_net ),
        .MGPIO25A_IN                             ( GND_net ),
        .MGPIO26A_IN                             ( GND_net ),
        .MGPIO27A_IN                             ( GND_net ),
        .MGPIO28A_IN                             ( GND_net ),
        .MGPIO29A_IN                             ( GND_net ),
        .MGPIO2B_IN                              ( GND_net ),
        .MGPIO30A_IN                             ( GND_net ),
        .MGPIO31A_IN                             ( GND_net ),
        .MGPIO3B_IN                              ( GND_net ),
        .MGPIO4B_IN                              ( GND_net ),
        .MGPIO5B_IN                              ( GND_net ),
        .MGPIO6B_IN                              ( GND_net ),
        .MGPIO7B_IN                              ( GND_net ),
        .MGPIO8B_IN                              ( GND_net ),
        .MGPIO9B_IN                              ( GND_net ),
        .MMUART0_CTS_USBC_DATA7_MGPIO19B_IN      ( GND_net ),
        .MMUART0_DCD_MGPIO22B_IN                 ( GND_net ),
        .MMUART0_DSR_MGPIO20B_IN                 ( GND_net ),
        .MMUART0_DTR_USBC_DATA6_MGPIO18B_IN      ( GND_net ),
        .MMUART0_RI_MGPIO21B_IN                  ( GND_net ),
        .MMUART0_RTS_USBC_DATA5_MGPIO17B_IN      ( GND_net ),
        .MMUART0_RXD_USBC_STP_MGPIO28B_IN        ( MMUART_0_RXD_PAD_Y ),
        .MMUART0_SCK_USBC_NXT_MGPIO29B_IN        ( GND_net ),
        .MMUART0_TXD_USBC_DIR_MGPIO27B_IN        ( GND_net ),
        .MMUART1_CTS_MGPIO13B_IN                 ( GND_net ),
        .MMUART1_DCD_MGPIO16B_IN                 ( GND_net ),
        .MMUART1_DSR_MGPIO14B_IN                 ( GND_net ),
        .MMUART1_DTR_MGPIO12B_IN                 ( GND_net ),
        .MMUART1_RI_MGPIO15B_IN                  ( GND_net ),
        .MMUART1_RTS_MGPIO11B_IN                 ( GND_net ),
        .MMUART1_RXD_USBC_DATA3_MGPIO26B_IN      ( MMUART_1_RXD_PAD_Y ),
        .MMUART1_SCK_USBC_DATA4_MGPIO25B_IN      ( GND_net ),
        .MMUART1_TXD_USBC_DATA2_MGPIO24B_IN      ( GND_net ),
        .RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_IN     ( GND_net ),
        .RGMII_MDC_RMII_MDC_IN                   ( GND_net ),
        .RGMII_MDIO_RMII_MDIO_USBB_DATA7_IN      ( GND_net ),
        .RGMII_RX_CLK_IN                         ( GND_net ),
        .RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_IN  ( GND_net ),
        .RGMII_RXD0_RMII_RXD0_USBB_DATA0_IN      ( GND_net ),
        .RGMII_RXD1_RMII_RXD1_USBB_DATA1_IN      ( GND_net ),
        .RGMII_RXD2_RMII_RX_ER_USBB_DATA3_IN     ( GND_net ),
        .RGMII_RXD3_USBB_DATA4_IN                ( GND_net ),
        .RGMII_TX_CLK_IN                         ( GND_net ),
        .RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_IN     ( GND_net ),
        .RGMII_TXD0_RMII_TXD0_USBB_DIR_IN        ( GND_net ),
        .RGMII_TXD1_RMII_TXD1_USBB_STP_IN        ( GND_net ),
        .RGMII_TXD2_USBB_DATA5_IN                ( GND_net ),
        .RGMII_TXD3_USBB_DATA6_IN                ( GND_net ),
        .SPI0_SCK_USBA_XCLK_IN                   ( SPI_0_CLK_PAD_Y ),
        .SPI0_SDI_USBA_DIR_MGPIO5A_IN            ( SPI_0_DI_PAD_Y ),
        .SPI0_SDO_USBA_STP_MGPIO6A_IN            ( GND_net ),
        .SPI0_SS0_USBA_NXT_MGPIO7A_IN            ( SPI_0_SS0_PAD_Y ),
        .SPI0_SS1_USBA_DATA5_MGPIO8A_IN          ( GND_net ),
        .SPI0_SS2_USBA_DATA6_MGPIO9A_IN          ( GND_net ),
        .SPI0_SS3_USBA_DATA7_MGPIO10A_IN         ( GND_net ),
        .SPI0_SS4_MGPIO19A_IN                    ( GND_net ),
        .SPI0_SS5_MGPIO20A_IN                    ( GND_net ),
        .SPI0_SS6_MGPIO21A_IN                    ( GND_net ),
        .SPI0_SS7_MGPIO22A_IN                    ( GND_net ),
        .SPI1_SCK_IN                             ( SPI_1_CLK_PAD_Y ),
        .SPI1_SDI_MGPIO11A_IN                    ( SPI_1_DI_PAD_Y ),
        .SPI1_SDO_MGPIO12A_IN                    ( GND_net ),
        .SPI1_SS0_MGPIO13A_IN                    ( SPI_1_SS0_PAD_Y ),
        .SPI1_SS1_MGPIO14A_IN                    ( GND_net ),
        .SPI1_SS2_MGPIO15A_IN                    ( GND_net ),
        .SPI1_SS3_MGPIO16A_IN                    ( GND_net ),
        .SPI1_SS4_MGPIO17A_IN                    ( GND_net ),
        .SPI1_SS5_MGPIO18A_IN                    ( GND_net ),
        .SPI1_SS6_MGPIO23A_IN                    ( GND_net ),
        .SPI1_SS7_MGPIO24A_IN                    ( GND_net ),
        .USBC_XCLK_IN                            ( GND_net ),
        .USBD_DATA0_IN                           ( GND_net ),
        .USBD_DATA1_IN                           ( GND_net ),
        .USBD_DATA2_IN                           ( GND_net ),
        .USBD_DATA3_IN                           ( GND_net ),
        .USBD_DATA4_IN                           ( GND_net ),
        .USBD_DATA5_IN                           ( GND_net ),
        .USBD_DATA6_IN                           ( GND_net ),
        .USBD_DATA7_MGPIO23B_IN                  ( GND_net ),
        .USBD_DIR_IN                             ( GND_net ),
        .USBD_NXT_IN                             ( GND_net ),
        .USBD_STP_IN                             ( GND_net ),
        .USBD_XCLK_IN                            ( GND_net ),
        // Outputs
        .CAN_RXBUS_MGPIO3A_H2F_A                 (  ),
        .CAN_RXBUS_MGPIO3A_H2F_B                 ( GPIO_3_M2F_net_0 ),
        .CAN_TX_EBL_MGPIO4A_H2F_A                (  ),
        .CAN_TX_EBL_MGPIO4A_H2F_B                (  ),
        .CAN_TXBUS_MGPIO2A_H2F_A                 (  ),
        .CAN_TXBUS_MGPIO2A_H2F_B                 ( GPIO_2_M2F_net_0 ),
        .CLK_CONFIG_APB                          ( FIC_2_APB_M_PCLK_0 ),
        .COMMS_INT                               (  ),
        .CONFIG_PRESET_N                         ( FIC_2_APB_M_PRESET_N_0 ),
        .EDAC_ERROR                              (  ),
        .F_FM0_RDATA                             (  ),
        .F_FM0_READYOUT                          (  ),
        .F_FM0_RESP                              (  ),
        .F_HM0_ADDR                              (  ),
        .F_HM0_ENABLE                            (  ),
        .F_HM0_SEL                               (  ),
        .F_HM0_SIZE                              (  ),
        .F_HM0_TRANS1                            (  ),
        .F_HM0_WDATA                             (  ),
        .F_HM0_WRITE                             (  ),
        .FAB_CHRGVBUS                            (  ),
        .FAB_DISCHRGVBUS                         (  ),
        .FAB_DMPULLDOWN                          (  ),
        .FAB_DPPULLDOWN                          (  ),
        .FAB_DRVVBUS                             (  ),
        .FAB_IDPULLUP                            (  ),
        .FAB_OPMODE                              (  ),
        .FAB_SUSPENDM                            (  ),
        .FAB_TERMSEL                             (  ),
        .FAB_TXVALID                             (  ),
        .FAB_VCONTROL                            (  ),
        .FAB_VCONTROLLOADM                       (  ),
        .FAB_XCVRSEL                             (  ),
        .FAB_XDATAOUT                            (  ),
        .FACC_GLMUX_SEL                          (  ),
        .FIC32_0_MASTER                          (  ),
        .FIC32_1_MASTER                          (  ),
        .FPGA_RESET_N                            ( MSS_RESET_N_M2F_net_0 ),
        .GTX_CLK                                 (  ),
        .H2F_INTERRUPT                           (  ),
        .H2F_NMI                                 (  ),
        .H2FCALIB                                (  ),
        .I2C0_SCL_MGPIO31B_H2F_A                 (  ),
        .I2C0_SCL_MGPIO31B_H2F_B                 (  ),
        .I2C0_SDA_MGPIO30B_H2F_A                 (  ),
        .I2C0_SDA_MGPIO30B_H2F_B                 (  ),
        .I2C1_SCL_MGPIO1A_H2F_A                  (  ),
        .I2C1_SCL_MGPIO1A_H2F_B                  ( GPIO_1_M2F_net_0 ),
        .I2C1_SDA_MGPIO0A_H2F_A                  (  ),
        .I2C1_SDA_MGPIO0A_H2F_B                  ( GPIO_0_M2F_net_0 ),
        .MDCF                                    (  ),
        .MDOENF                                  (  ),
        .MDOF                                    (  ),
        .MMUART0_CTS_MGPIO19B_H2F_A              (  ),
        .MMUART0_CTS_MGPIO19B_H2F_B              (  ),
        .MMUART0_DCD_MGPIO22B_H2F_A              (  ),
        .MMUART0_DCD_MGPIO22B_H2F_B              (  ),
        .MMUART0_DSR_MGPIO20B_H2F_A              (  ),
        .MMUART0_DSR_MGPIO20B_H2F_B              (  ),
        .MMUART0_DTR_MGPIO18B_H2F_A              (  ),
        .MMUART0_DTR_MGPIO18B_H2F_B              (  ),
        .MMUART0_RI_MGPIO21B_H2F_A               (  ),
        .MMUART0_RI_MGPIO21B_H2F_B               (  ),
        .MMUART0_RTS_MGPIO17B_H2F_A              (  ),
        .MMUART0_RTS_MGPIO17B_H2F_B              (  ),
        .MMUART0_RXD_MGPIO28B_H2F_A              (  ),
        .MMUART0_RXD_MGPIO28B_H2F_B              (  ),
        .MMUART0_SCK_MGPIO29B_H2F_A              (  ),
        .MMUART0_SCK_MGPIO29B_H2F_B              (  ),
        .MMUART0_TXD_MGPIO27B_H2F_A              (  ),
        .MMUART0_TXD_MGPIO27B_H2F_B              (  ),
        .MMUART1_DTR_MGPIO12B_H2F_A              (  ),
        .MMUART1_RTS_MGPIO11B_H2F_A              (  ),
        .MMUART1_RTS_MGPIO11B_H2F_B              (  ),
        .MMUART1_RXD_MGPIO26B_H2F_A              (  ),
        .MMUART1_RXD_MGPIO26B_H2F_B              (  ),
        .MMUART1_SCK_MGPIO25B_H2F_A              (  ),
        .MMUART1_SCK_MGPIO25B_H2F_B              (  ),
        .MMUART1_TXD_MGPIO24B_H2F_A              (  ),
        .MMUART1_TXD_MGPIO24B_H2F_B              (  ),
        .MPLL_LOCK                               (  ),
        .PER2_FABRIC_PADDR                       ( FIC_2_APB_MASTER_0_PADDR ),
        .PER2_FABRIC_PENABLE                     ( FIC_2_APB_MASTER_0_PENABLE ),
        .PER2_FABRIC_PSEL                        ( FIC_2_APB_MASTER_0_PSELx ),
        .PER2_FABRIC_PWDATA                      ( FIC_2_APB_MASTER_0_PWDATA ),
        .PER2_FABRIC_PWRITE                      ( FIC_2_APB_MASTER_0_PWRITE ),
        .RTC_MATCH                               (  ),
        .SLEEPDEEP                               (  ),
        .SLEEPHOLDACK                            (  ),
        .SLEEPING                                (  ),
        .SMBALERT_NO0                            (  ),
        .SMBALERT_NO1                            (  ),
        .SMBSUS_NO0                              (  ),
        .SMBSUS_NO1                              (  ),
        .SPI0_CLK_OUT                            (  ),
        .SPI0_SDI_MGPIO5A_H2F_A                  (  ),
        .SPI0_SDI_MGPIO5A_H2F_B                  (  ),
        .SPI0_SDO_MGPIO6A_H2F_A                  (  ),
        .SPI0_SDO_MGPIO6A_H2F_B                  (  ),
        .SPI0_SS0_MGPIO7A_H2F_A                  (  ),
        .SPI0_SS0_MGPIO7A_H2F_B                  (  ),
        .SPI0_SS1_MGPIO8A_H2F_A                  (  ),
        .SPI0_SS1_MGPIO8A_H2F_B                  (  ),
        .SPI0_SS2_MGPIO9A_H2F_A                  (  ),
        .SPI0_SS2_MGPIO9A_H2F_B                  (  ),
        .SPI0_SS3_MGPIO10A_H2F_A                 (  ),
        .SPI0_SS3_MGPIO10A_H2F_B                 (  ),
        .SPI0_SS4_MGPIO19A_H2F_A                 (  ),
        .SPI0_SS5_MGPIO20A_H2F_A                 (  ),
        .SPI0_SS6_MGPIO21A_H2F_A                 (  ),
        .SPI0_SS7_MGPIO22A_H2F_A                 (  ),
        .SPI1_CLK_OUT                            (  ),
        .SPI1_SDI_MGPIO11A_H2F_A                 (  ),
        .SPI1_SDI_MGPIO11A_H2F_B                 (  ),
        .SPI1_SDO_MGPIO12A_H2F_A                 (  ),
        .SPI1_SDO_MGPIO12A_H2F_B                 (  ),
        .SPI1_SS0_MGPIO13A_H2F_A                 (  ),
        .SPI1_SS0_MGPIO13A_H2F_B                 (  ),
        .SPI1_SS1_MGPIO14A_H2F_A                 (  ),
        .SPI1_SS1_MGPIO14A_H2F_B                 (  ),
        .SPI1_SS2_MGPIO15A_H2F_A                 (  ),
        .SPI1_SS2_MGPIO15A_H2F_B                 (  ),
        .SPI1_SS3_MGPIO16A_H2F_A                 (  ),
        .SPI1_SS3_MGPIO16A_H2F_B                 (  ),
        .SPI1_SS4_MGPIO17A_H2F_A                 (  ),
        .SPI1_SS5_MGPIO18A_H2F_A                 (  ),
        .SPI1_SS6_MGPIO23A_H2F_A                 (  ),
        .SPI1_SS7_MGPIO24A_H2F_A                 (  ),
        .TCGF                                    (  ),
        .TRACECLK                                (  ),
        .TRACEDATA                               (  ),
        .TX_CLK                                  (  ),
        .TX_ENF                                  (  ),
        .TX_ERRF                                 (  ),
        .TXCTL_EN_RIF                            (  ),
        .TXD_RIF                                 (  ),
        .TXDF                                    (  ),
        .TXEV                                    (  ),
        .WDOGTIMEOUT                             (  ),
        .F_ARREADY_HREADYOUT1                    (  ),
        .F_AWREADY_HREADYOUT0                    (  ),
        .F_BID                                   (  ),
        .F_BRESP_HRESP0                          (  ),
        .F_BVALID                                (  ),
        .F_RDATA_HRDATA01                        (  ),
        .F_RID                                   (  ),
        .F_RLAST                                 (  ),
        .F_RRESP_HRESP1                          (  ),
        .F_RVALID                                (  ),
        .F_WREADY                                (  ),
        .MDDR_FABRIC_PRDATA                      ( MDDR_APB_SLAVE_PRDATA ),
        .MDDR_FABRIC_PREADY                      ( MDDR_APB_SLAVE_PREADY ),
        .MDDR_FABRIC_PSLVERR                     ( MDDR_APB_SLAVE_PSLVERR ),
        .CAN_RXBUS_USBA_DATA1_MGPIO3A_OUT        (  ),
        .CAN_TX_EBL_USBA_DATA2_MGPIO4A_OUT       (  ),
        .CAN_TXBUS_USBA_DATA0_MGPIO2A_OUT        (  ),
        .DRAM_ADDR                               ( DRAM_ADDR_net_0 ),
        .DRAM_BA                                 ( DRAM_BA_net_0 ),
        .DRAM_CASN                               ( MSS_ADLIB_INST_DRAM_CASN ),
        .DRAM_CKE                                ( MSS_ADLIB_INST_DRAM_CKE ),
        .DRAM_CLK                                ( MSS_ADLIB_INST_DRAM_CLK ),
        .DRAM_CSN                                ( MSS_ADLIB_INST_DRAM_CSN ),
        .DRAM_DM_RDQS_OUT                        ( DRAM_DM_RDQS_OUT_net_0 ),
        .DRAM_DQ_OUT                             ( DRAM_DQ_OUT_net_0 ),
        .DRAM_DQS_OUT                            ( DRAM_DQS_OUT_net_0 ),
        .DRAM_FIFO_WE_OUT                        ( DRAM_FIFO_WE_OUT_net_0 ),
        .DRAM_ODT                                ( MSS_ADLIB_INST_DRAM_ODT ),
        .DRAM_RASN                               ( MSS_ADLIB_INST_DRAM_RASN ),
        .DRAM_RSTN                               ( MSS_ADLIB_INST_DRAM_RSTN ),
        .DRAM_WEN                                ( MSS_ADLIB_INST_DRAM_WEN ),
        .I2C0_SCL_USBC_DATA1_MGPIO31B_OUT        ( MSS_ADLIB_INST_I2C0_SCL_USBC_DATA1_MGPIO31B_OUT ),
        .I2C0_SDA_USBC_DATA0_MGPIO30B_OUT        ( MSS_ADLIB_INST_I2C0_SDA_USBC_DATA0_MGPIO30B_OUT ),
        .I2C1_SCL_USBA_DATA4_MGPIO1A_OUT         ( MSS_ADLIB_INST_I2C1_SCL_USBA_DATA4_MGPIO1A_OUT ),
        .I2C1_SDA_USBA_DATA3_MGPIO0A_OUT         ( MSS_ADLIB_INST_I2C1_SDA_USBA_DATA3_MGPIO0A_OUT ),
        .MGPIO0B_OUT                             (  ),
        .MGPIO10B_OUT                            (  ),
        .MGPIO1B_OUT                             (  ),
        .MGPIO25A_OUT                            (  ),
        .MGPIO26A_OUT                            (  ),
        .MGPIO27A_OUT                            (  ),
        .MGPIO28A_OUT                            (  ),
        .MGPIO29A_OUT                            (  ),
        .MGPIO2B_OUT                             (  ),
        .MGPIO30A_OUT                            (  ),
        .MGPIO31A_OUT                            (  ),
        .MGPIO3B_OUT                             (  ),
        .MGPIO4B_OUT                             (  ),
        .MGPIO5B_OUT                             (  ),
        .MGPIO6B_OUT                             (  ),
        .MGPIO7B_OUT                             (  ),
        .MGPIO8B_OUT                             (  ),
        .MGPIO9B_OUT                             (  ),
        .MMUART0_CTS_USBC_DATA7_MGPIO19B_OUT     (  ),
        .MMUART0_DCD_MGPIO22B_OUT                (  ),
        .MMUART0_DSR_MGPIO20B_OUT                (  ),
        .MMUART0_DTR_USBC_DATA6_MGPIO18B_OUT     (  ),
        .MMUART0_RI_MGPIO21B_OUT                 (  ),
        .MMUART0_RTS_USBC_DATA5_MGPIO17B_OUT     (  ),
        .MMUART0_RXD_USBC_STP_MGPIO28B_OUT       (  ),
        .MMUART0_SCK_USBC_NXT_MGPIO29B_OUT       (  ),
        .MMUART0_TXD_USBC_DIR_MGPIO27B_OUT       ( MSS_ADLIB_INST_MMUART0_TXD_USBC_DIR_MGPIO27B_OUT ),
        .MMUART1_CTS_MGPIO13B_OUT                (  ),
        .MMUART1_DCD_MGPIO16B_OUT                (  ),
        .MMUART1_DSR_MGPIO14B_OUT                (  ),
        .MMUART1_DTR_MGPIO12B_OUT                (  ),
        .MMUART1_RI_MGPIO15B_OUT                 (  ),
        .MMUART1_RTS_MGPIO11B_OUT                (  ),
        .MMUART1_RXD_USBC_DATA3_MGPIO26B_OUT     (  ),
        .MMUART1_SCK_USBC_DATA4_MGPIO25B_OUT     (  ),
        .MMUART1_TXD_USBC_DATA2_MGPIO24B_OUT     ( MSS_ADLIB_INST_MMUART1_TXD_USBC_DATA2_MGPIO24B_OUT ),
        .RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_OUT    (  ),
        .RGMII_MDC_RMII_MDC_OUT                  (  ),
        .RGMII_MDIO_RMII_MDIO_USBB_DATA7_OUT     (  ),
        .RGMII_RX_CLK_OUT                        (  ),
        .RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OUT (  ),
        .RGMII_RXD0_RMII_RXD0_USBB_DATA0_OUT     (  ),
        .RGMII_RXD1_RMII_RXD1_USBB_DATA1_OUT     (  ),
        .RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OUT    (  ),
        .RGMII_RXD3_USBB_DATA4_OUT               (  ),
        .RGMII_TX_CLK_OUT                        (  ),
        .RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_OUT    (  ),
        .RGMII_TXD0_RMII_TXD0_USBB_DIR_OUT       (  ),
        .RGMII_TXD1_RMII_TXD1_USBB_STP_OUT       (  ),
        .RGMII_TXD2_USBB_DATA5_OUT               (  ),
        .RGMII_TXD3_USBB_DATA6_OUT               (  ),
        .SPI0_SCK_USBA_XCLK_OUT                  ( MSS_ADLIB_INST_SPI0_SCK_USBA_XCLK_OUT ),
        .SPI0_SDI_USBA_DIR_MGPIO5A_OUT           (  ),
        .SPI0_SDO_USBA_STP_MGPIO6A_OUT           ( MSS_ADLIB_INST_SPI0_SDO_USBA_STP_MGPIO6A_OUT ),
        .SPI0_SS0_USBA_NXT_MGPIO7A_OUT           ( MSS_ADLIB_INST_SPI0_SS0_USBA_NXT_MGPIO7A_OUT ),
        .SPI0_SS1_USBA_DATA5_MGPIO8A_OUT         (  ),
        .SPI0_SS2_USBA_DATA6_MGPIO9A_OUT         (  ),
        .SPI0_SS3_USBA_DATA7_MGPIO10A_OUT        (  ),
        .SPI0_SS4_MGPIO19A_OUT                   (  ),
        .SPI0_SS5_MGPIO20A_OUT                   (  ),
        .SPI0_SS6_MGPIO21A_OUT                   (  ),
        .SPI0_SS7_MGPIO22A_OUT                   (  ),
        .SPI1_SCK_OUT                            ( MSS_ADLIB_INST_SPI1_SCK_OUT ),
        .SPI1_SDI_MGPIO11A_OUT                   (  ),
        .SPI1_SDO_MGPIO12A_OUT                   ( MSS_ADLIB_INST_SPI1_SDO_MGPIO12A_OUT ),
        .SPI1_SS0_MGPIO13A_OUT                   ( MSS_ADLIB_INST_SPI1_SS0_MGPIO13A_OUT ),
        .SPI1_SS1_MGPIO14A_OUT                   (  ),
        .SPI1_SS2_MGPIO15A_OUT                   (  ),
        .SPI1_SS3_MGPIO16A_OUT                   (  ),
        .SPI1_SS4_MGPIO17A_OUT                   (  ),
        .SPI1_SS5_MGPIO18A_OUT                   (  ),
        .SPI1_SS6_MGPIO23A_OUT                   (  ),
        .SPI1_SS7_MGPIO24A_OUT                   (  ),
        .USBC_XCLK_OUT                           (  ),
        .USBD_DATA0_OUT                          (  ),
        .USBD_DATA1_OUT                          (  ),
        .USBD_DATA2_OUT                          (  ),
        .USBD_DATA3_OUT                          (  ),
        .USBD_DATA4_OUT                          (  ),
        .USBD_DATA5_OUT                          (  ),
        .USBD_DATA6_OUT                          (  ),
        .USBD_DATA7_MGPIO23B_OUT                 (  ),
        .USBD_DIR_OUT                            (  ),
        .USBD_NXT_OUT                            (  ),
        .USBD_STP_OUT                            (  ),
        .USBD_XCLK_OUT                           (  ),
        .CAN_RXBUS_USBA_DATA1_MGPIO3A_OE         (  ),
        .CAN_TX_EBL_USBA_DATA2_MGPIO4A_OE        (  ),
        .CAN_TXBUS_USBA_DATA0_MGPIO2A_OE         (  ),
        .DM_OE                                   ( DM_OE_net_0 ),
        .DRAM_DQ_OE                              ( DRAM_DQ_OE_net_0 ),
        .DRAM_DQS_OE                             ( DRAM_DQS_OE_net_0 ),
        .I2C0_SCL_USBC_DATA1_MGPIO31B_OE         ( MSS_ADLIB_INST_I2C0_SCL_USBC_DATA1_MGPIO31B_OE ),
        .I2C0_SDA_USBC_DATA0_MGPIO30B_OE         ( MSS_ADLIB_INST_I2C0_SDA_USBC_DATA0_MGPIO30B_OE ),
        .I2C1_SCL_USBA_DATA4_MGPIO1A_OE          ( MSS_ADLIB_INST_I2C1_SCL_USBA_DATA4_MGPIO1A_OE ),
        .I2C1_SDA_USBA_DATA3_MGPIO0A_OE          ( MSS_ADLIB_INST_I2C1_SDA_USBA_DATA3_MGPIO0A_OE ),
        .MGPIO0B_OE                              (  ),
        .MGPIO10B_OE                             (  ),
        .MGPIO1B_OE                              (  ),
        .MGPIO25A_OE                             (  ),
        .MGPIO26A_OE                             (  ),
        .MGPIO27A_OE                             (  ),
        .MGPIO28A_OE                             (  ),
        .MGPIO29A_OE                             (  ),
        .MGPIO2B_OE                              (  ),
        .MGPIO30A_OE                             (  ),
        .MGPIO31A_OE                             (  ),
        .MGPIO3B_OE                              (  ),
        .MGPIO4B_OE                              (  ),
        .MGPIO5B_OE                              (  ),
        .MGPIO6B_OE                              (  ),
        .MGPIO7B_OE                              (  ),
        .MGPIO8B_OE                              (  ),
        .MGPIO9B_OE                              (  ),
        .MMUART0_CTS_USBC_DATA7_MGPIO19B_OE      (  ),
        .MMUART0_DCD_MGPIO22B_OE                 (  ),
        .MMUART0_DSR_MGPIO20B_OE                 (  ),
        .MMUART0_DTR_USBC_DATA6_MGPIO18B_OE      (  ),
        .MMUART0_RI_MGPIO21B_OE                  (  ),
        .MMUART0_RTS_USBC_DATA5_MGPIO17B_OE      (  ),
        .MMUART0_RXD_USBC_STP_MGPIO28B_OE        (  ),
        .MMUART0_SCK_USBC_NXT_MGPIO29B_OE        (  ),
        .MMUART0_TXD_USBC_DIR_MGPIO27B_OE        ( MSS_ADLIB_INST_MMUART0_TXD_USBC_DIR_MGPIO27B_OE ),
        .MMUART1_CTS_MGPIO13B_OE                 (  ),
        .MMUART1_DCD_MGPIO16B_OE                 (  ),
        .MMUART1_DSR_MGPIO14B_OE                 (  ),
        .MMUART1_DTR_MGPIO12B_OE                 (  ),
        .MMUART1_RI_MGPIO15B_OE                  (  ),
        .MMUART1_RTS_MGPIO11B_OE                 (  ),
        .MMUART1_RXD_USBC_DATA3_MGPIO26B_OE      (  ),
        .MMUART1_SCK_USBC_DATA4_MGPIO25B_OE      (  ),
        .MMUART1_TXD_USBC_DATA2_MGPIO24B_OE      ( MSS_ADLIB_INST_MMUART1_TXD_USBC_DATA2_MGPIO24B_OE ),
        .RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_OE     (  ),
        .RGMII_MDC_RMII_MDC_OE                   (  ),
        .RGMII_MDIO_RMII_MDIO_USBB_DATA7_OE      (  ),
        .RGMII_RX_CLK_OE                         (  ),
        .RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OE  (  ),
        .RGMII_RXD0_RMII_RXD0_USBB_DATA0_OE      (  ),
        .RGMII_RXD1_RMII_RXD1_USBB_DATA1_OE      (  ),
        .RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OE     (  ),
        .RGMII_RXD3_USBB_DATA4_OE                (  ),
        .RGMII_TX_CLK_OE                         (  ),
        .RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_OE     (  ),
        .RGMII_TXD0_RMII_TXD0_USBB_DIR_OE        (  ),
        .RGMII_TXD1_RMII_TXD1_USBB_STP_OE        (  ),
        .RGMII_TXD2_USBB_DATA5_OE                (  ),
        .RGMII_TXD3_USBB_DATA6_OE                (  ),
        .SPI0_SCK_USBA_XCLK_OE                   ( MSS_ADLIB_INST_SPI0_SCK_USBA_XCLK_OE ),
        .SPI0_SDI_USBA_DIR_MGPIO5A_OE            (  ),
        .SPI0_SDO_USBA_STP_MGPIO6A_OE            ( MSS_ADLIB_INST_SPI0_SDO_USBA_STP_MGPIO6A_OE ),
        .SPI0_SS0_USBA_NXT_MGPIO7A_OE            ( MSS_ADLIB_INST_SPI0_SS0_USBA_NXT_MGPIO7A_OE ),
        .SPI0_SS1_USBA_DATA5_MGPIO8A_OE          (  ),
        .SPI0_SS2_USBA_DATA6_MGPIO9A_OE          (  ),
        .SPI0_SS3_USBA_DATA7_MGPIO10A_OE         (  ),
        .SPI0_SS4_MGPIO19A_OE                    (  ),
        .SPI0_SS5_MGPIO20A_OE                    (  ),
        .SPI0_SS6_MGPIO21A_OE                    (  ),
        .SPI0_SS7_MGPIO22A_OE                    (  ),
        .SPI1_SCK_OE                             ( MSS_ADLIB_INST_SPI1_SCK_OE ),
        .SPI1_SDI_MGPIO11A_OE                    (  ),
        .SPI1_SDO_MGPIO12A_OE                    ( MSS_ADLIB_INST_SPI1_SDO_MGPIO12A_OE ),
        .SPI1_SS0_MGPIO13A_OE                    ( MSS_ADLIB_INST_SPI1_SS0_MGPIO13A_OE ),
        .SPI1_SS1_MGPIO14A_OE                    (  ),
        .SPI1_SS2_MGPIO15A_OE                    (  ),
        .SPI1_SS3_MGPIO16A_OE                    (  ),
        .SPI1_SS4_MGPIO17A_OE                    (  ),
        .SPI1_SS5_MGPIO18A_OE                    (  ),
        .SPI1_SS6_MGPIO23A_OE                    (  ),
        .SPI1_SS7_MGPIO24A_OE                    (  ),
        .USBC_XCLK_OE                            (  ),
        .USBD_DATA0_OE                           (  ),
        .USBD_DATA1_OE                           (  ),
        .USBD_DATA2_OE                           (  ),
        .USBD_DATA3_OE                           (  ),
        .USBD_DATA4_OE                           (  ),
        .USBD_DATA5_OE                           (  ),
        .USBD_DATA6_OE                           (  ),
        .USBD_DATA7_MGPIO23B_OE                  (  ),
        .USBD_DIR_OE                             (  ),
        .USBD_NXT_OE                             (  ),
        .USBD_STP_OE                             (  ),
        .USBD_XCLK_OE                            (  ) 
        );

//--------BIBUF
BIBUF SPI_0_CLK_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI0_SCK_USBA_XCLK_OUT ),
        .E   ( MSS_ADLIB_INST_SPI0_SCK_USBA_XCLK_OE ),
        // Outputs
        .Y   ( SPI_0_CLK_PAD_Y ),
        // Inouts
        .PAD ( SPI_0_CLK ) 
        );

//--------INBUF
INBUF SPI_0_DI_PAD(
        // Inputs
        .PAD ( SPI_0_DI ),
        // Outputs
        .Y   ( SPI_0_DI_PAD_Y ) 
        );

//--------TRIBUFF
TRIBUFF SPI_0_DO_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI0_SDO_USBA_STP_MGPIO6A_OUT ),
        .E   ( MSS_ADLIB_INST_SPI0_SDO_USBA_STP_MGPIO6A_OE ),
        // Outputs
        .PAD ( SPI_0_DO_net_0 ) 
        );

//--------BIBUF
BIBUF SPI_0_SS0_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI0_SS0_USBA_NXT_MGPIO7A_OUT ),
        .E   ( MSS_ADLIB_INST_SPI0_SS0_USBA_NXT_MGPIO7A_OE ),
        // Outputs
        .Y   ( SPI_0_SS0_PAD_Y ),
        // Inouts
        .PAD ( SPI_0_SS0 ) 
        );

//--------BIBUF
BIBUF SPI_1_CLK_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI1_SCK_OUT ),
        .E   ( MSS_ADLIB_INST_SPI1_SCK_OE ),
        // Outputs
        .Y   ( SPI_1_CLK_PAD_Y ),
        // Inouts
        .PAD ( SPI_1_CLK ) 
        );

//--------INBUF
INBUF SPI_1_DI_PAD(
        // Inputs
        .PAD ( SPI_1_DI ),
        // Outputs
        .Y   ( SPI_1_DI_PAD_Y ) 
        );

//--------TRIBUFF
TRIBUFF SPI_1_DO_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI1_SDO_MGPIO12A_OUT ),
        .E   ( MSS_ADLIB_INST_SPI1_SDO_MGPIO12A_OE ),
        // Outputs
        .PAD ( SPI_1_DO_net_0 ) 
        );

//--------BIBUF
BIBUF SPI_1_SS0_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI1_SS0_MGPIO13A_OUT ),
        .E   ( MSS_ADLIB_INST_SPI1_SS0_MGPIO13A_OE ),
        // Outputs
        .Y   ( SPI_1_SS0_PAD_Y ),
        // Inouts
        .PAD ( SPI_1_SS0 ) 
        );


endmodule
