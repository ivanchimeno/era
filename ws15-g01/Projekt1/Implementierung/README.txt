+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ ERA Praktikum WS 1516 - VHDL                                        +
+---------------------------------------------------------------------+
+ 
+ Projektleiter:	Martin Zinnecker
+ Dokumentation:	Sandra Grujovic
+ Formaler Vortrag:	Ivan Chimeno 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

 // Beschreibung 

		Entwicklung der Module RAM, QREG, und ALU-Quelloperanden-
		auswahl des AM2901 in VHDL. Genauere Angaben sind dem 
		Pflichtenheft und der Spezifikation zu entnehmen.

 // Inhalt 
 
		* RAM.vhd 
		* QREG.vhd
		* ALU.vhd 
			Diese Dateien enthalten die entsprechende Entity und
			die dazugehörige Architektur. 
		
		* tb_ram.vhd 
		* tb_qreg.vhd 
		* tb_alu.vhd 
			Diese Dateien enthalten die jeweiligen Testbenches.
			Bei tb_qreg und tb_ram werden Write und Read Vorgänge
			simuliert. Der Test wiederholt sich anschließend 
			periodisch.
			
		* tb_ram.ghw
		* tb_qreg.ghw
		* tb_alu.ghw
		Enthält eine Mikrosekunde (1000ns) der Simulation der 
		Testbench und lässt sich mit GTK Wave lesen.
		Diese lassen sich auch in den enstprechenden png files
		sehen.

 // Sonstiges
		* kompiliert wurde mit 
			ghdl -a RAM.vhd tb_ram.vhd 
	
			ghdl -e tb_ram
	
			ghdl -r tb_ram --stop-time=1000ns --wave=tb_ram.ghw
		entsprechend die anderen Architekturen.
		