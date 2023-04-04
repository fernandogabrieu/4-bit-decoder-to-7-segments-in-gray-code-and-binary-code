-- Nome Projeto: Trabalho 1
-- Data: 30/03/2023
-- Nome: Fernando_Gabriel/1688936

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY trabalho1 IS
	PORT(SW   : IN  std_logic_vector(5 downto 0);
		  HEX0 : OUT std_logic_vector(0 to 6));
END ENTITY;

ARCHITECTURE logica OF trabalho1 IS
	SIGNAL x: std_logic_vector(0 to 6);
BEGIN

		WITH SW(4 downto 0) SELECT  --seleção para código de acordo com entradas SW 
		x <= "0000001" WHEN "00000", --0 código binário ↓ SW(4) == 0
			  "1001111" WHEN "00001", --1
			  "0010010" WHEN "00010", --2
			  "0000110" WHEN "00011", --3
			  "1001100" WHEN "00100", --4
			  "0100100" WHEN "00101", --5
			  "0100000" WHEN "00110", --6
			  "0001111" WHEN "00111", --7
			  "0000000" WHEN "01000", --8
			  "0000100" WHEN "01001", --9
			  "0000001" WHEN "10000", --0 código gray ↓ SW(4) == 1
			  "1001111" WHEN "10001", --1
			  "0010010" WHEN "10011", --2
			  "0000110" WHEN "10010", --3
			  "1001100" WHEN "10110", --4
			  "0100100" WHEN "10111", --5
			  "0100000" WHEN "10101", --6
			  "0001111" WHEN "10100", --7
			  "0000000" WHEN "11100", --8
			  "0000100" WHEN "11101", --9
			  "0110000" WHEN OTHERS;  --E
			   

		HEX0 <= x WHEN SW(5) = '1' ELSE   --verificação do bit enable → SW(5)
				  "1111111" WHEN SW(5) = '0';
		
END ARCHITECTURE;
		
	