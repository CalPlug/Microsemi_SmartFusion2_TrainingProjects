-- Version: v11.7 11.7.0.119

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity debounce is

    port( clk    : in    std_logic;
          button : in    std_logic;
          led    : out   std_logic
        );

end debounce;

architecture DEF_ARCH of debounce is 

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component OUTBUF
    generic (IOSTD:string := "");

    port( D   : in    std_logic := 'U';
          PAD : out   std_logic
        );
  end component;

    signal GND_net_1, VCC_net_1 : std_logic;

begin 


    \VCC\ : VCC
      port map(Y => VCC_net_1);
    
    \GND\ : GND
      port map(Y => GND_net_1);
    
    led_obuf : OUTBUF
      port map(D => GND_net_1, PAD => led);
    

end DEF_ARCH; 
