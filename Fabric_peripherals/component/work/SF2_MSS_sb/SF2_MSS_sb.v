//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon Feb 06 12:29:53 2017
// Version: v11.7 11.7.0.119
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// SF2_MSS_sb
module SF2_MSS_sb(
    // Inputs
    DEVRST_N,
    FAB_RESET_N,
    MMUART_0_RXD,
    RX,
    SPI_0_DI,
    // Outputs
    FAB_CCC_GL0,
    FAB_CCC_LOCK,
    GPIO_0_M2F,
    INIT_DONE,
    MMUART_0_TXD,
    MSS_READY,
    POWER_ON_RESET_N,
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
input  FAB_RESET_N;
input  MMUART_0_RXD;
input  RX;
input  SPI_0_DI;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output FAB_CCC_GL0;
output FAB_CCC_LOCK;
output GPIO_0_M2F;
output INIT_DONE;
output MMUART_0_TXD;
output MSS_READY;
output POWER_ON_RESET_N;
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
wire          BIBUF_COREI2C_0_0_SCL_IO_Y;
wire          BIBUF_COREI2C_0_0_SDA_IO_Y;
wire          CoreAPB3_0_APBmslave0_PENABLE;
wire          CoreAPB3_0_APBmslave0_PREADY;
wire          CoreAPB3_0_APBmslave0_PSELx;
wire          CoreAPB3_0_APBmslave0_PSLVERR;
wire          CoreAPB3_0_APBmslave0_PWRITE;
wire          CoreAPB3_0_APBmslave1_PSELx;
wire   [0:0]  COREI2C_0_0_INT;
wire          COREI2C_0_0_SCL_IO;
wire   [0:0]  COREI2C_0_0_SCLO;
wire          COREI2C_0_0_SDA_IO;
wire   [0:0]  COREI2C_0_0_SDAO;
wire          CORERESETP_0_RESET_N_F2M;
wire          CoreUARTapb_0_0_FRAMING_ERR;
wire          CoreUARTapb_0_0_intr_or_0_Y;
wire          CoreUARTapb_0_0_intr_or_1_Y;
wire          CoreUARTapb_0_0_intr_or_2_Y;
wire          CoreUARTapb_0_0_OVERFLOW;
wire          CoreUARTapb_0_0_PARITY_ERR;
wire          CoreUARTapb_0_0_RXRDY;
wire          CoreUARTapb_0_0_TXRDY;
wire          DEVRST_N;
wire          FAB_CCC_GL0_net_0;
wire          FAB_CCC_LOCK_net_0;
wire          FAB_RESET_N;
wire          FABOSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC;
wire          FABOSC_0_RCOSC_25_50MHZ_O2F;
wire          GPIO_0_M2F_net_0;
wire          I2C_0_SCL;
wire          I2C_0_SDA;
wire          INIT_DONE_net_0;
wire          MMUART_0_RXD;
wire          MMUART_0_TXD_net_0;
wire          MSS_READY_net_0;
wire          POWER_ON_RESET_N_net_0;
wire          RX;
wire   [31:0] SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PADDR;
wire          SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PENABLE;
wire   [31:0] SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PRDATA;
wire          SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PREADY;
wire          SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PSELx;
wire          SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PSLVERR;
wire   [31:0] SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PWDATA;
wire          SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PWRITE;
wire          SF2_MSS_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N;
wire          SF2_MSS_sb_MSS_TMP_0_MSS_RESET_N_M2F;
wire          SPI_0_CLK;
wire          SPI_0_DI;
wire          SPI_0_DO_net_0;
wire          SPI_0_SS0;
wire          TX_net_0;
wire          SPI_0_DO_net_1;
wire          MMUART_0_TXD_net_1;
wire          POWER_ON_RESET_N_net_1;
wire          INIT_DONE_net_1;
wire          FAB_CCC_GL0_net_1;
wire          FAB_CCC_LOCK_net_1;
wire          MSS_READY_net_1;
wire          TX_net_1;
wire          GPIO_0_M2F_net_1;
wire   [15:0] MSS_INT_F2M_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire          VCC_net;
wire   [7:2]  PADDR_const_net_0;
wire   [7:0]  PWDATA_const_net_0;
wire   [31:0] IADDR_const_net_0;
wire   [31:0] SDIF0_PRDATA_const_net_0;
wire   [31:0] SDIF1_PRDATA_const_net_0;
wire   [31:0] SDIF2_PRDATA_const_net_0;
wire   [31:0] SDIF3_PRDATA_const_net_0;
wire   [31:0] PRDATAS2_const_net_0;
wire   [31:0] PRDATAS3_const_net_0;
wire   [31:0] PRDATAS4_const_net_0;
wire   [31:0] PRDATAS5_const_net_0;
wire   [31:0] PRDATAS6_const_net_0;
wire   [31:0] PRDATAS7_const_net_0;
wire   [31:0] PRDATAS8_const_net_0;
wire   [31:0] PRDATAS9_const_net_0;
wire   [31:0] PRDATAS10_const_net_0;
wire   [31:0] PRDATAS11_const_net_0;
wire   [31:0] PRDATAS12_const_net_0;
wire   [31:0] PRDATAS13_const_net_0;
wire   [31:0] PRDATAS14_const_net_0;
wire   [31:0] PRDATAS15_const_net_0;
wire   [31:0] PRDATAS16_const_net_0;
wire   [31:0] FIC_2_APB_M_PRDATA_const_net_0;
//--------------------------------------------------------------------
// Inverted Nets
//--------------------------------------------------------------------
wire          E_IN_POST_INV0_0;
wire          E_IN_POST_INV1_0;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [4:0]  CoreAPB3_0_APBmslave0_PADDR_0_4to0;
wire   [4:0]  CoreAPB3_0_APBmslave0_PADDR_0;
wire   [8:0]  CoreAPB3_0_APBmslave0_PADDR_1_8to0;
wire   [8:0]  CoreAPB3_0_APBmslave0_PADDR_1;
wire   [31:0] CoreAPB3_0_APBmslave0_PADDR;
wire   [7:0]  CoreAPB3_0_APBmslave0_PRDATA;
wire   [31:8] CoreAPB3_0_APBmslave0_PRDATA_0_31to8;
wire   [7:0]  CoreAPB3_0_APBmslave0_PRDATA_0_7to0;
wire   [31:0] CoreAPB3_0_APBmslave0_PRDATA_0;
wire   [7:0]  CoreAPB3_0_APBmslave0_PWDATA_0_7to0;
wire   [7:0]  CoreAPB3_0_APBmslave0_PWDATA_0;
wire   [7:0]  CoreAPB3_0_APBmslave0_PWDATA_1_7to0;
wire   [7:0]  CoreAPB3_0_APBmslave0_PWDATA_1;
wire   [31:0] CoreAPB3_0_APBmslave0_PWDATA;
wire   [7:0]  CoreAPB3_0_APBmslave1_PRDATA;
wire   [31:8] CoreAPB3_0_APBmslave1_PRDATA_0_31to8;
wire   [7:0]  CoreAPB3_0_APBmslave1_PRDATA_0_7to0;
wire   [31:0] CoreAPB3_0_APBmslave1_PRDATA_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                        = 1'b0;
assign VCC_net                        = 1'b1;
assign PADDR_const_net_0              = 6'h00;
assign PWDATA_const_net_0             = 8'h00;
assign IADDR_const_net_0              = 32'h00000000;
assign SDIF0_PRDATA_const_net_0       = 32'h00000000;
assign SDIF1_PRDATA_const_net_0       = 32'h00000000;
assign SDIF2_PRDATA_const_net_0       = 32'h00000000;
assign SDIF3_PRDATA_const_net_0       = 32'h00000000;
assign PRDATAS2_const_net_0           = 32'h00000000;
assign PRDATAS3_const_net_0           = 32'h00000000;
assign PRDATAS4_const_net_0           = 32'h00000000;
assign PRDATAS5_const_net_0           = 32'h00000000;
assign PRDATAS6_const_net_0           = 32'h00000000;
assign PRDATAS7_const_net_0           = 32'h00000000;
assign PRDATAS8_const_net_0           = 32'h00000000;
assign PRDATAS9_const_net_0           = 32'h00000000;
assign PRDATAS10_const_net_0          = 32'h00000000;
assign PRDATAS11_const_net_0          = 32'h00000000;
assign PRDATAS12_const_net_0          = 32'h00000000;
assign PRDATAS13_const_net_0          = 32'h00000000;
assign PRDATAS14_const_net_0          = 32'h00000000;
assign PRDATAS15_const_net_0          = 32'h00000000;
assign PRDATAS16_const_net_0          = 32'h00000000;
assign FIC_2_APB_M_PRDATA_const_net_0 = 32'h00000000;
//--------------------------------------------------------------------
// Inversions
//--------------------------------------------------------------------
assign E_IN_POST_INV0_0 = ~ COREI2C_0_0_SCLO[0];
assign E_IN_POST_INV1_0 = ~ COREI2C_0_0_SDAO[0];
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign SPI_0_DO_net_1         = SPI_0_DO_net_0;
assign SPI_0_DO               = SPI_0_DO_net_1;
assign MMUART_0_TXD_net_1     = MMUART_0_TXD_net_0;
assign MMUART_0_TXD           = MMUART_0_TXD_net_1;
assign POWER_ON_RESET_N_net_1 = POWER_ON_RESET_N_net_0;
assign POWER_ON_RESET_N       = POWER_ON_RESET_N_net_1;
assign INIT_DONE_net_1        = INIT_DONE_net_0;
assign INIT_DONE              = INIT_DONE_net_1;
assign FAB_CCC_GL0_net_1      = FAB_CCC_GL0_net_0;
assign FAB_CCC_GL0            = FAB_CCC_GL0_net_1;
assign FAB_CCC_LOCK_net_1     = FAB_CCC_LOCK_net_0;
assign FAB_CCC_LOCK           = FAB_CCC_LOCK_net_1;
assign MSS_READY_net_1        = MSS_READY_net_0;
assign MSS_READY              = MSS_READY_net_1;
assign TX_net_1               = TX_net_0;
assign TX                     = TX_net_1;
assign GPIO_0_M2F_net_1       = GPIO_0_M2F_net_0;
assign GPIO_0_M2F             = GPIO_0_M2F_net_1;
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign MSS_INT_F2M_net_0 = { 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , CoreUARTapb_0_0_intr_or_2_Y , COREI2C_0_0_INT[0] };
//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign CoreAPB3_0_APBmslave0_PADDR_0_4to0 = CoreAPB3_0_APBmslave0_PADDR[4:0];
assign CoreAPB3_0_APBmslave0_PADDR_0 = { CoreAPB3_0_APBmslave0_PADDR_0_4to0 };
assign CoreAPB3_0_APBmslave0_PADDR_1_8to0 = CoreAPB3_0_APBmslave0_PADDR[8:0];
assign CoreAPB3_0_APBmslave0_PADDR_1 = { CoreAPB3_0_APBmslave0_PADDR_1_8to0 };

assign CoreAPB3_0_APBmslave0_PRDATA_0_31to8 = 24'h0;
assign CoreAPB3_0_APBmslave0_PRDATA_0_7to0 = CoreAPB3_0_APBmslave0_PRDATA[7:0];
assign CoreAPB3_0_APBmslave0_PRDATA_0 = { CoreAPB3_0_APBmslave0_PRDATA_0_31to8, CoreAPB3_0_APBmslave0_PRDATA_0_7to0 };

assign CoreAPB3_0_APBmslave0_PWDATA_0_7to0 = CoreAPB3_0_APBmslave0_PWDATA[7:0];
assign CoreAPB3_0_APBmslave0_PWDATA_0 = { CoreAPB3_0_APBmslave0_PWDATA_0_7to0 };
assign CoreAPB3_0_APBmslave0_PWDATA_1_7to0 = CoreAPB3_0_APBmslave0_PWDATA[7:0];
assign CoreAPB3_0_APBmslave0_PWDATA_1 = { CoreAPB3_0_APBmslave0_PWDATA_1_7to0 };

assign CoreAPB3_0_APBmslave1_PRDATA_0_31to8 = 24'h0;
assign CoreAPB3_0_APBmslave1_PRDATA_0_7to0 = CoreAPB3_0_APBmslave1_PRDATA[7:0];
assign CoreAPB3_0_APBmslave1_PRDATA_0 = { CoreAPB3_0_APBmslave1_PRDATA_0_31to8, CoreAPB3_0_APBmslave1_PRDATA_0_7to0 };

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------BIBUF
BIBUF BIBUF_COREI2C_0_0_SCL_IO(
        // Inputs
        .D   ( GND_net ),
        .E   ( E_IN_POST_INV0_0 ),
        // Outputs
        .Y   ( BIBUF_COREI2C_0_0_SCL_IO_Y ),
        // Inouts
        .PAD ( COREI2C_0_0_SCL_IO ) 
        );

//--------BIBUF
BIBUF BIBUF_COREI2C_0_0_SDA_IO(
        // Inputs
        .D   ( GND_net ),
        .E   ( E_IN_POST_INV1_0 ),
        // Outputs
        .Y   ( BIBUF_COREI2C_0_0_SDA_IO_Y ),
        // Inouts
        .PAD ( COREI2C_0_0_SDA_IO ) 
        );

//--------SF2_MSS_sb_CCC_0_FCCC   -   Actel:SgCore:FCCC:2.0.200
SF2_MSS_sb_CCC_0_FCCC CCC_0(
        // Inputs
        .RCOSC_25_50MHZ ( FABOSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC ),
        // Outputs
        .GL0            ( FAB_CCC_GL0_net_0 ),
        .LOCK           ( FAB_CCC_LOCK_net_0 ) 
        );

//--------CoreAPB3   -   Actel:DirectCore:CoreAPB3:4.1.100
CoreAPB3 #( 
        .APB_DWIDTH      ( 32 ),
        .APBSLOT0ENABLE  ( 1 ),
        .APBSLOT1ENABLE  ( 1 ),
        .APBSLOT2ENABLE  ( 0 ),
        .APBSLOT3ENABLE  ( 0 ),
        .APBSLOT4ENABLE  ( 0 ),
        .APBSLOT5ENABLE  ( 0 ),
        .APBSLOT6ENABLE  ( 0 ),
        .APBSLOT7ENABLE  ( 0 ),
        .APBSLOT8ENABLE  ( 0 ),
        .APBSLOT9ENABLE  ( 0 ),
        .APBSLOT10ENABLE ( 0 ),
        .APBSLOT11ENABLE ( 0 ),
        .APBSLOT12ENABLE ( 0 ),
        .APBSLOT13ENABLE ( 0 ),
        .APBSLOT14ENABLE ( 0 ),
        .APBSLOT15ENABLE ( 0 ),
        .FAMILY          ( 19 ),
        .IADDR_OPTION    ( 0 ),
        .MADDR_BITS      ( 16 ),
        .SC_0            ( 0 ),
        .SC_1            ( 0 ),
        .SC_2            ( 0 ),
        .SC_3            ( 0 ),
        .SC_4            ( 0 ),
        .SC_5            ( 0 ),
        .SC_6            ( 0 ),
        .SC_7            ( 0 ),
        .SC_8            ( 0 ),
        .SC_9            ( 0 ),
        .SC_10           ( 0 ),
        .SC_11           ( 0 ),
        .SC_12           ( 0 ),
        .SC_13           ( 0 ),
        .SC_14           ( 0 ),
        .SC_15           ( 0 ),
        .UPR_NIBBLE_POSN ( 3 ) )
CoreAPB3_0(
        // Inputs
        .PRESETN    ( GND_net ), // tied to 1'b0 from definition
        .PCLK       ( GND_net ), // tied to 1'b0 from definition
        .PADDR      ( SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PADDR ),
        .PWRITE     ( SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PWRITE ),
        .PENABLE    ( SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PENABLE ),
        .PWDATA     ( SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PWDATA ),
        .PSEL       ( SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PSELx ),
        .PRDATAS0   ( CoreAPB3_0_APBmslave0_PRDATA_0 ),
        .PREADYS0   ( CoreAPB3_0_APBmslave0_PREADY ),
        .PSLVERRS0  ( CoreAPB3_0_APBmslave0_PSLVERR ),
        .PRDATAS1   ( CoreAPB3_0_APBmslave1_PRDATA_0 ),
        .PREADYS1   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS1  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS2   ( PRDATAS2_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS2   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS2  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS3   ( PRDATAS3_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS3   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS3  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS4   ( PRDATAS4_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS4   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS4  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS5   ( PRDATAS5_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS5   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS5  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS6   ( PRDATAS6_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS6   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS6  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS7   ( PRDATAS7_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS7   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS7  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS8   ( PRDATAS8_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS8   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS8  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS9   ( PRDATAS9_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS9   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS9  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS10  ( PRDATAS10_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS10  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS10 ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS11  ( PRDATAS11_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS11  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS11 ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS12  ( PRDATAS12_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS12  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS12 ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS13  ( PRDATAS13_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS13  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS13 ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS14  ( PRDATAS14_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS14  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS14 ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS15  ( PRDATAS15_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS15  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS15 ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS16  ( PRDATAS16_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS16  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS16 ( GND_net ), // tied to 1'b0 from definition
        .IADDR      ( IADDR_const_net_0 ), // tied to 32'h00000000 from definition
        // Outputs
        .PRDATA     ( SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PRDATA ),
        .PREADY     ( SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PREADY ),
        .PSLVERR    ( SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PSLVERR ),
        .PADDRS     ( CoreAPB3_0_APBmslave0_PADDR ),
        .PWRITES    ( CoreAPB3_0_APBmslave0_PWRITE ),
        .PENABLES   ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PWDATAS    ( CoreAPB3_0_APBmslave0_PWDATA ),
        .PSELS0     ( CoreAPB3_0_APBmslave0_PSELx ),
        .PSELS1     ( CoreAPB3_0_APBmslave1_PSELx ),
        .PSELS2     (  ),
        .PSELS3     (  ),
        .PSELS4     (  ),
        .PSELS5     (  ),
        .PSELS6     (  ),
        .PSELS7     (  ),
        .PSELS8     (  ),
        .PSELS9     (  ),
        .PSELS10    (  ),
        .PSELS11    (  ),
        .PSELS12    (  ),
        .PSELS13    (  ),
        .PSELS14    (  ),
        .PSELS15    (  ),
        .PSELS16    (  ) 
        );

//--------COREI2C   -   Actel:DirectCore:COREI2C:7.0.102
COREI2C #( 
        .ADD_SLAVE1_ADDRESS_EN   ( 0 ),
        .BAUD_RATE_FIXED         ( 0 ),
        .BAUD_RATE_VALUE         ( 0 ),
        .BCLK_ENABLED            ( 1 ),
        .FIXED_SLAVE0_ADDR_EN    ( 0 ),
        .FIXED_SLAVE0_ADDR_VALUE ( 'h0 ),
        .FIXED_SLAVE1_ADDR_EN    ( 0 ),
        .FIXED_SLAVE1_ADDR_VALUE ( 'h0 ),
        .FREQUENCY               ( 30 ),
        .GLITCHREG_NUM           ( 3 ),
        .I2C_NUM                 ( 1 ),
        .IPMI_EN                 ( 0 ),
        .OPERATING_MODE          ( 0 ),
        .SMB_EN                  ( 0 ) )
COREI2C_0_0(
        // Inputs
        .BCLK        ( FAB_CCC_GL0_net_0 ),
        .PADDR       ( CoreAPB3_0_APBmslave0_PADDR_1 ),
        .PCLK        ( FAB_CCC_GL0_net_0 ),
        .PENABLE     ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PRESETN     ( MSS_READY_net_0 ),
        .PSEL        ( CoreAPB3_0_APBmslave1_PSELx ),
        .PWDATA      ( CoreAPB3_0_APBmslave0_PWDATA_1 ),
        .PWRITE      ( CoreAPB3_0_APBmslave0_PWRITE ),
        .SCLI        ( BIBUF_COREI2C_0_0_SCL_IO_Y ),
        .SDAI        ( BIBUF_COREI2C_0_0_SDA_IO_Y ),
        .SMBALERT_NI ( GND_net ), // tied to 1'b0 from definition
        .SMBSUS_NI   ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .INT         ( COREI2C_0_0_INT ),
        .PRDATA      ( CoreAPB3_0_APBmslave1_PRDATA ),
        .SCLO        ( COREI2C_0_0_SCLO ),
        .SDAO        ( COREI2C_0_0_SDAO ),
        .SMBALERT_NO (  ),
        .SMBA_INT    (  ),
        .SMBSUS_NO   (  ),
        .SMBS_INT    (  ) 
        );

//--------CoreResetP   -   Actel:DirectCore:CoreResetP:7.0.104
CoreResetP #( 
        .DDR_WAIT            ( 200 ),
        .DEVICE_090          ( 1 ),
        .DEVICE_VOLTAGE      ( 2 ),
        .ENABLE_SOFT_RESETS  ( 0 ),
        .EXT_RESET_CFG       ( 0 ),
        .FDDR_IN_USE         ( 0 ),
        .MDDR_IN_USE         ( 0 ),
        .SDIF0_IN_USE        ( 0 ),
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
        .RESET_N_M2F                    ( SF2_MSS_sb_MSS_TMP_0_MSS_RESET_N_M2F ),
        .FIC_2_APB_M_PRESET_N           ( SF2_MSS_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N ),
        .POWER_ON_RESET_N               ( POWER_ON_RESET_N_net_0 ),
        .FAB_RESET_N                    ( FAB_RESET_N ),
        .RCOSC_25_50MHZ                 ( FABOSC_0_RCOSC_25_50MHZ_O2F ),
        .CLK_BASE                       ( FAB_CCC_GL0_net_0 ),
        .CLK_LTSSM                      ( GND_net ), // tied to 1'b0 from definition
        .FPLL_LOCK                      ( VCC_net ), // tied to 1'b1 from definition
        .SDIF0_SPLL_LOCK                ( VCC_net ), // tied to 1'b1 from definition
        .SDIF1_SPLL_LOCK                ( VCC_net ), // tied to 1'b1 from definition
        .SDIF2_SPLL_LOCK                ( VCC_net ), // tied to 1'b1 from definition
        .SDIF3_SPLL_LOCK                ( VCC_net ), // tied to 1'b1 from definition
        .CONFIG1_DONE                   ( VCC_net ),
        .CONFIG2_DONE                   ( VCC_net ),
        .SDIF0_PERST_N                  ( VCC_net ), // tied to 1'b1 from definition
        .SDIF1_PERST_N                  ( VCC_net ), // tied to 1'b1 from definition
        .SDIF2_PERST_N                  ( VCC_net ), // tied to 1'b1 from definition
        .SDIF3_PERST_N                  ( VCC_net ), // tied to 1'b1 from definition
        .SDIF0_PSEL                     ( GND_net ), // tied to 1'b0 from definition
        .SDIF0_PWRITE                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF0_PRDATA                   ( SDIF0_PRDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .SDIF1_PSEL                     ( GND_net ), // tied to 1'b0 from definition
        .SDIF1_PWRITE                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF1_PRDATA                   ( SDIF1_PRDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .SDIF2_PSEL                     ( GND_net ), // tied to 1'b0 from definition
        .SDIF2_PWRITE                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF2_PRDATA                   ( SDIF2_PRDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .SDIF3_PSEL                     ( GND_net ), // tied to 1'b0 from definition
        .SDIF3_PWRITE                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF3_PRDATA                   ( SDIF3_PRDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .SOFT_EXT_RESET_OUT             ( GND_net ), // tied to 1'b0 from definition
        .SOFT_RESET_F2M                 ( GND_net ), // tied to 1'b0 from definition
        .SOFT_M3_RESET                  ( GND_net ), // tied to 1'b0 from definition
        .SOFT_MDDR_DDR_AXI_S_CORE_RESET ( GND_net ), // tied to 1'b0 from definition
        .SOFT_FDDR_CORE_RESET           ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF0_PHY_RESET           ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF0_CORE_RESET          ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF0_0_CORE_RESET        ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF0_1_CORE_RESET        ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF1_PHY_RESET           ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF1_CORE_RESET          ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF2_PHY_RESET           ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF2_CORE_RESET          ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF3_PHY_RESET           ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF3_CORE_RESET          ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .MSS_HPMS_READY                 ( MSS_READY_net_0 ),
        .DDR_READY                      (  ),
        .SDIF_READY                     (  ),
        .RESET_N_F2M                    ( CORERESETP_0_RESET_N_F2M ),
        .M3_RESET_N                     (  ),
        .EXT_RESET_OUT                  (  ),
        .MDDR_DDR_AXI_S_CORE_RESET_N    (  ),
        .FDDR_CORE_RESET_N              (  ),
        .SDIF0_CORE_RESET_N             (  ),
        .SDIF0_0_CORE_RESET_N           (  ),
        .SDIF0_1_CORE_RESET_N           (  ),
        .SDIF0_PHY_RESET_N              (  ),
        .SDIF1_CORE_RESET_N             (  ),
        .SDIF1_PHY_RESET_N              (  ),
        .SDIF2_CORE_RESET_N             (  ),
        .SDIF2_PHY_RESET_N              (  ),
        .SDIF3_CORE_RESET_N             (  ),
        .SDIF3_PHY_RESET_N              (  ),
        .SDIF_RELEASED                  (  ),
        .INIT_DONE                      ( INIT_DONE_net_0 ) 
        );

//--------SF2_MSS_sb_CoreUARTapb_0_0_CoreUARTapb   -   Actel:DirectCore:CoreUARTapb:5.2.2
SF2_MSS_sb_CoreUARTapb_0_0_CoreUARTapb #( 
        .BAUD_VAL_FRCTN    ( 0 ),
        .BAUD_VAL_FRCTN_EN ( 0 ),
        .BAUD_VALUE        ( 1 ),
        .FAMILY            ( 19 ),
        .FIXEDMODE         ( 0 ),
        .PRG_BIT8          ( 0 ),
        .PRG_PARITY        ( 0 ),
        .RX_FIFO           ( 0 ),
        .RX_LEGACY_MODE    ( 0 ),
        .TX_FIFO           ( 0 ) )
CoreUARTapb_0_0(
        // Inputs
        .PCLK        ( FAB_CCC_GL0_net_0 ),
        .PRESETN     ( MSS_READY_net_0 ),
        .PADDR       ( CoreAPB3_0_APBmslave0_PADDR_0 ),
        .PSEL        ( CoreAPB3_0_APBmslave0_PSELx ),
        .PENABLE     ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PWRITE      ( CoreAPB3_0_APBmslave0_PWRITE ),
        .PWDATA      ( CoreAPB3_0_APBmslave0_PWDATA_0 ),
        .RX          ( RX ),
        // Outputs
        .PRDATA      ( CoreAPB3_0_APBmslave0_PRDATA ),
        .TXRDY       ( CoreUARTapb_0_0_TXRDY ),
        .RXRDY       ( CoreUARTapb_0_0_RXRDY ),
        .PARITY_ERR  ( CoreUARTapb_0_0_PARITY_ERR ),
        .OVERFLOW    ( CoreUARTapb_0_0_OVERFLOW ),
        .TX          ( TX_net_0 ),
        .PREADY      ( CoreAPB3_0_APBmslave0_PREADY ),
        .PSLVERR     ( CoreAPB3_0_APBmslave0_PSLVERR ),
        .FRAMING_ERR ( CoreUARTapb_0_0_FRAMING_ERR ) 
        );

//--------OR3
OR3 CoreUARTapb_0_0_intr_or_0(
        // Inputs
        .A ( CoreUARTapb_0_0_FRAMING_ERR ),
        .B ( CoreUARTapb_0_0_OVERFLOW ),
        .C ( CoreUARTapb_0_0_PARITY_ERR ),
        // Outputs
        .Y ( CoreUARTapb_0_0_intr_or_0_Y ) 
        );

//--------OR3
OR3 CoreUARTapb_0_0_intr_or_1(
        // Inputs
        .A ( CoreUARTapb_0_0_RXRDY ),
        .B ( CoreUARTapb_0_0_TXRDY ),
        .C ( GND_net ),
        // Outputs
        .Y ( CoreUARTapb_0_0_intr_or_1_Y ) 
        );

//--------OR3
OR3 CoreUARTapb_0_0_intr_or_2(
        // Inputs
        .A ( CoreUARTapb_0_0_intr_or_1_Y ),
        .B ( CoreUARTapb_0_0_intr_or_0_Y ),
        .C ( GND_net ),
        // Outputs
        .Y ( CoreUARTapb_0_0_intr_or_2_Y ) 
        );

//--------SF2_MSS_sb_FABOSC_0_OSC   -   Actel:SgCore:OSC:2.0.101
SF2_MSS_sb_FABOSC_0_OSC FABOSC_0(
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

//--------SF2_MSS_sb_MSS
SF2_MSS_sb_MSS SF2_MSS_sb_MSS_0(
        // Inputs
        .SPI_0_DI               ( SPI_0_DI ),
        .MCCC_CLK_BASE          ( FAB_CCC_GL0_net_0 ),
        .MMUART_0_RXD           ( MMUART_0_RXD ),
        .MCCC_CLK_BASE_PLL_LOCK ( FAB_CCC_LOCK_net_0 ),
        .MSS_RESET_N_F2M        ( CORERESETP_0_RESET_N_F2M ),
        .FIC_0_APB_M_PREADY     ( SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PREADY ),
        .FIC_0_APB_M_PSLVERR    ( SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PSLVERR ),
        .FIC_2_APB_M_PREADY     ( VCC_net ), // tied to 1'b1 from definition
        .FIC_2_APB_M_PSLVERR    ( GND_net ), // tied to 1'b0 from definition
        .MSS_INT_F2M            ( MSS_INT_F2M_net_0 ),
        .FIC_0_APB_M_PRDATA     ( SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PRDATA ),
        .FIC_2_APB_M_PRDATA     ( FIC_2_APB_M_PRDATA_const_net_0 ), // tied to 32'h00000000 from definition
        // Outputs
        .SPI_0_DO               ( SPI_0_DO_net_0 ),
        .MMUART_0_TXD           ( MMUART_0_TXD_net_0 ),
        .MSS_RESET_N_M2F        ( SF2_MSS_sb_MSS_TMP_0_MSS_RESET_N_M2F ),
        .GPIO_0_M2F             ( GPIO_0_M2F_net_0 ),
        .FIC_0_APB_M_PSEL       ( SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PSELx ),
        .FIC_0_APB_M_PWRITE     ( SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PWRITE ),
        .FIC_0_APB_M_PENABLE    ( SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PENABLE ),
        .FIC_2_APB_M_PRESET_N   ( SF2_MSS_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N ),
        .FIC_2_APB_M_PCLK       (  ),
        .FIC_2_APB_M_PWRITE     (  ),
        .FIC_2_APB_M_PENABLE    (  ),
        .FIC_2_APB_M_PSEL       (  ),
        .FIC_0_APB_M_PADDR      ( SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PADDR ),
        .FIC_0_APB_M_PWDATA     ( SF2_MSS_sb_MSS_TMP_0_FIC_0_APB_MASTER_PWDATA ),
        .FIC_2_APB_M_PADDR      (  ),
        .FIC_2_APB_M_PWDATA     (  ),
        // Inouts
        .I2C_0_SDA              ( I2C_0_SDA ),
        .I2C_0_SCL              ( I2C_0_SCL ),
        .SPI_0_CLK              ( SPI_0_CLK ),
        .SPI_0_SS0              ( SPI_0_SS0 ) 
        );

//--------SYSRESET
SYSRESET SYSRESET_POR(
        // Inputs
        .DEVRST_N         ( DEVRST_N ),
        // Outputs
        .POWER_ON_RESET_N ( POWER_ON_RESET_N_net_0 ) 
        );


endmodule
