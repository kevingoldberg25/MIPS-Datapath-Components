library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control is
Port (    OPcodehex : in STD_LOGIC_VECTOR (5 downto 0); 
          Cntl : out STD_LOGIC;
          Branch : out STD_LOGIC;
          Jump: out STD_LOGIC;
          BNE : out STD_LOGIC;
          MemtoReg : out STD_LOGIC;
          ALUOp : out STD_LOGIC_VECTOR (5 downto 0);
          ALUSrc : out STD_LOGIC;
          RegDst : out STD_LOGIC;
          MemWrite : out STD_LOGIC;
          MemRead : out STD_LOGIC);
end Control;

architecture Behavioral of Control is
begin

with OPcodehex select
     Cntl <=  '1' when "000000",
              '1' when "001000",
              '1' when "001001",
              '1' when "001100",
              '1' when "001101",
              '1' when "100011",
              '1' when "001010",
              '1' when "001011",
              '1' when "000010",
              '1' when "000011",
              '0' when others;
              
with OPcodehex select
     Branch <= '1' when "000100",
               '1' when "000101",
               '0' when others;
          
with OPcodehex select
     BNE <= '1' when "000101",
            '0' when others;
              
with OPcodehex select
     MemtoReg <= '1' when "101011",
                 '1' when "100011",
                 '0' when others;
                 
with OPcodehex select
     ALUSrc <= '1' when "001000",
               '1' when "001001",
               '1' when "001100",
               '1' when "001101",
               '1' when "100011",
               '1' when "101011",
               '1' when "001010",
               '1' when "001011",
               '0' when others;
               
with OPcodehex select
     ALUOp <= "100000" when "001000",
              "100001" when "001001",
              "100100" when "001100",
              "100101" when "001101",
              "100000" when "100011",
              "100000" when "101011",
              "100010" when "000100",
              "100010" when "000101",
              "101010" when "001010",
              "101011" when "001011",
              "000000" when others;
              
with OPcodehex select
     RegDst <= '1' when "001000",
               '1' when "001001",
               '1' when "001100",
               '1' when "001101",
               '1' when "100011",
               '1' when "001010",
               '1' when "001011",
               '0' when others;
               
with OPcodehex select
     MemWrite <= '1' when "101011",
                 '0' when others;
                 
with OPcodehex select
     MemRead <= '1' when "100011",
                '0' when others;
        
with OPcodehex select
     Jump <= '1' when "000010",
             '1' when "000011",
             '0' when others;
              
end Behavioral;
