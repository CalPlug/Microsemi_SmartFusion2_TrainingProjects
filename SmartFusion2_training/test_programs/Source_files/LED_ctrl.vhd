--------------------------------------------------------------------------------
-- Company: Microsemi SoC Products Group
--
-- File: LED_ctrl.vhd
-- File history:
--      1.0: January 7, 2013: Written
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- Drives LEDs on SmartFusion2 Starter Kit
-- PS_SW is S2 on the Starter Kit board
--
-- Targeted device: <Family::SmartFusion2> <Die::M2S050T> <Package::896 FBGA>
-- Author: Tim McCarthy
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity LED_ctrl is
port (
	CLK: in std_logic;
	RESETn: in std_logic;   
	PB_SW: in std_logic;
	LED: out std_logic_vector(1 downto 0)
);
end LED_ctrl;

architecture RTL of LED_ctrl is

-- signal declarations
signal pb_reg1: std_logic;
signal pb_reg2: std_logic;
signal counter: std_logic_vector(18 downto 0);
signal sh_lft: std_logic_vector(1 downto 0);
signal sh_clk: std_logic;

begin

-- Register PushButton input
PB_reg: process (CLK, RESETn)
begin
	if (RESETn = '0') then
	  pb_reg1 <= '1';
	  pb_reg2 <= '1';
	elsif (CLK'event and CLK = '1') then
	  pb_reg1 <= PB_SW;
	  pb_reg2 <= pb_reg1;
	end if;
 end process PB_reg;

-- free running binary counter
CNTR: process (CLK, RESETn)
begin
	if (RESETn = '0') then
	  counter <= (others => '0');
	elsif (CLK'event and CLK = '1') then
	  counter <= counter + 1;
	end if;
end process CNTR;

sh_clk <= counter(17);			-- clock for shift registers

-- shift left
SFT_L: process (sh_clk, RESETn)
begin
	if (RESETn = '0') then
	  sh_lft <= "10";
	elsif (sh_clk'event and sh_clk = '1') then
	  sh_lft <= sh_lft(0) & sh_lft(1);
	end if;
end process SFT_L;

-- LED display
DISP: process (RESETn, pb_reg2, sh_lft, counter(18))
begin
	if (RESETn = '0') then
		LED <= "00";											-- LEDs are off
	else
		case (pb_reg2) is
			when '0' => LED <= (counter(18) & counter(18));		-- blink LEDs (S2 depressed)
			when '1' => LED <= sh_lft;							-- shift left (S2 released)
			when others => LED <= "00";							-- LEDs off
		end case;
	end if;
end process DISP;

end RTL;