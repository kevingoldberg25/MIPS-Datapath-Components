library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_rd is
Port (  Din1, Din2 : in STD_LOGIC_VECTOR(4 downto 0);
        S : in STD_LOGIC;
        Dout : out STD_LOGIC_VECTOR(4 downto 0));
end MUX_rd;

architecture Behavioral of MUX_rd is
begin

Dout <= Din1 WHEN S = '0' ELSE Din2;

end Behavioral;
