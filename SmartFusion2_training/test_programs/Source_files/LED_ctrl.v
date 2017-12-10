////////////////////////////////////////////////////////////////////////////////
// Company: Microsemi SoC Products Group
//
// File: LED_ctrl.v
// File history:
//      1.0: January 9, 2013: Written
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// Drives LEDs on SmartFusion2 Starter Kit
// PS_SW is S2 on the Starter Kit board
//
// Targeted device: <Family::SmartFusion2> <Die::M2S050T> <Package::896 FBGA>
// Author: Tim McCarthy
//
////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns/100 ps

module LED_ctrl (CLK, RESETn, PB_SW, LED);

input CLK;
input RESETn;
input PB_SW;
output [1:0] LED;

// declarations
reg pb_reg1;
reg pb_reg2;
reg [18:0] counter;
reg [1:0] sh_lft;
reg [1:0] LED;
wire sh_clk;

// Register PushButton inputs
always @ (posedge CLK or negedge RESETn)
begin
  if (~RESETn)
    begin
    pb_reg1 <= 1'b1;
    pb_reg2 <= 1'b1;
    end
  else
    begin
    pb_reg1 <= PB_SW;
    pb_reg2 <= pb_reg1;
  end
end

// free running binary counter
always @ (posedge CLK or negedge RESETn)
begin
  if (~RESETn)
   counter <= 19'b0;
  else
   counter <= counter + 1'b1;
end

assign sh_clk = counter[17];

// shift left
always @ (posedge sh_clk or negedge RESETn)
begin
  if (~RESETn)
   sh_lft <= 2'b10;
  else
   sh_lft <= {sh_lft[0], sh_lft[1]};
end

// LED display
always @ (*)
begin
  if (~RESETn)
    LED <= 2'b00;							// LEDs off
  else
    case (pb_reg2)
	1'b0:		LED <= {2{counter[18]}};	// blink LEDs (S2 depressed)
	2'b01:		LED <= sh_lft;				// shift left (S2 released)
	default:	LED <= 2'b00;				// LEDs off
    endcase
end

endmodule