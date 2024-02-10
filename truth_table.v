always @ (posedge i_Clk)
begin
    if (i_A == 1'b0 && i_B == 1'b0)
        o_Q <= 1'b0;
    else if (i_A == 1'b0 && i_B == 1'b1)
        o_Q <= 1'b1;
    else if (i_A == 1'b1 && i_B == 1'b0)
        o_Q <= 1'b1;
end