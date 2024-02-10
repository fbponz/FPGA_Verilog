process (i_Clk)
begin
    if rising_edge(i_Clk) then
        and_gate <= input_1 and input_2;
    end if;
end process;