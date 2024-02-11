-- Carefull this implementation generates a latch, that can be dangerous.
process (i_Clk)
begin
    if rising_edge (i_Clk) then
        if i_A = '0' and i_B = '0' then
            o_Q <= '0';
        elsif i_A = '1' and i_B = '0' then
            o_Q <= '1';
        elsif i_A = '0' and i_B = '1' then
            o_Q <= '1';
        end if;
    end if;
end process;

-- Other possible way to implement the code is like this
process (i_Clk)
begin
    if rising_edge (i_Clk) then
        o_Q <= '0' when (i_A = '0' and i_B = '0') else
       '1' when (i_A = '0' and i_B = '1') else
       '1' when (i_A = '1' and i_B = '0');
    end if;
end process;