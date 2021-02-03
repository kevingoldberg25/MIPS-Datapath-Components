library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity ALU is
Port(     A, B     : in  STD_LOGIC_VECTOR (31 downto 0);
          ALUCntl  : in  STD_LOGIC_VECTOR (3 downto 0);
          Carryin  : in  STD_LOGIC;
          ALUOut   : out  STD_LOGIC_VECTOR (31 downto 0);
          Zero     : out  STD_LOGIC;
          Carryout : out std_logic;
          Overflow : out  STD_LOGIC);
end ALU; 

architecture Behavioral of ALU is

signal ALU_Result: std_logic_vector (31 downto 0);
signal slt_result: signed(31 downto 0);
signal slt_result_u: unsigned(31 downto 0); 
signal add_result,sub_result: signed(32 downto 0);
signal a32,b32: std_logic_vector(32 downto 0);
signal add_result_u,sub_result_u: unsigned(32 downto 0);
signal c32: std_logic_vector(32 downto 0):=(others=>'0');
signal add_ov,sub_ov:std_logic;

begin
   with ALUCntl select
   ALU_Result <= std_logic_vector(add_result(31 downto 0)) when "0010", --Add
                std_logic_vector(add_result_u(31 downto 0)) when "1010", --Add
                std_logic_vector(sub_result(31 downto 0)) when "0110", --sub
                std_logic_vector(sub_result_u(31 downto 0)) when "1110", --sub
                std_logic_vector(slt_result (31 downto 0)) when "0111",
                std_logic_vector(slt_result_u (31 downto 0)) when "0101",
                A AND B when "0000",
                A OR  B when "0001",
                A XOR B when "0011",
                A NOR B when "1100",
                A when others;---condition for all other alu control signals
ALUOut  <= ALU_Result; 

slt_result <= x"00000001" when signed(A) < signed(B) else x"00000000"; 
slt_result_u <= x"00000001" when unsigned(A) < unsigned(B) else x"00000000";

----Addition Operation and carry out generation-----	
   a32   <='0'& A;
   b32   <='0'& B;
   c32(0)<=Carryin;
   add_result<= signed(a32) + signed(b32) + signed(c32);
   sub_result<= signed(a32) - signed(b32);
   add_result_u<= unsigned(a32) + unsigned(b32) + unsigned(c32);
   sub_result_u<= unsigned(a32) - unsigned(b32);
---Zero flag-----------------------------	
   Zero <= '1' when ALU_Result =x"00000000" else '0';
---Overflow flag---------------------------------------
   add_ov<= (A(31)and B(31)       and (not alu_result(31))) or ((not A(31))and (not B(31)) and alu_result(31));
   sub_ov<= (A(31)and (not B(31)) and (not alu_result(31))) or ((not A(31))and B(31)       and alu_result(31)); 
   with ALUCntl select
      Overflow<= add_ov when "0010",
                 sub_ov when "0110",
                 'Z' when others;
---Carryout-------------------------------------------------
  With ALUCntl select 
     Carryout<= add_result(32) when "0010",
                sub_result(32) when "0110",
                add_result_u(32) when "1010",
                sub_result_u(32) when "1110",                
                'Z' when others;
end Behavioral;

