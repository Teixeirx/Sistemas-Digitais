library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- necessário para usar to_unsigned

entity testbench is
end entity;

architecture sim of testbench is
    signal a, b  : std_logic_vector(1 downto 0);
    signal soma  : std_logic_vector(2 downto 0);
begin
    -- Instancia o somador
    uut: entity work.somador_2bits
        port map (
            a    => a,
            b    => b,
            soma => soma
        );

    -- Gera todas as combinações possíveis
    process
    begin
        for i in 0 to 3 loop
            for j in 0 to 3 loop
                a <= std_logic_vector(to_unsigned(i, 2));
                b <= std_logic_vector(to_unsigned(j, 2));
                wait for 10 ns;
            end loop;
        end loop;
        wait; -- encerra a simulação
    end process;
end architecture;
