signal r_Shift : std_logic_vector(3 downto 0);
process (i_Clk)
begin
    if rising_edge (i_Clk) then
        r_Shift(0) <= i_Data_To_Delay;
        r_Shift(3 downto 1) <= r_Shift(2 downto 0);
    end if;
end process;