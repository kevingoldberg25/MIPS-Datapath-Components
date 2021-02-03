library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Memory_IO is
    Port ( clock : in STD_LOGIC;
           MemWrite : in STD_LOGIC;
           MemRead  : in STD_LOGIC;
           Din : in STD_LOGIC_VECTOR(7 downto 0);
           ALUout : in STD_LOGIC_VECTOR(31 downto 0);
           Data2 : in STD_LOGIC_VECTOR(31 downto 0);
           ReadData : in STD_LOGIC_VECTOR(31 downto 0);
           Regfile : out STD_LOGIC_VECTOR(31 downto 0);
           Dout : out STD_LOGIC_VECTOR(31 downto 0));
           
end Memory_IO;

architecture Behavioral of Memory_IO is

signal temp: std_logic_vector(31 downto 0);
signal mem: std_logic_vector(1 downto 0);
signal lw: std_logic;

begin

lw <= '1' when (MemRead = '1' and ALUout = x"00000030") else '0';

mem <= "11" when (MemWrite = '1' and ALUout /= x"00000034") else (lw & MemWrite);

with mem select
    temp <= x"000000" & Din when "10",
        Data2 when "01",
        ALUOut when others;

Dout <= temp;
RegFile <= temp;

end Behavioral;
