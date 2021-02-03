library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUXspecial is
Port (  D0 : in STD_LOGIC_VECTOR(4 downto 0);
        S : in STD_LOGIC;
        F : out STD_LOGIC_VECTOR(4 downto 0));
end MUXspecial;

architecture Behavioral of MUXspecial is
begin

F <= D0 WHEN S = '0' ELSE "11111";

end Behavioral;
