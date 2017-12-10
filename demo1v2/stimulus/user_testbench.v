//--------------------------------------------------------------------------------
// Company: Microsemi SoC Products Group
//
// File: user_testbench.vhd
// File history:
//      1.0: January 7, 2013: Written
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// Testbench for SmartFusion2 Fabric design lab
//
// Targeted device: <Family::SmartFusion2> <Die::M2S050T> <Package::896 FBGA>
// Author: Tim McCarthy
//
//--------------------------------------------------------------------------------
`timescale 1 ns/100 ps

module testbench;

	reg PB_SW_in;
	reg RST_SW_in;

	initial
		begin
		RST_SW_in = 1'b1;
		PB_SW_in = 1'b1;
		#10
		RST_SW_in = 1'b0;
		#20
		RST_SW_in = 1'b1;
		#499970
		PB_SW_in = 1'b0;
		#500000
		PB_SW_in = 1'b1;
		end

    // Instantiate Unit Under Test:  Fabric_Top
    Fabric_Top Fabric_Top_0
		( 
         // Inputs
		.DEVRST_N(RST_SW_in),
        .PB_SW(PB_SW_in),

         // Outputs
         .LED( )
        );

endmodule
