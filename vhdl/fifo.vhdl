process (i_Clk, i_Rst_L) is
  begin
   if not i_Rst_L then
      r_Wr_Addr <= 0;
      r_Rd_Addr <= 0;
      r_Count   <= 0;
    elsif rising_edge(i_Clk) then
 
     if i_Wr_DV then
        if r_Wr_Addr = DEPTH-1 then
          r_Wr_Addr <= 0;
        else
          r_Wr_Addr <= r_Wr_Addr + 1;
        end if;
      end if;
     if i_Rd_En then
        if r_Rd_Addr = DEPTH-1 then
          r_Rd_Addr <= 0;
        else
          r_Rd_Addr <= r_Rd_Addr + 1;
        end if;
      end if;
     if i_Rd_En = '1' and i_Wr_DV = '0' then
        if (r_Count /= 0) then
          r_Count <= r_Count - 1;
        end if;
     elsif i_Wr_DV = '1' and i_Rd_En = '0' then
        if r_Count /= DEPTH then
          r_Count <= r_Count + 1;
        end if;
      end if;
      if i_Rd_En = '1' then
        o_Rd_Data <= w_Rd_Data;
      end if;
 
    end if;
  end process;
 
 o_Full <= '1' when ((r_Count = DEPTH) or
                      (r_Count = DEPTH-1 and i_Wr_DV = '1' and i_Rd_En = '0'))
                     else '0';
  o_Empty <= '1' when (r_Count = 0) else '0';
 
  o_AF_Flag <= '1' when (r_Count > DEPTH - i_AF_Level) else '0';
  o_AE_Flag <= '1' when (r_Count < i_AE_Level) else '0';