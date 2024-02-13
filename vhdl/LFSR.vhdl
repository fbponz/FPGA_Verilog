signal r_LFSR : std_logic_vector(2 downto 0)
signal w_XNOR : std_logic;
begin
  process (i_Clk) is
  begin
    if rising_edge(i_Clk) then
        r_LFSR <= r_LFSR(1 downto 0) & w_XNOR;
    end if;
end process;
w_XNOR <= r_LFSR(2) xnor r_LFSR(1);