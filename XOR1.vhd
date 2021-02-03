library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR1 is
Port(   Din1 : in STD_LOGIC;
        Din2 : in STD_LOGIC;
        Dout : out STD_LOGIC);
end XOR1;

architecture Behavioral of XOR1 is
begin

Dout <= Din1 xor Din2;

end Behavioral;
