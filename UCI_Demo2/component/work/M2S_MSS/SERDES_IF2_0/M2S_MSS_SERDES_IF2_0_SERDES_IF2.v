`timescale 1 ns/100 ps
// Version: v11.7 11.7.0.119


module M2S_MSS_SERDES_IF2_0_SERDES_IF2(
       RXD0_P,
       RXD0_N,
       RXD1_P,
       RXD1_N,
       RXD2_P,
       RXD2_N,
       RXD3_P,
       RXD3_N,
       TXD0_P,
       TXD0_N,
       TXD1_P,
       TXD1_N,
       TXD2_P,
       TXD2_N,
       TXD3_P,
       TXD3_N,
       APB_S_PRDATA,
       APB_S_PREADY,
       APB_S_PSLVERR,
       APB_S_PADDR,
       APB_S_PENABLE,
       APB_S_PSEL,
       APB_S_PWDATA,
       APB_S_PWRITE,
       APB_S_PCLK,
       APB_S_PRESET_N,
       PHY_RESET_N,
       CLK_BASE,
       SPLL_LOCK,
       PLL_LOCK_INT,
       PLL_LOCKLOST_INT,
       PCIE_0_CORE_RESET_N,
       PCIE_0_INTERRUPT,
       PCIE_0_SYSTEM_INT,
       PCIE_0_EV_1US,
       PCIE_0_L2P2_ACTIVE,
       PCIE_0_RESET_PHASE,
       PCIE_0_PERST_N,
       PCIE_0_LTSSM,
       REFCLK0_P,
       REFCLK0_N,
       REFCLK0_OUT,
       AXI_0_M_AWID,
       AXI_0_M_AWADDR,
       AXI_0_M_AWLEN,
       AXI_0_M_AWSIZE,
       AXI_0_M_AWBURST,
       AXI_0_M_AWVALID,
       AXI_0_M_AWREADY,
       AXI_0_M_WID,
       AXI_0_M_WSTRB,
       AXI_0_M_WLAST,
       AXI_0_M_WVALID,
       AXI_0_M_WDATA,
       AXI_0_M_WREADY,
       AXI_0_M_BID,
       AXI_0_M_BRESP,
       AXI_0_M_BVALID,
       AXI_0_M_BREADY,
       AXI_0_M_ARID,
       AXI_0_M_ARADDR,
       AXI_0_M_ARLEN,
       AXI_0_M_ARSIZE,
       AXI_0_M_ARBURST,
       AXI_0_M_ARVALID,
       AXI_0_M_ARREADY,
       AXI_0_M_RID,
       AXI_0_M_RDATA,
       AXI_0_M_RRESP,
       AXI_0_M_RLAST,
       AXI_0_M_RVALID,
       AXI_0_M_RREADY
    );
input  RXD0_P;
input  RXD0_N;
input  RXD1_P;
input  RXD1_N;
input  RXD2_P;
input  RXD2_N;
input  RXD3_P;
input  RXD3_N;
output TXD0_P;
output TXD0_N;
output TXD1_P;
output TXD1_N;
output TXD2_P;
output TXD2_N;
output TXD3_P;
output TXD3_N;
output [31:0] APB_S_PRDATA;
output APB_S_PREADY;
output APB_S_PSLVERR;
input  [14:2] APB_S_PADDR;
input  APB_S_PENABLE;
input  APB_S_PSEL;
input  [31:0] APB_S_PWDATA;
input  APB_S_PWRITE;
input  APB_S_PCLK;
input  APB_S_PRESET_N;
input  PHY_RESET_N;
input  CLK_BASE;
output SPLL_LOCK;
output PLL_LOCK_INT;
output PLL_LOCKLOST_INT;
input  PCIE_0_CORE_RESET_N;
input  [3:0] PCIE_0_INTERRUPT;
output PCIE_0_SYSTEM_INT;
output PCIE_0_EV_1US;
output PCIE_0_L2P2_ACTIVE;
output PCIE_0_RESET_PHASE;
input  PCIE_0_PERST_N;
output [5:0] PCIE_0_LTSSM;
input  REFCLK0_P;
input  REFCLK0_N;
output REFCLK0_OUT;
output [3:0] AXI_0_M_AWID;
output [31:0] AXI_0_M_AWADDR;
output [3:0] AXI_0_M_AWLEN;
output [1:0] AXI_0_M_AWSIZE;
output [1:0] AXI_0_M_AWBURST;
output AXI_0_M_AWVALID;
input  AXI_0_M_AWREADY;
output [3:0] AXI_0_M_WID;
output [7:0] AXI_0_M_WSTRB;
output AXI_0_M_WLAST;
output AXI_0_M_WVALID;
output [63:0] AXI_0_M_WDATA;
input  AXI_0_M_WREADY;
input  [3:0] AXI_0_M_BID;
input  [1:0] AXI_0_M_BRESP;
input  AXI_0_M_BVALID;
output AXI_0_M_BREADY;
output [3:0] AXI_0_M_ARID;
output [31:0] AXI_0_M_ARADDR;
output [3:0] AXI_0_M_ARLEN;
output [1:0] AXI_0_M_ARSIZE;
output [1:0] AXI_0_M_ARBURST;
output AXI_0_M_ARVALID;
input  AXI_0_M_ARREADY;
input  [3:0] AXI_0_M_RID;
input  [63:0] AXI_0_M_RDATA;
input  [1:0] AXI_0_M_RRESP;
input  AXI_0_M_RLAST;
input  AXI_0_M_RVALID;
output AXI_0_M_RREADY;

    wire gnd_net, vcc_net;
    
    INBUF_DIFF refclk0_inbuf_diff (.PADP(REFCLK0_P), .PADN(REFCLK0_N), 
        .Y(REFCLK0_OUT));
    VCC vcc_inst (.Y(vcc_net));
    GND gnd_inst (.Y(gnd_net));
    SERDESIF_075 #( .INIT(1100'h080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007C0002700000000000000000000000000000000000000000000000000000007E000000000000000068400000000000000000AAB08D52278E7FF8380000000003FE1FC458F40003FFFFFBFFFFFFFFFFFFFFDFFFFFFFFFFF)
        , .ACT_CONFIG("SERDESIF_0"), .ACT_SIM(2) )  SERDESIF_INST (
        .APB_PRDATA({APB_S_PRDATA[31], APB_S_PRDATA[30], 
        APB_S_PRDATA[29], APB_S_PRDATA[28], APB_S_PRDATA[27], 
        APB_S_PRDATA[26], APB_S_PRDATA[25], APB_S_PRDATA[24], 
        APB_S_PRDATA[23], APB_S_PRDATA[22], APB_S_PRDATA[21], 
        APB_S_PRDATA[20], APB_S_PRDATA[19], APB_S_PRDATA[18], 
        APB_S_PRDATA[17], APB_S_PRDATA[16], APB_S_PRDATA[15], 
        APB_S_PRDATA[14], APB_S_PRDATA[13], APB_S_PRDATA[12], 
        APB_S_PRDATA[11], APB_S_PRDATA[10], APB_S_PRDATA[9], 
        APB_S_PRDATA[8], APB_S_PRDATA[7], APB_S_PRDATA[6], 
        APB_S_PRDATA[5], APB_S_PRDATA[4], APB_S_PRDATA[3], 
        APB_S_PRDATA[2], APB_S_PRDATA[1], APB_S_PRDATA[0]}), 
        .APB_PREADY(APB_S_PREADY), .APB_PSLVERR(APB_S_PSLVERR), 
        .ATXCLKSTABLE({nc0, nc1}), .EPCS_READY({nc2, nc3}), 
        .EPCS_RXCLK({nc4, nc5}), .EPCS_RXCLK_0(PCIE_0_L2P2_ACTIVE), 
        .EPCS_RXCLK_1(PCIE_0_RESET_PHASE), .EPCS_RXDATA({nc6, nc7, nc8, 
        nc9, nc10, nc11, nc12, nc13, nc14, nc15, nc16, nc17, nc18, 
        nc19, nc20, nc21, nc22, nc23, nc24, nc25, nc26, nc27, nc28, 
        nc29, nc30, nc31, nc32, nc33, nc34, nc35, nc36, nc37, nc38, 
        nc39, nc40, nc41, nc42, nc43, nc44, nc45}), .EPCS_RXIDLE({nc46, 
        nc47}), .EPCS_RXRSTN({nc48, nc49}), .EPCS_RXVAL({nc50, nc51}), 
        .EPCS_TXCLK({nc52, nc53}), .EPCS_TXCLK_0(PCIE_0_EV_1US), 
        .EPCS_TXCLK_1(), .EPCS_TXRSTN({nc54, nc55}), .FATC_RESET_N(), 
        .H2FCALIB0(), .H2FCALIB1(), .M2_ARADDR({nc56, nc57, nc58, nc59, 
        nc60, nc61, nc62, nc63, nc64, nc65, nc66, nc67, nc68, nc69, 
        nc70, nc71, nc72, nc73, nc74, nc75, nc76, nc77, nc78, nc79, 
        nc80, nc81, nc82, nc83, nc84, nc85, nc86, nc87}), .M2_ARBURST({
        nc88, nc89}), .M2_ARID({nc90, nc91, nc92, nc93}), .M2_ARLEN({
        nc94, nc95, nc96, nc97}), .M2_ARSIZE({nc98, nc99}), 
        .M2_ARVALID(), .M2_AWADDR_HADDR({nc100, nc101, nc102, nc103, 
        nc104, nc105, nc106, nc107, nc108, nc109, nc110, nc111, nc112, 
        nc113, nc114, nc115, nc116, nc117, nc118, nc119, nc120, nc121, 
        nc122, nc123, nc124, nc125, nc126, nc127, nc128, nc129, nc130, 
        nc131}), .M2_AWBURST_HTRANS({nc132, nc133}), .M2_AWID({nc134, 
        nc135, nc136, nc137}), .M2_AWLEN_HBURST({nc138, nc139, nc140, 
        nc141}), .M2_AWSIZE_HSIZE({nc142, nc143}), .M2_AWVALID_HWRITE()
        , .M2_BREADY(), .M2_RREADY(), .M2_WDATA_HWDATA({nc144, nc145, 
        nc146, nc147, nc148, nc149, nc150, nc151, nc152, nc153, nc154, 
        nc155, nc156, nc157, nc158, nc159, nc160, nc161, nc162, nc163, 
        nc164, nc165, nc166, nc167, nc168, nc169, nc170, nc171, nc172, 
        nc173, nc174, nc175, nc176, nc177, nc178, nc179, nc180, nc181, 
        nc182, nc183, nc184, nc185, nc186, nc187, nc188, nc189, nc190, 
        nc191, nc192, nc193, nc194, nc195, nc196, nc197, nc198, nc199, 
        nc200, nc201, nc202, nc203, nc204, nc205, nc206, nc207}), 
        .M2_WID({nc208, nc209, nc210, nc211}), .M2_WLAST(), .M2_WSTRB({
        nc212, nc213, nc214, nc215, nc216, nc217, nc218, nc219}), 
        .M2_WVALID(), .M_ARADDR({AXI_0_M_ARADDR[31], 
        AXI_0_M_ARADDR[30], AXI_0_M_ARADDR[29], AXI_0_M_ARADDR[28], 
        AXI_0_M_ARADDR[27], AXI_0_M_ARADDR[26], AXI_0_M_ARADDR[25], 
        AXI_0_M_ARADDR[24], AXI_0_M_ARADDR[23], AXI_0_M_ARADDR[22], 
        AXI_0_M_ARADDR[21], AXI_0_M_ARADDR[20], AXI_0_M_ARADDR[19], 
        AXI_0_M_ARADDR[18], AXI_0_M_ARADDR[17], AXI_0_M_ARADDR[16], 
        AXI_0_M_ARADDR[15], AXI_0_M_ARADDR[14], AXI_0_M_ARADDR[13], 
        AXI_0_M_ARADDR[12], AXI_0_M_ARADDR[11], AXI_0_M_ARADDR[10], 
        AXI_0_M_ARADDR[9], AXI_0_M_ARADDR[8], AXI_0_M_ARADDR[7], 
        AXI_0_M_ARADDR[6], AXI_0_M_ARADDR[5], AXI_0_M_ARADDR[4], 
        AXI_0_M_ARADDR[3], AXI_0_M_ARADDR[2], AXI_0_M_ARADDR[1], 
        AXI_0_M_ARADDR[0]}), .M_ARBURST({AXI_0_M_ARBURST[1], 
        AXI_0_M_ARBURST[0]}), .M_ARID({AXI_0_M_ARID[3], 
        AXI_0_M_ARID[2], AXI_0_M_ARID[1], AXI_0_M_ARID[0]}), .M_ARLEN({
        AXI_0_M_ARLEN[3], AXI_0_M_ARLEN[2], AXI_0_M_ARLEN[1], 
        AXI_0_M_ARLEN[0]}), .M_ARSIZE({AXI_0_M_ARSIZE[1], 
        AXI_0_M_ARSIZE[0]}), .M_ARVALID(AXI_0_M_ARVALID), 
        .M_AWADDR_HADDR({AXI_0_M_AWADDR[31], AXI_0_M_AWADDR[30], 
        AXI_0_M_AWADDR[29], AXI_0_M_AWADDR[28], AXI_0_M_AWADDR[27], 
        AXI_0_M_AWADDR[26], AXI_0_M_AWADDR[25], AXI_0_M_AWADDR[24], 
        AXI_0_M_AWADDR[23], AXI_0_M_AWADDR[22], AXI_0_M_AWADDR[21], 
        AXI_0_M_AWADDR[20], AXI_0_M_AWADDR[19], AXI_0_M_AWADDR[18], 
        AXI_0_M_AWADDR[17], AXI_0_M_AWADDR[16], AXI_0_M_AWADDR[15], 
        AXI_0_M_AWADDR[14], AXI_0_M_AWADDR[13], AXI_0_M_AWADDR[12], 
        AXI_0_M_AWADDR[11], AXI_0_M_AWADDR[10], AXI_0_M_AWADDR[9], 
        AXI_0_M_AWADDR[8], AXI_0_M_AWADDR[7], AXI_0_M_AWADDR[6], 
        AXI_0_M_AWADDR[5], AXI_0_M_AWADDR[4], AXI_0_M_AWADDR[3], 
        AXI_0_M_AWADDR[2], AXI_0_M_AWADDR[1], AXI_0_M_AWADDR[0]}), 
        .M_AWBURST_HTRANS({AXI_0_M_AWBURST[1], AXI_0_M_AWBURST[0]}), 
        .M_AWID({AXI_0_M_AWID[3], AXI_0_M_AWID[2], AXI_0_M_AWID[1], 
        AXI_0_M_AWID[0]}), .M_AWLEN_HBURST({AXI_0_M_AWLEN[3], 
        AXI_0_M_AWLEN[2], AXI_0_M_AWLEN[1], AXI_0_M_AWLEN[0]}), 
        .M_AWSIZE_HSIZE({AXI_0_M_AWSIZE[1], AXI_0_M_AWSIZE[0]}), 
        .M_AWVALID_HWRITE(AXI_0_M_AWVALID), .M_BREADY(AXI_0_M_BREADY), 
        .M_RREADY(AXI_0_M_RREADY), .M_WDATA_HWDATA({AXI_0_M_WDATA[63], 
        AXI_0_M_WDATA[62], AXI_0_M_WDATA[61], AXI_0_M_WDATA[60], 
        AXI_0_M_WDATA[59], AXI_0_M_WDATA[58], AXI_0_M_WDATA[57], 
        AXI_0_M_WDATA[56], AXI_0_M_WDATA[55], AXI_0_M_WDATA[54], 
        AXI_0_M_WDATA[53], AXI_0_M_WDATA[52], AXI_0_M_WDATA[51], 
        AXI_0_M_WDATA[50], AXI_0_M_WDATA[49], AXI_0_M_WDATA[48], 
        AXI_0_M_WDATA[47], AXI_0_M_WDATA[46], AXI_0_M_WDATA[45], 
        AXI_0_M_WDATA[44], AXI_0_M_WDATA[43], AXI_0_M_WDATA[42], 
        AXI_0_M_WDATA[41], AXI_0_M_WDATA[40], AXI_0_M_WDATA[39], 
        AXI_0_M_WDATA[38], AXI_0_M_WDATA[37], AXI_0_M_WDATA[36], 
        AXI_0_M_WDATA[35], AXI_0_M_WDATA[34], AXI_0_M_WDATA[33], 
        AXI_0_M_WDATA[32], AXI_0_M_WDATA[31], AXI_0_M_WDATA[30], 
        AXI_0_M_WDATA[29], AXI_0_M_WDATA[28], AXI_0_M_WDATA[27], 
        AXI_0_M_WDATA[26], AXI_0_M_WDATA[25], AXI_0_M_WDATA[24], 
        AXI_0_M_WDATA[23], AXI_0_M_WDATA[22], AXI_0_M_WDATA[21], 
        AXI_0_M_WDATA[20], AXI_0_M_WDATA[19], AXI_0_M_WDATA[18], 
        AXI_0_M_WDATA[17], AXI_0_M_WDATA[16], AXI_0_M_WDATA[15], 
        AXI_0_M_WDATA[14], AXI_0_M_WDATA[13], AXI_0_M_WDATA[12], 
        AXI_0_M_WDATA[11], AXI_0_M_WDATA[10], AXI_0_M_WDATA[9], 
        AXI_0_M_WDATA[8], AXI_0_M_WDATA[7], AXI_0_M_WDATA[6], 
        AXI_0_M_WDATA[5], AXI_0_M_WDATA[4], AXI_0_M_WDATA[3], 
        AXI_0_M_WDATA[2], AXI_0_M_WDATA[1], AXI_0_M_WDATA[0]}), .M_WID({
        AXI_0_M_WID[3], AXI_0_M_WID[2], AXI_0_M_WID[1], AXI_0_M_WID[0]})
        , .M_WLAST(AXI_0_M_WLAST), .M_WSTRB({AXI_0_M_WSTRB[7], 
        AXI_0_M_WSTRB[6], AXI_0_M_WSTRB[5], AXI_0_M_WSTRB[4], 
        AXI_0_M_WSTRB[3], AXI_0_M_WSTRB[2], AXI_0_M_WSTRB[1], 
        AXI_0_M_WSTRB[0]}), .M_WVALID(AXI_0_M_WVALID), .PCIE2_LTSSM({
        nc220, nc221, nc222, nc223, nc224, nc225}), .PCIE2_SYSTEM_INT()
        , .PCIE2_WAKE_N(), .PCIE_LTSSM({PCIE_0_LTSSM[5], 
        PCIE_0_LTSSM[4], PCIE_0_LTSSM[3], PCIE_0_LTSSM[2], 
        PCIE_0_LTSSM[1], PCIE_0_LTSSM[0]}), .PCIE_SYSTEM_INT(
        PCIE_0_SYSTEM_INT), .PLL_LOCK_INT(PLL_LOCK_INT), 
        .PLL_LOCKLOST_INT(PLL_LOCKLOST_INT), .S2_ARREADY(), 
        .S2_AWREADY(), .S2_BID({nc226, nc227, nc228, nc229}), 
        .S2_BRESP_HRESP({nc230, nc231}), .S2_BVALID(), 
        .S2_RDATA_HRDATA({nc232, nc233, nc234, nc235, nc236, nc237, 
        nc238, nc239, nc240, nc241, nc242, nc243, nc244, nc245, nc246, 
        nc247, nc248, nc249, nc250, nc251, nc252, nc253, nc254, nc255, 
        nc256, nc257, nc258, nc259, nc260, nc261, nc262, nc263, nc264, 
        nc265, nc266, nc267, nc268, nc269, nc270, nc271, nc272, nc273, 
        nc274, nc275, nc276, nc277, nc278, nc279, nc280, nc281, nc282, 
        nc283, nc284, nc285, nc286, nc287, nc288, nc289, nc290, nc291, 
        nc292, nc293, nc294, nc295}), .S2_RID({nc296, nc297, nc298, 
        nc299}), .S2_RLAST(), .S2_RRESP({nc300, nc301}), .S2_RVALID(), 
        .S2_WREADY_HREADYOUT(), .S_ARREADY(), .S_AWREADY(), .S_BID({
        nc302, nc303, nc304, nc305}), .S_BRESP_HRESP({nc306, nc307}), 
        .S_BVALID(), .S_RDATA_HRDATA({nc308, nc309, nc310, nc311, 
        nc312, nc313, nc314, nc315, nc316, nc317, nc318, nc319, nc320, 
        nc321, nc322, nc323, nc324, nc325, nc326, nc327, nc328, nc329, 
        nc330, nc331, nc332, nc333, nc334, nc335, nc336, nc337, nc338, 
        nc339, nc340, nc341, nc342, nc343, nc344, nc345, nc346, nc347, 
        nc348, nc349, nc350, nc351, nc352, nc353, nc354, nc355, nc356, 
        nc357, nc358, nc359, nc360, nc361, nc362, nc363, nc364, nc365, 
        nc366, nc367, nc368, nc369, nc370, nc371}), .S_RID({nc372, 
        nc373, nc374, nc375}), .S_RLAST(), .S_RRESP({nc376, nc377}), 
        .S_RVALID(), .S_WREADY_HREADYOUT(), .SPLL_LOCK(SPLL_LOCK), 
        .WAKE_N(), .XAUI_OUT_CLK(), .APB_CLK(APB_S_PCLK), .APB_PADDR({
        APB_S_PADDR[14], APB_S_PADDR[13], APB_S_PADDR[12], 
        APB_S_PADDR[11], APB_S_PADDR[10], APB_S_PADDR[9], 
        APB_S_PADDR[8], APB_S_PADDR[7], APB_S_PADDR[6], APB_S_PADDR[5], 
        APB_S_PADDR[4], APB_S_PADDR[3], APB_S_PADDR[2]}), .APB_PENABLE(
        APB_S_PENABLE), .APB_PSEL(APB_S_PSEL), .APB_PWDATA({
        APB_S_PWDATA[31], APB_S_PWDATA[30], APB_S_PWDATA[29], 
        APB_S_PWDATA[28], APB_S_PWDATA[27], APB_S_PWDATA[26], 
        APB_S_PWDATA[25], APB_S_PWDATA[24], APB_S_PWDATA[23], 
        APB_S_PWDATA[22], APB_S_PWDATA[21], APB_S_PWDATA[20], 
        APB_S_PWDATA[19], APB_S_PWDATA[18], APB_S_PWDATA[17], 
        APB_S_PWDATA[16], APB_S_PWDATA[15], APB_S_PWDATA[14], 
        APB_S_PWDATA[13], APB_S_PWDATA[12], APB_S_PWDATA[11], 
        APB_S_PWDATA[10], APB_S_PWDATA[9], APB_S_PWDATA[8], 
        APB_S_PWDATA[7], APB_S_PWDATA[6], APB_S_PWDATA[5], 
        APB_S_PWDATA[4], APB_S_PWDATA[3], APB_S_PWDATA[2], 
        APB_S_PWDATA[1], APB_S_PWDATA[0]}), .APB_PWRITE(APB_S_PWRITE), 
        .APB_RSTN(APB_S_PRESET_N), .CLK_BASE(CLK_BASE), .EPCS_PWRDN({
        vcc_net, vcc_net}), .EPCS_RSTN({gnd_net, gnd_net}), 
        .EPCS_RXERR({vcc_net, vcc_net}), .EPCS_TXDATA({gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net}), .EPCS_TXOOB({vcc_net, 
        vcc_net}), .EPCS_TXVAL({vcc_net, vcc_net}), .F2HCALIB0(vcc_net)
        , .F2HCALIB1(vcc_net), .FAB_PLL_LOCK(gnd_net), .FAB_REF_CLK(
        vcc_net), .M2_ARREADY(gnd_net), .M2_AWREADY(gnd_net), .M2_BID({
        vcc_net, vcc_net, vcc_net, vcc_net}), .M2_BRESP_HRESP({gnd_net, 
        gnd_net}), .M2_BVALID(gnd_net), .M2_RDATA_HRDATA({gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net})
        , .M2_RID({gnd_net, gnd_net, gnd_net, gnd_net}), .M2_RLAST(
        gnd_net), .M2_RRESP({gnd_net, gnd_net}), .M2_RVALID(gnd_net), 
        .M2_WREADY_HREADY(gnd_net), .M_ARREADY(AXI_0_M_ARREADY), 
        .M_AWREADY(AXI_0_M_AWREADY), .M_BID({AXI_0_M_BID[3], 
        AXI_0_M_BID[2], AXI_0_M_BID[1], AXI_0_M_BID[0]}), 
        .M_BRESP_HRESP({AXI_0_M_BRESP[1], AXI_0_M_BRESP[0]}), 
        .M_BVALID(AXI_0_M_BVALID), .M_RDATA_HRDATA({AXI_0_M_RDATA[63], 
        AXI_0_M_RDATA[62], AXI_0_M_RDATA[61], AXI_0_M_RDATA[60], 
        AXI_0_M_RDATA[59], AXI_0_M_RDATA[58], AXI_0_M_RDATA[57], 
        AXI_0_M_RDATA[56], AXI_0_M_RDATA[55], AXI_0_M_RDATA[54], 
        AXI_0_M_RDATA[53], AXI_0_M_RDATA[52], AXI_0_M_RDATA[51], 
        AXI_0_M_RDATA[50], AXI_0_M_RDATA[49], AXI_0_M_RDATA[48], 
        AXI_0_M_RDATA[47], AXI_0_M_RDATA[46], AXI_0_M_RDATA[45], 
        AXI_0_M_RDATA[44], AXI_0_M_RDATA[43], AXI_0_M_RDATA[42], 
        AXI_0_M_RDATA[41], AXI_0_M_RDATA[40], AXI_0_M_RDATA[39], 
        AXI_0_M_RDATA[38], AXI_0_M_RDATA[37], AXI_0_M_RDATA[36], 
        AXI_0_M_RDATA[35], AXI_0_M_RDATA[34], AXI_0_M_RDATA[33], 
        AXI_0_M_RDATA[32], AXI_0_M_RDATA[31], AXI_0_M_RDATA[30], 
        AXI_0_M_RDATA[29], AXI_0_M_RDATA[28], AXI_0_M_RDATA[27], 
        AXI_0_M_RDATA[26], AXI_0_M_RDATA[25], AXI_0_M_RDATA[24], 
        AXI_0_M_RDATA[23], AXI_0_M_RDATA[22], AXI_0_M_RDATA[21], 
        AXI_0_M_RDATA[20], AXI_0_M_RDATA[19], AXI_0_M_RDATA[18], 
        AXI_0_M_RDATA[17], AXI_0_M_RDATA[16], AXI_0_M_RDATA[15], 
        AXI_0_M_RDATA[14], AXI_0_M_RDATA[13], AXI_0_M_RDATA[12], 
        AXI_0_M_RDATA[11], AXI_0_M_RDATA[10], AXI_0_M_RDATA[9], 
        AXI_0_M_RDATA[8], AXI_0_M_RDATA[7], AXI_0_M_RDATA[6], 
        AXI_0_M_RDATA[5], AXI_0_M_RDATA[4], AXI_0_M_RDATA[3], 
        AXI_0_M_RDATA[2], AXI_0_M_RDATA[1], AXI_0_M_RDATA[0]}), .M_RID({
        AXI_0_M_RID[3], AXI_0_M_RID[2], AXI_0_M_RID[1], AXI_0_M_RID[0]})
        , .M_RLAST(AXI_0_M_RLAST), .M_RRESP({AXI_0_M_RRESP[1], 
        AXI_0_M_RRESP[0]}), .M_RVALID(AXI_0_M_RVALID), 
        .M_WREADY_HREADY(AXI_0_M_WREADY), .PCIE2_INTERRUPT({gnd_net, 
        gnd_net, gnd_net, gnd_net}), .PCIE2_PERST_N(gnd_net), 
        .PCIE2_SERDESIF_CORE_RESET_N(gnd_net), .PCIE2_WAKE_REQ(vcc_net)
        , .PCIE_INTERRUPT({PCIE_0_INTERRUPT[3], PCIE_0_INTERRUPT[2], 
        PCIE_0_INTERRUPT[1], PCIE_0_INTERRUPT[0]}), .PERST_N(
        PCIE_0_PERST_N), .S2_ARADDR({gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net}), .S2_ARBURST({gnd_net, gnd_net}), .S2_ARID({gnd_net, 
        gnd_net, gnd_net, gnd_net}), .S2_ARLEN({gnd_net, gnd_net, 
        gnd_net, gnd_net}), .S2_ARLOCK({gnd_net, gnd_net}), .S2_ARSIZE({
        gnd_net, gnd_net}), .S2_ARVALID(gnd_net), .S2_AWADDR_HADDR({
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net}), .S2_AWBURST_HTRANS({
        gnd_net, gnd_net}), .S2_AWID_HSEL({gnd_net, gnd_net, gnd_net, 
        gnd_net}), .S2_AWLEN_HBURST({gnd_net, gnd_net, gnd_net, 
        gnd_net}), .S2_AWLOCK({gnd_net, gnd_net}), .S2_AWSIZE_HSIZE({
        gnd_net, gnd_net}), .S2_AWVALID_HWRITE(gnd_net), 
        .S2_BREADY_HREADY(gnd_net), .S2_RREADY(gnd_net), 
        .S2_WDATA_HWDATA({gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net}), .S2_WID({gnd_net, gnd_net, 
        gnd_net, gnd_net}), .S2_WLAST(gnd_net), .S2_WSTRB({gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net})
        , .S2_WVALID(gnd_net), .S_ARADDR({gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net}), .S_ARBURST({gnd_net, gnd_net}), .S_ARID({gnd_net, 
        gnd_net, gnd_net, gnd_net}), .S_ARLEN({gnd_net, gnd_net, 
        gnd_net, gnd_net}), .S_ARLOCK({gnd_net, gnd_net}), .S_ARSIZE({
        gnd_net, gnd_net}), .S_ARVALID(gnd_net), .S_AWADDR_HADDR({
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net}), .S_AWBURST_HTRANS({
        gnd_net, gnd_net}), .S_AWID_HSEL({gnd_net, gnd_net, gnd_net, 
        gnd_net}), .S_AWLEN_HBURST({gnd_net, gnd_net, gnd_net, gnd_net})
        , .S_AWLOCK({gnd_net, gnd_net}), .S_AWSIZE_HSIZE({gnd_net, 
        gnd_net}), .S_AWVALID_HWRITE(gnd_net), .S_BREADY_HREADY(
        gnd_net), .S_RREADY(gnd_net), .S_WDATA_HWDATA({gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net})
        , .S_WID({gnd_net, gnd_net, gnd_net, gnd_net}), .S_WLAST(
        gnd_net), .S_WSTRB({gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net}), .S_WVALID(gnd_net), 
        .SERDESIF_CORE_RESET_N(PCIE_0_CORE_RESET_N), 
        .SERDESIF_PHY_RESET_N(PHY_RESET_N), .WAKE_REQ(vcc_net), 
        .XAUI_FB_CLK(vcc_net), .RXD3_P(RXD3_P), .RXD2_P(RXD2_P), 
        .RXD1_P(RXD1_P), .RXD0_P(RXD0_P), .RXD3_N(RXD3_N), .RXD2_N(
        RXD2_N), .RXD1_N(RXD1_N), .RXD0_N(RXD0_N), .TXD3_P(TXD3_P), 
        .TXD2_P(TXD2_P), .TXD1_P(TXD1_P), .TXD0_P(TXD0_P), .TXD3_N(
        TXD3_N), .TXD2_N(TXD2_N), .TXD1_N(TXD1_N), .TXD0_N(TXD0_N), 
        .REFCLK0(REFCLK0_OUT), .REFCLK1(vcc_net));
    
endmodule
