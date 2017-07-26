library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity tb_qreg is
end entity;


architecture behaviour of tb_qreg is

	constant period : time := 20 ns; -- period based on 50 MHz
	signal clk, rst: std_logic;
	signal f: std_logic_vector(15 downto 0);
	signal ce_write, ce_read: std_logic;
	signal q_out: std_logic_vector(15 downto 0);
	
		
	begin

	UUT: entity WORK.QREG(v1)
	port map (clk, rst, f, ce_write, ce_read, q_out);


		--generates the CLK signal
			process
			begin
				while 1=1 loop
					clk <= '0';
					wait for (period/2); --
					clk <= '1';
					wait for (period/2);
				end loop;
			end process;
	
		-- test input, executes one write and one read cycle 
			process 
				begin 
				
				--initialize input
					rst <= '0';
					f <= "1111111111111111"; --datenwort
					ce_write <= '0';
					ce_read <='0';
					wait for period;
				
				--execute write cycle 
					ce_write <= '1';
					wait for period;
				
					ce_write <= '0';
					f <= "UUUUUUUUUUUUUUUU"; --reset
					wait for period*5;
				
				-- execute read cycle 
					ce_read <= '1';
					wait for period;
					
					ce_read <= '0';
					wait for period*5;
					
				-- check if the output matches 
					if q_out /= "1111111111111111" then 
						report "q_out does not match expected!"
						severity warning;
					end if;
					wait for period*2;
					
				-- reset entire mem 	
					rst <= '1';
					wait for period*5;
	
	
			end process;
end behaviour;	
	