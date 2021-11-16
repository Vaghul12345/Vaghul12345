module regfile(data_in,writenum,write,readnum,clk,data_out);
input [15:0] data_in;
input [2:0] writenum, readnum;
input write, clk;
output [15:0] data_out;

wire [15:0]  R0,R1,R2,R3,R4,R5,R6,R7;
  wire [7:0] en;
  wire [7:0] writenumoutput;
  wire [7:0] readnumoutput;
  
  Dec #(3,8) U1(writenum,writenumoutput);
  Dec #(3,8) U2(readnum,readnumoutput);
  
  vDFFE #(16) RR0 (clk, en[0], data_in, R0);
  vDFFE #(16) RR1 (clk, en[1], data_in, R1);
  vDFFE #(16) RR2 (clk, en[2], data_in, R2);
  vDFFE #(16) RR3 (clk, en[3], data_in, R3);
  vDFFE #(16) RR4 (clk, en[4], data_in, R4);
  vDFFE #(16) RR5 (clk, en[5], data_in, R5);
  vDFFE #(16) RR6 (clk, en[6], data_in, R6);
  vDFFE #(16) RR7 (clk, en[7], data_in, R7);
  
  Mux8 #(16) U3 (R7,R6,R5,R4,R3,R2,R1,R0,readnumoutput, data_out); 
  
//Register Load
module vDFFE(clk, en, in,out);
parameter n = 16;
input clk, en; // instantiate clk and load
input [n-1:0] in;
output [n-1:0] out;
reg [n-1:0] out;
wire [n-1:0] next_out;
assign next_out = en ? in : out; // assign next
always @ (posedge clk)
out = next_out;

endmodule
  
//Decoder
module Dec(a,b);
parameter n =3 ;
parameter m =8;
  input [n-1:0] a;
  output [m-1:0] b;
  wire [m-1:0] b = 1 <<a;
endmodule
  
  
  //8-input, k-bit mux with one hot select
  module Mux8(a7,a6,a5,a4,a3,a2,a1,a0,s,b);
  parameter k = 16;
    input [k-1:0] a0, a1, a2, a3,a4, a5, a6, a7; // inputs
    input [7:0] s; // one-hot select
    output [k-1:0] b;  // output
    wire [k-1:0] b = ({k{s[0]}} & a0) |({k{s[1]}} & a1) |({k{s[2]}} & a2) |({k{s[3]}} & a3) |
    ({k{s[4]}} & a4) |({k{s[5]}} & a5) |({k{s[6]}} & a6) |({k{s[7]}} & a7) ;
    
  endmodule  



endmodule
