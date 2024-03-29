library ieee;
use ieee.std_logic_1164.all;

entity h4InMux_tb is
end h4InMux_tb;

architecture fourInTest of h4InMux_tb is

	component h4InMux is
		port(uw0, uw1, uw2, uw3: in std_logic;
		s0, s1: in std_logic;
		uy: out std_logic);
	end component;
	
	signal bit3: std_logic:='0';
	signal bit2: std_logic:='0';
	signal bit1: std_logic:='0';
	signal bit0: std_logic:='0';
	signal gEn1: std_logic:='0';
	signal gEn0: std_logic:='0';
	signal output: std_logic;
	
	begin
	
	DUT: h4InMux port map(uw0 => bit0, uw1 => bit1, uw2 => bit2, uw3 => bit3, s0 => gEn0, s1 => gEn1, uy => output);
	stim2: process
	begin
	--output should be 0, 1, 0, 1, 0, 1
	wait for 5ns;
	
	bit0 <= '1';
	
	wait for 5ns;
	
	gEn0 <= '1';
	
	wait for 5ns;
	
	bit1 <= '1';
		
	wait for 5ns;
	
	gEn0 <= '0';
	gEn1 <= '1';
	
	wait for 5ns;
	
	bit2 <= '1';
	
	wait for 5ns;
	wait;
	
	end process;

end fourInTest;