library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Shiftbytwo is
Port(   Din : in STD_LOGIC_VECTOR (31 downto 0);
        Dout : out STD_LOGIC_VECTOR (31 downto 0));
end Shiftbytwo;

architecture Behavioral of Shiftbytwo is

signal d1 : std_logic_vector(31 downto 0);
signal d2 : unsigned(31 downto 0);

begin

d1 <= Din;
d2 <= shift_left(unsigned(d1),2);
Dout <= std_logic_vector(d2);

end Behavioral;
