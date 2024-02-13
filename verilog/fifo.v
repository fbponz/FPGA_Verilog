module FIFO #(parameter WIDTH = 16, DEPTH = 256)
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
    always @(posedge i_Clk or negedge i_Rst_L)
    begin
   if (~i_Rst_L)
    begin
      r_Wr_Addr <= 0;
      r_Rd_Addr <= 0;
      r_Count   <= 0;
    end
    else
    begin
     if (i_Wr_DV)
      begin
        if (r_Wr_Addr == DEPTH-1)
                  r_Wr_Addr <= 0;
        else
          r_Wr_Addr <= r_Wr_Addr + 1;
      end
    if (i_Rd_En)
     begin
       if (r_Rd_Addr == DEPTH-1)
         r_Rd_Addr <= 0;
       else
         r_Rd_Addr <= r_Rd_Addr + 1;
     end
    if (i_Rd_En & ~i_Wr_DV)
     begin
       if (r_Count != 0)
       begin
         r_Count <= r_Count - 1;
       end
     end
    else if (i_Wr_DV & ~i_Rd_En)
     begin
       if (r_Count != DEPTH)
       begin
         r_Count <= r_Count + 1;
       end
     end
      if (i_Rd_En)
      begin
        o_Rd_Data <= w_Rd_Data;
      end
    end // else: !if(~i_Rst_L)
  end // always @ (posedge i_Clk or negedge i_Rst_L)
 assign o_Full  = (r_Count == DEPTH) ||
                   (r_Count == DEPTH-1 && i_Wr_DV && !i_Rd_En);
  assign o_Empty = (r_Count == 0);
  assign o_AF_Flag = (r_Count > DEPTH - i_AF_Level);
  assign o_AE_Flag = (r_Count < i_AE_Level);
endmodule