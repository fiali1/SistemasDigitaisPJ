library ieee;
use ieee.std_logic_1164.all;

entity detectorSequencia_tb is
end entity detectorSequencia_tb;

architecture rtl of detectorSequencia_tb is
    signal RESET : std_logic := '1';
    signal CLK : std_logic := '0';
    signal X : std_logic := '0';
    signal Z : std_logic;    

begin
    uut: 
        entity work.detectorSequencia
        port map (
            RESET => RESET,
            CLK => CLK,
            X => X,
            Z => Z
        );
    CLOCK:
        process
        begin
            wait for 50 ns;
            CLK <= not CLK;
            if Now > 799 ns then
                wait;
            end if;
        end process;
    
    STIMULUS:
        process
        begin
            wait for 25 ns;
            RESET <= '0';
            wait for 100 ns;
            X <= '1';
            wait for 100 ns;
            X <= '0';
            wait for 100 ns;
            X <= '1';
	    wait for 100 ns;
            X <= '1';
            wait;
    end process;
end architecture rtl;
