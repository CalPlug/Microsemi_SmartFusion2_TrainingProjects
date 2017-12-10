--------------------------------------------------------------------------------
-- Company: Microsemi SoC Products Group
--
-- File: user_testbench.vhd
-- File history:
--      1.0: January 7, 2013: Written
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- Testbench for SmartFusion2 Fabric design lab
--
-- Targeted device: <Family::SmartFusion2> <Die::M2S050T> <Package::896 FBGA>
-- Author: Tim McCarthy
--
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture behavioral of testbench is
	signal PB_SW_in: std_logic;
	signal RST_SW_in: std_logic;

	component Fabric_Top
    	-- Port list
    	port(
        	-- Inputs
        	DEVRST_N : in  std_logic;
        	PB_SW    : in  std_logic;
       	 -- Outputs
       	 	LED      : out std_logic_vector(1 downto 0)
       	 );
	end component Fabric_Top;

begin
RST_SW_in <= '1', '0' after 10 ns, '1' after 20 ns;
PB_SW_in <= '1', '0' after 500 us, '1' after 1000 us;

    -- Instantiate Unit Under Test:  Fabric_Top
    Fabric_Top_0 : Fabric_Top
        port map( 
            -- Inputs
		DEVRST_N => RST_SW_in,
            PB_SW => PB_SW_in,

            -- Outputs
            LED => open

        );

end behavioral;
