library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_semaforo is
end tb_semaforo;

architecture sim of tb_semaforo is
    signal clk, rst, btn : std_logic := '0';
    signal verde, amarelo, vermelho : std_logic;
begin
    uut: entity work.semaforo
        port map (
            clk => clk,
            rst => rst,
            btn => btn,
            verde => verde,
            amarelo => amarelo,
            vermelho => vermelho
        );

    clk_process: process
    begin
        while true loop
            clk <= '0'; wait for 5 ns;
            clk <= '1'; wait for 5 ns;
        end loop;
    end process;

    stim_proc: process
    begin
        rst <= '1'; wait for 20 ns; rst <= '0';

        wait for 60 ns;

        btn <= '1'; wait for 20 ns;
        btn <= '0';

        wait for 200 ns;
        wait;
    end process;
end sim;
