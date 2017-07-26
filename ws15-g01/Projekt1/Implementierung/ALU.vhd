library IEEE;
use IEEE.std_logic_1164.all;


entity ALU is
	port(
	--inputs 
		i: in std_logic_vector(8 downto 0); -- instruction word
		d: in std_logic_vector(15 downto 0); -- data input d
		a: in std_logic_vector(15 downto 0); -- data input a 
		b: in std_logic_vector(15 downto 0); -- data input b 
		q: in std_logic_vector(15 downto 0); -- data input q 
		zero: in std_logic_vector(15 downto 0); -- data input 0
		ce : in std_logic; -- ce input 
	--outputs
		r_out: out std_logic_vector(15 downto 0); -- output r
		s_out: out std_logic_vector(15 downto 0) -- output s 
	);
end ALU;


architecture v1 of ALU is

	begin 
		
		r_out <= a when (ce='1' and (i(2 downto 0)="000")) 
					or (ce='1' and (i(2 downto 0)="001")) 
			else "0000000000000000" when (ce='1' and (i(2 downto 0)="010"))
					or (ce='1' and (i(2 downto 0)="011"))
					or (ce='1' and (i(2 downto 0)="100"))
			else d when (ce='1' and (i(2 downto 0)="101")) 
					or (ce='1' and (i(2 downto 0)="110")) 
					or (ce='1' and (i(2 downto 0)="111")) 
			else "UUUUUUUUUUUUUUUU";
				
		s_out <= b when (ce='1' and (i(2 downto 0)="001")) 
					or (ce='1' and (i(2 downto 0)="011")) 
			else q when (ce='1' and (i(2 downto 0)="000"))
					or (ce='1' and (i(2 downto 0)="010"))
					or (ce='1' and (i(2 downto 0)="110"))
			else a when (ce='1' and (i(2 downto 0)="100")) 
					or (ce='1' and (i(2 downto 0)="101")) 
			else "0000000000000000" when (ce='1' and (i(2 downto 0)="111")) 
			else "UUUUUUUUUUUUUUUU";

end v1;
