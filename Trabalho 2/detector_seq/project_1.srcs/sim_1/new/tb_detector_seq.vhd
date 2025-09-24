library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_detector_seq is
end tb_detector_seq;

architecture sim of tb_detector_seq is
    signal clk, rst, din, detect : STD_LOGIC;
begin
    UUT: entity work.detector_seq
        port map(clk => clk, rst => rst, din => din, detect => detect);

    clk_process: process
    begin
        clk <= '0'; wait for 5 ns;
        clk <= '1'; wait for 5 ns;
    end process;

    stim_proc: process
    begin
        rst <= '1'; wait for 10 ns; rst <= '0';
        din <= '1'; wait for 10 ns;
        din <= '1'; wait for 10 ns;
        din <= '0'; wait for 10 ns;
        din <= '1'; wait for 10 ns;
        din <= '0'; wait for 10 ns;
        din <= '1'; wait for 50 ns;
        wait;
    end process;
end sim;
