library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity mojobincount is
    Port ( clk,rst : in  STD_LOGIC;
			  led : out  STD_LOGIC_VECTOR (7 downto 0);
			  cclk,spi_ss,spi_mosi,spi_sck,avr_tx,avr_rx_busy : in STD_LOGIC;
			  avr_rx  : out STD_LOGIC :='0';
			  spi_miso: out STD_LOGIC :='0';
			  spi_channel : out STD_LOGIC_VECTOR (3 downto 0):=B"0000");
			  
end mojobincount;

architecture Behavioral of mojobincount is
signal contador : STD_LOGIC_VECTOR (26 downto 0) :=B"000000000000000000000000000";  --Hex 50M=2FAF080
signal leds     : STD_LOGIC_VECTOR (7 downto  0) :=B"00000000";
begin

process(clk,rst)
begin 
if rst = '0' then 
	led<="00000000";
elsif rising_edge(clk) then
   contador <= contador+1;
   if(contador>=x"2FAF080")then
	  leds<=leds+1;
	  led<=leds;
     contador<="000000000000000000000000000";
   end if;
	if(leds>="11111111")then
	  leds<="00000000";
	end if;
end if;
end process;
end Behavioral;

