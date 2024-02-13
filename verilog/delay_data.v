reg [3:0] r_shift;
always @ (posedge i_Clk)
begin
    r_shift[0] <= i_Data_To_Delay;
    r_shift[3:1] <= r_shift[2:0];
end