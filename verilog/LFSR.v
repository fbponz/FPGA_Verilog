reg [2:0] r_LFSR;
wire     w_XNOR;
always @(posedge i_Clk)
begin
    r_LFSR <= {r_LFSR[1:0], w_XNOR};
end
assign w_XNOR = r_LFSR[2] ^~ r_LFSR[1];