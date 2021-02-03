--========================================================================
---ECE445 Spring 2014
---Data-Memeory containing initial values for jump instructions
---Reading/Writing by word (not by byte)
--========================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

entity datamem is
    Port ( clock      : in std_logic;
	       address    : in  STD_LOGIC_VECTOR (31 downto 0);
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           MemWrite   : in  STD_LOGIC;
           MemRead    : in  STD_LOGIC;
           Read_data  : out  STD_LOGIC_VECTOR (31 downto 0));
end datamem;

architecture Behavioral of datamem is
type datamem1 is array (0 to 63) of std_logic_vector (31 downto 0);
--signal a1,a2,a3,a4:std_logic_vector(7 downto 0);
signal RAM: datamem1:=(
							  x"00000000",--0x00
							  x"00000000",--0x04
							  x"00000000",--0x08
							  x"00000000",--0x0C
							  x"00000000",--0x10
							  x"00000000",--0x14
							  x"00000000",--0x18
							  x"00000000",--0x1C
							  x"00000000",--0x20
							  x"00000000",--0x24
							  x"00000000",--0x28
							  x"00000000",--0x2C
							  x"00000000",--0x30
							  x"00000000",--0x34
							  x"00000000",--0x38
							  x"00000000",--0x3C
							  x"00000000",--0x40
							  x"00000000",--0x44
							  x"00000000",--0x48
							  x"00000000",--0x4C
							  x"00000000",--0x50
							  x"00000000",--0x54
							  x"00000000",--0x58
							  x"00000000",--0x5C
							  x"00000000",--0x60
							  x"00000000",--0x64
							  x"00000000",--0x68
							  x"00000000",--0x6C
							  x"00000000",--0x70
							  x"00000000",--0x74
							  x"00000000",--0x78
							  x"00000000",--0x7C
							  x"00000000",--0x80
							  x"00000000",--0x84
							  x"00000000",--0x88
							  x"00000000",--0x8C
							  x"00000000",--0x90
							  x"00000000",--0x94
							  x"00000000",--0x98
							  x"00000000",--0x9C
							  x"00000000",--0xA0
							  x"00000000",--0xA4
							  x"00000000",--0xA8
							  x"00000000",--0xAC
							  x"00000000",--0xB0
							  x"00000000",--0xB4
							  x"00000000",--0xB8
							  x"00000000",--0xBC
							  x"00000000",--0xC0
							  x"00000000",--0xC4
							  x"00000000",--0xC8
							  x"00000000",--0xCC
							  x"00000000",--0xD0
							  x"00000000",--0xD4
							  x"00000000",--0xD8
							  x"00000000",--0xDC
							  x"00000000",--0xE0
							  x"00000000",--0xE4
							  x"00000000",--0xE8
							  x"00000000",--0xEC
							  x"00000000",--0xF0
							  x"00000000",--0xF4
							  x"00000000",--0xF8
							  x"00000000" --0xFF
                             );	
							

begin
writing:	process(memwrite,clock)	
		begin	
		if(clock'event and clock='1')then
			if(MemWrite='1') then
			   RAM(conv_integer(address(7 downto 2)))<= write_data;
			end if;
		end if;
	end process;
read_data<=RAM(conv_integer(address(7 downto 2))) when memread='1' else x"00000000"; 
end  Behavioral;