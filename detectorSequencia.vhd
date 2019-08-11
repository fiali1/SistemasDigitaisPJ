library ieee;
use ieee.std_logic_1164.all;

entity detectorSequencia is
    port (
        RESET, CLK, X : in std_logic;
        Z : out std_logic
    );
end entity detectorSequencia;

architecture rtl of detectorSequencia is
    type state is (A, B, C, D);
    signal atual : state;
    signal proximo : state;
begin
    reg : process(CLK, RESET)
    begin
        if RESET = '1' then
            atual <= A;
        elsif rising_edge(CLK) then
            atual <= proximo;
        end if;
    end process reg;

    proximoEstado : process (X, atual)
    begin
        case atual is
            when A =>
                if X = '1' then
                    proximo <= B;
                else
                    proximo <= A;
                end if;
            when B =>
                if X = '0' then
                    proximo <= C;
                else
                    proximo <= B;
                end if;
            when C =>
                if X = '1' then
                    proximo <= D;
                else
                    proximo <= A;
                end if;
            when D =>
                if X = '1' then
                    proximo <= B;
                else
                    proximo <= C;
                end if;
        
            when others => NULL;
        end case;
    end process proximoEstado;
                
    Z <= '1' when (atual = D and X = '1') else '0';

end architecture rtl;
