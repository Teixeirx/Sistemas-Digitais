library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detector_seq is
    Port (
        clk, rst : in STD_LOGIC;
        din : in STD_LOGIC;
        detect : out STD_LOGIC
    );
end entity;

architecture Behavioral of detector_seq is
    type state_type is (S0, S1, S2, S3, S4, S5);
    signal state, next_state : state_type;
begin
    process(clk, rst)
    begin
        if rst = '1' then
            state <= S0;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    process(state, din)
    begin
        next_state <= state;
        detect <= '0';
        case state is
            when S0 =>
                if din = '1' then next_state <= S1; end if;
            when S1 =>
                if din = '1' then next_state <= S2;
                else next_state <= S0; end if;
            when S2 =>
                if din = '0' then next_state <= S3;
                else next_state <= S2; end if;
            when S3 =>
                if din = '1' then next_state <= S4;
                else next_state <= S0; end if;
            when S4 =>
                if din = '0' then next_state <= S5;
                else next_state <= S1; end if;
            when S5 =>
                detect <= '1';
                next_state <= S0;
        end case;
    end process;
end Behavioral;
