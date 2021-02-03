library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALUControl is
    Port (Funhex : in STD_LOGIC_VECTOR (5 downto 0); 
          Opcode : in STD_LOGIC_VECTOR (5 downto 0); 
          ALUOp : in STD_LOGIC_VECTOR (5 downto 0);
          ALUCntl : out STD_LOGIC_VECTOR (3 downto 0);
          Jump : out STD_LOGIC);
end ALUControl;

architecture Behavioral of ALUControl is
begin

process(Opcode,Funhex,ALUOp)
begin
if Opcode = "000000" then
    if Funhex = "100000" then
         ALUCntl <= "0010";
         Jump <= '0';
    elsif Funhex = "100001" then
          ALUCntl <= "1010";
          Jump <= '0';
    elsif Funhex = "100010" then
          ALUCntl <= "0110";
          Jump <= '0';
    elsif Funhex = "100011" then
          ALUCntl <= "1110";
          Jump <= '0';
    elsif Funhex = "100100" then
          ALUCntl <= "0000";
          Jump <= '0';
    elsif Funhex = "100101" then
          ALUCntl <= "0001";
          Jump <= '0'; 
    elsif Funhex = "100110" then
          ALUCntl <= "0011";
          Jump <= '0';
    elsif Funhex = "100111" then 
          ALUCntl <= "1100";
          Jump <= '0';
    elsif Funhex = "101010" then 
          ALUCntl <= "0111";
          Jump <= '0'; 
    elsif Funhex = "101011" then
          ALUCntl <= "0101";
          Jump <= '0';
    elsif Funhex = "001000" then
          ALUCntl <= "1111";
          Jump <= '1';
    else
          ALUCntl <= "1111"; 
    end if;
                
else
    if ALUOp = "100000" then
         ALUCntl <= "0010";
         Jump <= '0';
    elsif ALUOp = "100001" then
          ALUCntl <= "1010";
          Jump <= '0';
    elsif ALUOp = "100010" then
          ALUCntl <= "0110";
          Jump <= '0';
    elsif ALUOp = "100011" then
          ALUCntl <= "1110";
          Jump <= '0';
    elsif ALUOp = "100100" then
          ALUCntl <= "0000";
          Jump <= '0';
    elsif ALUOp = "100101" then
          ALUCntl <= "0001"; 
          Jump <= '0';
    elsif ALUOp = "100110" then
          ALUCntl <= "0011";
          Jump <= '0';
    elsif ALUOp = "100111" then 
          ALUCntl <= "1100";
          Jump <= '0';
    elsif ALUOp = "101010" then 
          ALUCntl <= "0111";
          Jump <= '0'; 
    elsif ALUOP = "101011" then
          ALUCntl <= "0101";
          Jump <= '0';
    else
          ALUCntl <= "1111";
          Jump <= '0'; 
    end if;
end if;
end process;   
                
end Behavioral;
