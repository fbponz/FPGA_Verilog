// Synchronous reset
always @ (posedge i_Clk)
begin
    if (i_Reset)
        o_Q <= 1'b1;
end

// Asynchronous reset
always @ (posedge i_Clk or i_Reset)
begin
    if (i_Reset)
        o_Q <= 1'b1;
end