module regfile(data_in,writenum,write,readnum,clk,data_out);
input [15:0] data_in;
input [2:0] writenum, readnum;
input write, clk;
output [15:0] data_out;

wire [15:0] en, R0,R1,R2,R3,R4,R5,R6,R7;
  wire [7:0] load;
  Dec #(3,8) U1(a,b)

//Register Load
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
  
//Decoder
module Dec(a,b)
parameter n =3 ;
parameter m =8;
  input [n-1:0] a;
  output [m-1:0] b;
  wire [m-1:0] b = 1 <<a;
endmodule
  
  
  //8-input, k-bit mux with one hot select
  module Mux8(a7,a6,a5,a4,a3,a1,a0,s,b);
  parameter k = 16;
    input [k-1:0] a0, a1, a2, a3,a4, a5, a6, a7; // inputs
    input [7:0] s; // one-hot select
    output [k-1:0] b;  // output
    wire [k-1:0] b = ({k{s[0]}} & a0) |({k{s[1]}} & a1) |({k{s[2]}} & a2) |({k{s[3]}} & a3) |
    ({k{s[4]}} & a4) |({k{s[5]}} & a5) |({k{s[6]}} & a6) |({k{s[7]}} & a7) ;
  endmodule  




endmodule
