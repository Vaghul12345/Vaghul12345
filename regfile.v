module regfile(data_in,writenum,write,readnum,clk,data_out);
input [15:0] data_in;
input [2:0] writenum, readnum;
input write, clk;
output [15:0] data_out;

wire [15:0] en, R0,R1,R2,R3,R4,R5,R6,R7;



//
module vDFFE(clk, en, in,out)
parameter n = 16;
input clk, en;
input [n-1:0] in;
output [n-1:0] out;
reg [n-1:0] out;
wire [n-1:0] next_out;
assign next_out = en ? in : out;

always @ (posedge clk)
out = next_out;
endmodule



endmodule
