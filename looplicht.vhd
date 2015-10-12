----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:27:57 10/12/2015 
-- Design Name: 
-- Module Name:    looplicht - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity looplicht is
    Port ( CLK : in STD_LOGIC;
			  EN : in  STD_LOGIC;
           DIR : in  STD_LOGIC;
           SPEED : in  STD_LOGIC;
           INVERT : in  STD_LOGIC;
           LED : out  STD_LOGIC_VECTOR(7 downto 0));
           
end looplicht;

architecture Behavioral of looplicht is
signal myclk : STD_LOGIC;
signal shift : STD_LOGIC_VECTOR(7 downto 0) := "0000" & "0001";
begin

		clkdiv: process(clk)
		variable x : INTEGER := 0;
		begin
			if clk'event and clk = '1' then
				x := x + 1;
				if x = 25000000 then
					x := 0;
					-- invert the wire
					if en = '1' then
						myclk <= not myclk;
					end if;
				end if;
			end if;
		end process;
		
		runningled : process(myclk)
		begin
			if myclk'event and myclk = '1' then
				shift <= shift(6 downto 0) & shift(7);
			end if;
		end process;
LED <= shift;		
end Behavioral;

