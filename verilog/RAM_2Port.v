module RAM_2Port #(parameter WIDTH = 16, DEPTH = 256)
    (
    // Write signals
    input                     i_Wr_Clk,
    input [$clog2(DEPTH)-1:0] i_Wr_Addr,
    input                     i_Wr_DV,
    input [WIDTH-1:0]         i_Wr_Data,
        // Read signals
    input                     i_Rd_Clk,
    input [$clog2(DEPTH)-1:0] i_Rd_Addr,
    input                     i_Rd_En,
    output reg                o_Rd_DV,
    output reg [WIDTH-1:0]    o_Rd_Data
    );
    reg [WIDTH-1:0] r_Mem[DEPTH-1:0];
    always @ (posedge i_Wr_Clk)
    begin
        if (i_Wr_DV)
        begin
            r_Mem[i_Wr_Addr] <= i_Wr_Data;
        end
    end
    always @ (posedge i_Rd_Clk)
    begin
        o_Rd_Data <= r_Mem[i_Rd_Addr];
        o_Rd_DV   <= i_Rd_En;
    end
endmodule