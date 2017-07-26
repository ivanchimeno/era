library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity QREG is
	port(
	--inputs 
		clk: in std_logic; -- clk signal á 50 MHz
		rst: in std_logic; -- rst signal 
		f: in std_logic_vector(15 downto 0); -- data input 
		--q: in std_logic_vector(15 downto 0); -- model for q' input, not needed in this project.
		ce_write: in std_logic; -- ce write signal
		ce_read: in std_logic; -- ce read signal 
	--outputs
		q_out: out std_logic_vector(15 downto 0) -- output for qreg
	);
end QREG;


architecture v1 of QREG is

	signal q_mem: std_logic_vector(15 downto 0); -- memory signal  

	begin 
		process(clk)
			begin 				
				if rising_edge(clk) then
				
				-- synchronous reset
					if rst='1' then 
						q_out <= "UUUUUUUUUUUUUUUU";
						q_mem <= "UUUUUUUUUUUUUUUU";
					end if;
					
				--writing process
					if ce_write='1' then 
						q_mem <= f;
						q_out <= f; 
						-- || OPTIONIAL ||
						-- instead of q_out <= f; 
						-- use q_out <= "UUUUUUUUUUUUUUUU";
						-- latter makes the gtkwave simulation easier to read.  
					end if;
					
				--reading process
					if ce_read='1' then 
						q_out <= q_mem;
					end if;
					
				end if;
		end process;
end v1;

