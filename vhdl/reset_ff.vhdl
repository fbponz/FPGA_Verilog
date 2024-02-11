-- Synchronous reset
process (i_Clk)
begin
    if rising_edge(i_Clk) then
        if i_Reset = '1' then
            o_Q <= '1'
        end if;
    end if;
end process;

-- Asynchronous reset
process (i_Clk, i_Reset)
begin
    if (i_Reset = '1') then
        o_Q <= '1';
    elsif rising_edge(i_Clk) then
        --do whatever.
    end if;
end process;