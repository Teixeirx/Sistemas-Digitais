library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity semaforo is
    Port (
        clk      : in  STD_LOGIC;
        rst      : in  STD_LOGIC;
        btn      : in  STD_LOGIC;
        verde    : out STD_LOGIC;
        amarelo  : out STD_LOGIC;
        vermelho : out STD_LOGIC
    );
end semaforo;

architecture Behavioral of semaforo is
    type state_type is (S_VERDE, S_AMARELO, S_VERMELHO, S_VERMELHO_PED);
    signal state, next_state : state_type;
    signal count : integer := 0;
    signal count_next : integer := 0; -- novo sinal para controlar o count de maneira segura
begin

    -- Processo de mudança de estado
    process(clk, rst)
    begin
        if rst = '1' then
            state <= S_VERDE;
            count <= 0;
        elsif rising_edge(clk) then
            state <= next_state;
            count <= count_next;  -- atualizar count aqui para evitar múltiplas atribuições
        end if;
    end process;

    -- Processo para controlar os estados e o próximo valor de count
    process(state, btn, count)
    begin
        next_state <= state; -- default
        count_next <= count; -- definir o próximo valor de count como o atual por padrão

        case state is
            when S_VERDE =>
                if btn = '1' then
                    next_state <= S_AMARELO;
                else
                    next_state <= S_AMARELO;
                end if;
                count_next <= 0;  -- resetar count

            when S_AMARELO =>
                next_state <= S_VERMELHO;
                count_next <= 0;  -- resetar count

            when S_VERMELHO =>
                if btn = '1' then
                    next_state <= S_VERMELHO_PED;
                else
                    next_state <= S_VERDE;
                end if;
                count_next <= 0;  -- resetar count

            when S_VERMELHO_PED =>
                if count < 1 then
                    next_state <= S_VERMELHO_PED; -- manter o estado por 2 ciclos
                    count_next <= count + 1;  -- incrementar count
                else
                    next_state <= S_VERDE;
                    count_next <= 0;  -- resetar count
                end if;

            when others =>
                next_state <= S_VERDE;
                count_next <= 0;  -- resetar count
        end case;
    end process;

    -- Processo de atribuição das saídas
    process(state)
    begin
        verde <= '0';
        amarelo <= '0';
        vermelho <= '0';

        case state is
            when S_VERDE =>
                verde <= '1';

            when S_AMARELO =>
                amarelo <= '1';

            when S_VERMELHO =>
                vermelho <= '1';

            when S_VERMELHO_PED =>
                vermelho <= '1';

            when others =>
                verde <= '1';
        end case;
    end process;
end Behavioral;
