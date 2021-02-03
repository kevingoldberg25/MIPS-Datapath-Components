library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX is
Port (  D0, D1 : in STD_LOGIC_VECTOR(31 downto 0);
        S : in STD_LOGIC;
        F : out STD_LOGIC_VECTOR(31 downto 0));
end MUX;

architecture Behavioral of MUX is
begin

F <= D0 WHEN S = '0' ELSE D1;

end Behavioral;
