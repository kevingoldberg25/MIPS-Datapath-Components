library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IFJUMP is
Port (  J0, J1 : in STD_LOGIC;
        OPCODE : in STD_LOGIC_VECTOR(5 downto 0);
        F : out STD_LOGIC);
end IFJUMP;

architecture Behavioral of IFJUMP is
begin
 with OPCODE select
    F <= J0 when "000000",
         J1 when others;

end Behavioral;
