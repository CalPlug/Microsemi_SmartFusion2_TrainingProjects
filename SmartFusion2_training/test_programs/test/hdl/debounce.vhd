--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: debounce.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::SmartFusion2> <Die::M2S010> <Package::144 TQ>
-- Author: <Name>
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;

entity debounce is
port (
    --<port_name> : <direction> <type>;
	clk        : IN  std_logic; -- example
    button     : IN  std_logic;
    led        : OUT std_logic  -- example
    --<other_ports>;
);
end debounce;
architecture architecture_debounce of debounce is
    signal button_on : std_logic;
begin
   process(clk)
   begin
        if (clk'EVENT and clk='1') then
             button_on <= button;
        else
             button_on <= button_on;
        end if;
   end process;
   -- architecture body
end architecture_debounce;
