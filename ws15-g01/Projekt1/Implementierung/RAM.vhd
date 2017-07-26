library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity RAM is
	port(
	--inputs 
		clk: in std_logic; -- clk signal á 50 MHz
		rst: in std_logic; -- rst signal 
		d: in std_logic_vector(15 downto 0); -- data input
		a_address: in std_logic_vector(15 downto 0); -- a-address input
		b_address: in std_logic_vector(15 downto 0); -- b-address input
		ce_write: in std_logic; -- ce write signal
		ce_read: in std_logic; -- ce read signal 
	--outputs
		a_out: out std_logic_vector(15 downto 0); -- output a
		b_out: out std_logic_vector(15 downto 0) -- output b
	);
end RAM;


architecture v1 of RAM is

	type MEMORY is array(0 to 15) of std_logic_vector(15 downto 0); 
	signal mem: MEMORY; -- type + signal definition of memory array

	begin 
		process(clk)
			begin 				
				if rising_edge(clk) then
						 				
				-- synchronous reset
					if rst='1' then 
						mem <= (OTHERS => "UUUUUUUUUUUUUUUU");
						a_out <= "UUUUUUUUUUUUUUUU";
						b_out <= "UUUUUUUUUUUUUUUU";
					end if;
					
				--writing 
					if ce_write='1' then 
						mem(to_integer(unsigned(b_address(3 downto 0)))) <= d;
						b_out <= d; 
						a_out <= "UUUUUUUUUUUUUUUU"; --default value
					end if;
					
				--reading 
					if ce_read='1' then 
						a_out <= mem(to_integer(unsigned(a_address(3 downto 0))));
						b_out <= mem(to_integer(unsigned(b_address(3 downto 0))));
					end if;
							
				end if;
		end process;
end v1;

