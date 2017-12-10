`timescale 1 ns/100 ps
// Version: v11.7 SP2 11.7.2.2


module RCOSC_25_50MHZ(
       CLKOUT
    );
output CLKOUT;

    parameter FREQUENCY = 50.0 ;
    
endmodule


module LED_ctrl(
       LED_c,
       AND2_0_Y,
       FCCC_0_GL0,
       PB_SW_c
    );
output [1:0] LED_c;
input  AND2_0_Y;
input  FCCC_0_GL0;
input  PB_SW_c;

    wire \counter[17]_net_1 , \counter_0[17] , \counter[0]_net_1 , 
        \counter_i_0[0] , \counter[6]_net_1 , VCC_net_1, 
        un2_counter_cry_6_S, GND_net_1, \counter[7]_net_1 , 
        un2_counter_cry_7_S, \counter[8]_net_1 , un2_counter_cry_8_S, 
        \counter[9]_net_1 , un2_counter_cry_9_S, \counter[10]_net_1 , 
        un2_counter_cry_10_S, \counter[11]_net_1 , 
        un2_counter_cry_11_S, \counter[12]_net_1 , 
        un2_counter_cry_12_S, \counter[13]_net_1 , 
        un2_counter_cry_13_S, \counter[14]_net_1 , 
        un2_counter_cry_14_S, \counter[15]_net_1 , 
        un2_counter_cry_15_S, \counter[16]_net_1 , 
        un2_counter_cry_16_S, \un2_counter_0_0[17] , 
        \counter[18]_net_1 , un2_counter_s_18_S, pb_reg1_net_1, 
        pb_reg2_net_1, \sh_lft[0]_net_1 , \sh_lft[1]_net_1 , 
        \counter[1]_net_1 , un2_counter_1_cry_1_S, \counter[2]_net_1 , 
        un2_counter_cry_2_S, \counter[3]_net_1 , un2_counter_cry_3_S, 
        \counter[4]_net_1 , un2_counter_cry_4_S, \counter[5]_net_1 , 
        un2_counter_cry_5_S, un2_counter_cry_1_net_1, 
        un2_counter_cry_2_net_1, un2_counter_cry_3_net_1, 
        un2_counter_cry_4_net_1, un2_counter_cry_5_net_1, 
        un2_counter_cry_6_net_1, un2_counter_cry_7_net_1, 
        un2_counter_cry_8_net_1, un2_counter_cry_9_net_1, 
        un2_counter_cry_10_net_1, un2_counter_cry_11_net_1, 
        un2_counter_cry_12_net_1, un2_counter_cry_13_net_1, 
        un2_counter_cry_14_net_1, un2_counter_cry_15_net_1, 
        un2_counter_cry_16_net_1, un2_counter_cry_17_net_1, 
        un2_counter_s_1_40_FCO, un2_counter_1_cry_1_net_1, 
        un2_counter_1_cry_2_net_1, un2_counter_1_cry_3_net_1, 
        un2_counter_1_cry_4_net_1, un2_counter_1_cry_5_net_1, 
        un2_counter_1_cry_6_net_1, un2_counter_1_cry_7_net_1, 
        un2_counter_1_cry_8_net_1, un2_counter_1_cry_9_net_1, 
        un2_counter_1_cry_10_net_1, un2_counter_1_cry_11_net_1, 
        un2_counter_1_cry_12_net_1, un2_counter_1_cry_13_net_1, 
        un2_counter_1_cry_14_net_1, un2_counter_1_cry_15_net_1, 
        un2_counter_1_cry_16_net_1;
    
    CFG4 #( .INIT(16'hB800) )  \LED[1]  (.A(\sh_lft[1]_net_1 ), .B(
        pb_reg2_net_1), .C(\counter[18]_net_1 ), .D(AND2_0_Y), .Y(
        LED_c[1]));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_1_cry_13 (.A(VCC_net_1), 
        .B(\counter[13]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_1_cry_12_net_1), .S(), .Y(), .FCO(
        un2_counter_1_cry_13_net_1));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_1_cry_1 (.A(VCC_net_1), .B(
        \counter[1]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_s_1_40_FCO), .S(un2_counter_1_cry_1_S), .Y(), .FCO(
        un2_counter_1_cry_1_net_1));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_cry_7 (.A(VCC_net_1), .B(
        \counter[7]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_cry_6_net_1), .S(un2_counter_cry_7_S), .Y(), .FCO(
        un2_counter_cry_7_net_1));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_1_s_17 (.A(VCC_net_1), .B(
        \counter_0[17] ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_1_cry_16_net_1), .S(\un2_counter_0_0[17] ), .Y(), 
        .FCO());
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_1_cry_4 (.A(VCC_net_1), .B(
        \counter[4]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_1_cry_3_net_1), .S(), .Y(), .FCO(
        un2_counter_1_cry_4_net_1));
    SLE \sh_lft[1]  (.D(\sh_lft[0]_net_1 ), .CLK(\counter[17]_net_1 ), 
        .EN(VCC_net_1), .ALn(AND2_0_Y), .ADn(GND_net_1), .SLn(
        VCC_net_1), .SD(GND_net_1), .LAT(GND_net_1), .Q(
        \sh_lft[1]_net_1 ));
    SLE \counter[17]  (.D(\un2_counter_0_0[17] ), .CLK(FCCC_0_GL0), 
        .EN(VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(
        VCC_net_1), .SD(GND_net_1), .LAT(GND_net_1), .Q(
        \counter_0[17] ));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_cry_8 (.A(VCC_net_1), .B(
        \counter[8]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_cry_7_net_1), .S(un2_counter_cry_8_S), .Y(), .FCO(
        un2_counter_cry_8_net_1));
    SLE \counter[2]  (.D(un2_counter_cry_2_S), .CLK(FCCC_0_GL0), .EN(
        VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(VCC_net_1), 
        .SD(GND_net_1), .LAT(GND_net_1), .Q(\counter[2]_net_1 ));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_cry_3 (.A(VCC_net_1), .B(
        \counter[3]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_cry_2_net_1), .S(un2_counter_cry_3_S), .Y(), .FCO(
        un2_counter_cry_3_net_1));
    SLE \counter[7]  (.D(un2_counter_cry_7_S), .CLK(FCCC_0_GL0), .EN(
        VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(VCC_net_1), 
        .SD(GND_net_1), .LAT(GND_net_1), .Q(\counter[7]_net_1 ));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_cry_9 (.A(VCC_net_1), .B(
        \counter[9]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_cry_8_net_1), .S(un2_counter_cry_9_S), .Y(), .FCO(
        un2_counter_cry_9_net_1));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_cry_17 (.A(VCC_net_1), .B(
        \counter[17]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_cry_16_net_1), .S(), .Y(), .FCO(
        un2_counter_cry_17_net_1));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_cry_5 (.A(VCC_net_1), .B(
        \counter[5]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_cry_4_net_1), .S(un2_counter_cry_5_S), .Y(), .FCO(
        un2_counter_cry_5_net_1));
    CFG1 #( .INIT(2'h1) )  \counter_RNO[0]  (.A(\counter[0]_net_1 ), 
        .Y(\counter_i_0[0] ));
    SLE \counter[6]  (.D(un2_counter_cry_6_S), .CLK(FCCC_0_GL0), .EN(
        VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(VCC_net_1), 
        .SD(GND_net_1), .LAT(GND_net_1), .Q(\counter[6]_net_1 ));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_cry_14 (.A(VCC_net_1), .B(
        \counter[14]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_cry_13_net_1), .S(un2_counter_cry_14_S), .Y(), 
        .FCO(un2_counter_cry_14_net_1));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_s_1_40 (.A(VCC_net_1), .B(
        \counter[0]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        VCC_net_1), .S(), .Y(), .FCO(un2_counter_s_1_40_FCO));
    SLE \sh_lft[0]  (.D(\sh_lft[1]_net_1 ), .CLK(\counter[17]_net_1 ), 
        .EN(VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(
        VCC_net_1), .SD(GND_net_1), .LAT(GND_net_1), .Q(
        \sh_lft[0]_net_1 ));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_1_cry_15 (.A(VCC_net_1), 
        .B(\counter[15]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_1_cry_14_net_1), .S(), .Y(), .FCO(
        un2_counter_1_cry_15_net_1));
    VCC VCC (.Y(VCC_net_1));
    SLE \counter[8]  (.D(un2_counter_cry_8_S), .CLK(FCCC_0_GL0), .EN(
        VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(VCC_net_1), 
        .SD(GND_net_1), .LAT(GND_net_1), .Q(\counter[8]_net_1 ));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_1_cry_14 (.A(VCC_net_1), 
        .B(\counter[14]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_1_cry_13_net_1), .S(), .Y(), .FCO(
        un2_counter_1_cry_14_net_1));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_1_cry_5 (.A(VCC_net_1), .B(
        \counter[5]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_1_cry_4_net_1), .S(), .Y(), .FCO(
        un2_counter_1_cry_5_net_1));
    CLKINT \counter_inferred_clock_RNIVA6D[17]  (.A(\counter_0[17] ), 
        .Y(\counter[17]_net_1 ));
    SLE \counter[16]  (.D(un2_counter_cry_16_S), .CLK(FCCC_0_GL0), .EN(
        VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(VCC_net_1), 
        .SD(GND_net_1), .LAT(GND_net_1), .Q(\counter[16]_net_1 ));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_1_cry_8 (.A(VCC_net_1), .B(
        \counter[8]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_1_cry_7_net_1), .S(), .Y(), .FCO(
        un2_counter_1_cry_8_net_1));
    SLE \counter[15]  (.D(un2_counter_cry_15_S), .CLK(FCCC_0_GL0), .EN(
        VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(VCC_net_1), 
        .SD(GND_net_1), .LAT(GND_net_1), .Q(\counter[15]_net_1 ));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_1_cry_9 (.A(VCC_net_1), .B(
        \counter[9]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_1_cry_8_net_1), .S(), .Y(), .FCO(
        un2_counter_1_cry_9_net_1));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_cry_4 (.A(VCC_net_1), .B(
        \counter[4]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_cry_3_net_1), .S(un2_counter_cry_4_S), .Y(), .FCO(
        un2_counter_cry_4_net_1));
    SLE \counter[14]  (.D(un2_counter_cry_14_S), .CLK(FCCC_0_GL0), .EN(
        VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(VCC_net_1), 
        .SD(GND_net_1), .LAT(GND_net_1), .Q(\counter[14]_net_1 ));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_1_cry_10 (.A(VCC_net_1), 
        .B(\counter[10]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_1_cry_9_net_1), .S(), .Y(), .FCO(
        un2_counter_1_cry_10_net_1));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_s_18 (.A(VCC_net_1), .B(
        \counter[18]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_cry_17_net_1), .S(un2_counter_s_18_S), .Y(), .FCO()
        );
    SLE pb_reg2 (.D(pb_reg1_net_1), .CLK(FCCC_0_GL0), .EN(VCC_net_1), 
        .ALn(AND2_0_Y), .ADn(GND_net_1), .SLn(VCC_net_1), .SD(
        GND_net_1), .LAT(GND_net_1), .Q(pb_reg2_net_1));
    GND GND (.Y(GND_net_1));
    SLE \counter[4]  (.D(un2_counter_cry_4_S), .CLK(FCCC_0_GL0), .EN(
        VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(VCC_net_1), 
        .SD(GND_net_1), .LAT(GND_net_1), .Q(\counter[4]_net_1 ));
    SLE \counter[5]  (.D(un2_counter_cry_5_S), .CLK(FCCC_0_GL0), .EN(
        VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(VCC_net_1), 
        .SD(GND_net_1), .LAT(GND_net_1), .Q(\counter[5]_net_1 ));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_cry_1 (.A(VCC_net_1), .B(
        \counter[1]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        \counter[0]_net_1 ), .S(), .Y(), .FCO(un2_counter_cry_1_net_1));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_1_cry_3 (.A(VCC_net_1), .B(
        \counter[3]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_1_cry_2_net_1), .S(), .Y(), .FCO(
        un2_counter_1_cry_3_net_1));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_cry_13 (.A(VCC_net_1), .B(
        \counter[13]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_cry_12_net_1), .S(un2_counter_cry_13_S), .Y(), 
        .FCO(un2_counter_cry_13_net_1));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_cry_16 (.A(VCC_net_1), .B(
        \counter[16]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_cry_15_net_1), .S(un2_counter_cry_16_S), .Y(), 
        .FCO(un2_counter_cry_16_net_1));
    SLE \counter[12]  (.D(un2_counter_cry_12_S), .CLK(FCCC_0_GL0), .EN(
        VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(VCC_net_1), 
        .SD(GND_net_1), .LAT(GND_net_1), .Q(\counter[12]_net_1 ));
    SLE \counter[1]  (.D(un2_counter_1_cry_1_S), .CLK(FCCC_0_GL0), .EN(
        VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(VCC_net_1), 
        .SD(GND_net_1), .LAT(GND_net_1), .Q(\counter[1]_net_1 ));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_cry_2 (.A(VCC_net_1), .B(
        \counter[2]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_cry_1_net_1), .S(un2_counter_cry_2_S), .Y(), .FCO(
        un2_counter_cry_2_net_1));
    SLE \counter[3]  (.D(un2_counter_cry_3_S), .CLK(FCCC_0_GL0), .EN(
        VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(VCC_net_1), 
        .SD(GND_net_1), .LAT(GND_net_1), .Q(\counter[3]_net_1 ));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_cry_6 (.A(VCC_net_1), .B(
        \counter[6]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_cry_5_net_1), .S(un2_counter_cry_6_S), .Y(), .FCO(
        un2_counter_cry_6_net_1));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_1_cry_7 (.A(VCC_net_1), .B(
        \counter[7]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_1_cry_6_net_1), .S(), .Y(), .FCO(
        un2_counter_1_cry_7_net_1));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_1_cry_2 (.A(VCC_net_1), .B(
        \counter[2]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_1_cry_1_net_1), .S(), .Y(), .FCO(
        un2_counter_1_cry_2_net_1));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_1_cry_6 (.A(VCC_net_1), .B(
        \counter[6]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_1_cry_5_net_1), .S(), .Y(), .FCO(
        un2_counter_1_cry_6_net_1));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_1_cry_11 (.A(VCC_net_1), 
        .B(\counter[11]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_1_cry_10_net_1), .S(), .Y(), .FCO(
        un2_counter_1_cry_11_net_1));
    SLE \counter[11]  (.D(un2_counter_cry_11_S), .CLK(FCCC_0_GL0), .EN(
        VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(VCC_net_1), 
        .SD(GND_net_1), .LAT(GND_net_1), .Q(\counter[11]_net_1 ));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_1_cry_12 (.A(VCC_net_1), 
        .B(\counter[12]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_1_cry_11_net_1), .S(), .Y(), .FCO(
        un2_counter_1_cry_12_net_1));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_1_cry_16 (.A(VCC_net_1), 
        .B(\counter[16]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_1_cry_15_net_1), .S(), .Y(), .FCO(
        un2_counter_1_cry_16_net_1));
    SLE \counter[18]  (.D(un2_counter_s_18_S), .CLK(FCCC_0_GL0), .EN(
        VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(VCC_net_1), 
        .SD(GND_net_1), .LAT(GND_net_1), .Q(\counter[18]_net_1 ));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_cry_15 (.A(VCC_net_1), .B(
        \counter[15]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_cry_14_net_1), .S(un2_counter_cry_15_S), .Y(), 
        .FCO(un2_counter_cry_15_net_1));
    CFG4 #( .INIT(16'hB800) )  \LED[0]  (.A(\sh_lft[0]_net_1 ), .B(
        pb_reg2_net_1), .C(\counter[18]_net_1 ), .D(AND2_0_Y), .Y(
        LED_c[0]));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_cry_10 (.A(VCC_net_1), .B(
        \counter[10]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_cry_9_net_1), .S(un2_counter_cry_10_S), .Y(), .FCO(
        un2_counter_cry_10_net_1));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_cry_11 (.A(VCC_net_1), .B(
        \counter[11]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_cry_10_net_1), .S(un2_counter_cry_11_S), .Y(), 
        .FCO(un2_counter_cry_11_net_1));
    SLE \counter[13]  (.D(un2_counter_cry_13_S), .CLK(FCCC_0_GL0), .EN(
        VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(VCC_net_1), 
        .SD(GND_net_1), .LAT(GND_net_1), .Q(\counter[13]_net_1 ));
    SLE \counter[0]  (.D(\counter_i_0[0] ), .CLK(FCCC_0_GL0), .EN(
        VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(VCC_net_1), 
        .SD(GND_net_1), .LAT(GND_net_1), .Q(\counter[0]_net_1 ));
    ARI1 #( .INIT(20'h4AA00) )  un2_counter_cry_12 (.A(VCC_net_1), .B(
        \counter[12]_net_1 ), .C(GND_net_1), .D(GND_net_1), .FCI(
        un2_counter_cry_11_net_1), .S(un2_counter_cry_12_S), .Y(), 
        .FCO(un2_counter_cry_12_net_1));
    SLE \counter[10]  (.D(un2_counter_cry_10_S), .CLK(FCCC_0_GL0), .EN(
        VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(VCC_net_1), 
        .SD(GND_net_1), .LAT(GND_net_1), .Q(\counter[10]_net_1 ));
    SLE pb_reg1 (.D(PB_SW_c), .CLK(FCCC_0_GL0), .EN(VCC_net_1), .ALn(
        AND2_0_Y), .ADn(GND_net_1), .SLn(VCC_net_1), .SD(GND_net_1), 
        .LAT(GND_net_1), .Q(pb_reg1_net_1));
    SLE \counter[9]  (.D(un2_counter_cry_9_S), .CLK(FCCC_0_GL0), .EN(
        VCC_net_1), .ALn(AND2_0_Y), .ADn(VCC_net_1), .SLn(VCC_net_1), 
        .SD(GND_net_1), .LAT(GND_net_1), .Q(\counter[9]_net_1 ));
    
endmodule


module Top_FCCC_0_FCCC(
       FCCC_0_GL0,
       FCCC_0_LOCK,
       OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC
    );
output FCCC_0_GL0;
output FCCC_0_LOCK;
input  OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC;

    wire GL0_net, VCC_net_1, GND_net_1;
    
    VCC VCC (.Y(VCC_net_1));
    GND GND (.Y(GND_net_1));
    CLKINT GL0_INST (.A(GL0_net), .Y(FCCC_0_GL0));
    CCC #( .INIT(210'h0000007FA8000045574000718C6318C2318C1DEC040404A000104)
        , .VCOFREQUENCY(640.0) )  CCC_INST (.Y0(), .Y1(), .Y2(), .Y3(), 
        .PRDATA({nc0, nc1, nc2, nc3, nc4, nc5, nc6, nc7}), .LOCK(
        FCCC_0_LOCK), .BUSY(), .CLK0(VCC_net_1), .CLK1(VCC_net_1), 
        .CLK2(VCC_net_1), .CLK3(VCC_net_1), .NGMUX0_SEL(GND_net_1), 
        .NGMUX1_SEL(GND_net_1), .NGMUX2_SEL(GND_net_1), .NGMUX3_SEL(
        GND_net_1), .NGMUX0_HOLD_N(VCC_net_1), .NGMUX1_HOLD_N(
        VCC_net_1), .NGMUX2_HOLD_N(VCC_net_1), .NGMUX3_HOLD_N(
        VCC_net_1), .NGMUX0_ARST_N(VCC_net_1), .NGMUX1_ARST_N(
        VCC_net_1), .NGMUX2_ARST_N(VCC_net_1), .NGMUX3_ARST_N(
        VCC_net_1), .PLL_BYPASS_N(VCC_net_1), .PLL_ARST_N(VCC_net_1), 
        .PLL_POWERDOWN_N(VCC_net_1), .GPD0_ARST_N(VCC_net_1), 
        .GPD1_ARST_N(VCC_net_1), .GPD2_ARST_N(VCC_net_1), .GPD3_ARST_N(
        VCC_net_1), .PRESET_N(GND_net_1), .PCLK(VCC_net_1), .PSEL(
        VCC_net_1), .PENABLE(VCC_net_1), .PWRITE(VCC_net_1), .PADDR({
        VCC_net_1, VCC_net_1, VCC_net_1, VCC_net_1, VCC_net_1, 
        VCC_net_1}), .PWDATA({VCC_net_1, VCC_net_1, VCC_net_1, 
        VCC_net_1, VCC_net_1, VCC_net_1, VCC_net_1, VCC_net_1}), 
        .CLK0_PAD(GND_net_1), .CLK1_PAD(GND_net_1), .CLK2_PAD(
        GND_net_1), .CLK3_PAD(GND_net_1), .GL0(GL0_net), .GL1(), .GL2()
        , .GL3(), .RCOSC_25_50MHZ(
        OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC), .RCOSC_1MHZ(
        GND_net_1), .XTLOSC(GND_net_1));
    
endmodule


module Top_OSC_0_OSC(
       OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC
    );
output OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC;

    wire GND_net_1, VCC_net_1;
    
    RCOSC_25_50MHZ #( .FREQUENCY(50.0) )  I_RCOSC_25_50MHZ (.CLKOUT(
        OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC));
    VCC VCC (.Y(VCC_net_1));
    GND GND (.Y(GND_net_1));
    
endmodule


module Top(
       LED,
       DEVRST_N,
       PB_SW
    );
output [1:0] LED;
input  DEVRST_N;
input  PB_SW;

    wire FCCC_0_LOCK, SYSRESET_0_POWER_ON_RESET_N, AND2_0_Y, 
        OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC, FCCC_0_GL0, 
        VCC_net_1, GND_net_1, PB_SW_c, \LED_c[0] , \LED_c[1] , 
        AND2_0_net_1;
    
    OUTBUF \LED_obuf[1]  (.D(\LED_c[1] ), .PAD(LED[1]));
    OUTBUF \LED_obuf[0]  (.D(\LED_c[0] ), .PAD(LED[0]));
    LED_ctrl LED_ctrl_0 (.LED_c({\LED_c[1] , \LED_c[0] }), .AND2_0_Y(
        AND2_0_Y), .FCCC_0_GL0(FCCC_0_GL0), .PB_SW_c(PB_SW_c));
    GND GND (.Y(GND_net_1));
    VCC VCC (.Y(VCC_net_1));
    SYSRESET SYSRESET_0 (.POWER_ON_RESET_N(SYSRESET_0_POWER_ON_RESET_N)
        , .DEVRST_N(DEVRST_N));
    INBUF PB_SW_ibuf (.PAD(PB_SW), .Y(PB_SW_c));
    Top_FCCC_0_FCCC FCCC_0 (.FCCC_0_GL0(FCCC_0_GL0), .FCCC_0_LOCK(
        FCCC_0_LOCK), .OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC(
        OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC));
    CLKINT AND2_0_RNIKOS1 (.A(AND2_0_net_1), .Y(AND2_0_Y));
    AND2 AND2_0 (.A(FCCC_0_LOCK), .B(SYSRESET_0_POWER_ON_RESET_N), .Y(
        AND2_0_net_1));
    Top_OSC_0_OSC OSC_0 (
        .OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC(
        OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC));
    
endmodule
