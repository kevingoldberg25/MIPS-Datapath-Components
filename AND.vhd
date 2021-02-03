library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND1 is
Port (     Din1 : in STD_LOGIC;
           Din2 : in STD_LOGIC;
           Dout : out STD_LOGIC);
end AND1;

architecture Behavioral of AND1 is
begin

Dout <= Din1 and Din2;

end Behavioral;
