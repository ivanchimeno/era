library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_alu is 
end entity;

architecture behaviour of tb_alu is 

	constant period : time := 20 ns; -- period used to simulate the ce signal 
	signal i: std_logic_vector(8 downto 0);
	signal d, a, b, q, zero: std_logic_vector(15 downto 0);
	signal ce: std_logic;
	signal r_out, s_out: std_logic_vector(15 downto 0);
		

	begin 


	UUT: entity WORK.ALU(v1) 
	port map (i, d, a, b, q, zero, ce, r_out, s_out);


		--generates the CE signal
			process
				begin
					while 1=1 loop
						ce <= '0';
						wait for (period/2); --
						ce <= '1';
						wait for (period/2);
					end loop;
				end process;

		--initiates testing 
			process 
				begin 
				
					--initialize all input 
						d <= "0000000000000001"; -- d = 1
						a <= "0000000000000010"; -- a = 2
						b <= "0000000000000011"; -- b = 3
						q <= "0000000000000100"; -- q = 4
						wait for period;
						
						--all reset cases are solely to make the simulation easier to read.
					
						i <= "000000000"; --case 000
						wait for period;
						
						i <= "UUUUUUUUU"; --reset case
						wait for period*2;
						
						i <= "000000001"; --case 001
						wait for period;
						
						i <= "UUUUUUUUU"; --reset case
						wait for period*2;
						
						i <= "000000010"; --case 010
						wait for period;
						
						i <= "UUUUUUUUU"; --reset case
						wait for period*2;
						
						i <= "000000011"; --case 011
						wait for period;
						
						i <= "UUUUUUUUU"; --reset case
						wait for period*2;
						
						i <= "000000100"; --case 100
						wait for period;
						
						i <= "UUUUUUUUU"; --reset case
						wait for period*2;
						
						i <= "000000101"; --case 101
						wait for period;
						
						i <= "UUUUUUUUU"; --reset case
						wait for period*2;
						
						i <= "000000110"; --case 110
						wait for period;
						
						i <= "UUUUUUUUU"; --reset case
						wait for period*2;
						
						i <= "000000111"; --case 111
						wait for period;
						
						i <= "UUUUUUUUU"; --reset case
						wait for period*2;

			end process;
end behaviour;