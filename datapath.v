module datapath(clk,readnum,vsel,loada,loadb,shift,asel,bsel,ALUop,loadc,loads,writenum,write,datapath_in,Z_out,datapath_out);

  input clk, loada, loadb, loadc, loads, asel, bsel, vsel,write;
  input [15:0] datapath_in;
  input [2:0] readnum, writenum;
  input [1:0] ALUop,shift;
  output [15:0] datapath_out;
  output Z_out;
  
  reg [15:0] data_in,data_out, A_out, B_Out, sout,Ain, Bin, out;
 
  wire Z;
  
  //Declaring the D Flip Flops
  vDFFb #(16) A (clk, loada, data_out, A_out);
  vDFFb #(16) B (clk, loadb, data_out, B_out);
  vDFFb #(16) C (clk, loadc, datapath_out);
  vDFFc #(1) status (clk,loads, Z, Z_out);
  
  
  //Declaring the Mux's
  Mux2 #(16) in(datapath_in,datapath_out,vsel,data_in); 
  Mux2 #(16) amux(A_out,16'b0000000000000000,asel,Ain); 
  Mux2 #(16) bmux(B_out,{11'b00000000000,datapath_in[4:0]},bsel,Bin);
  
  //Declaring the Shifter
  shifter U1(B_out, shift, sout);
  
  //Declaring the ALU
  alu U2(Ain,Bin,ALUop, out,Z);
  
  //Declaring regFile
  regfile REGFILE (data_in,writenum,write,readnum,clk,data_out);
  
endmodule

//Register Load
module vDFFb(clk, en, in,out);
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


//Register Load
module vDFFc(clk, en, in,out);
input clk, en; // instantiate clk and load
input  in;
output  out;
reg  out;
wire  next_out;
assign next_out = en ? in : out; // assign next
always @ (posedge clk)
out = next_out;
endmodule

//mux2
module Mux2(a0,a1,s,b);
  parameter k = 16;
  input [k-1:0] a0,a1; // inputs
    input [7:0] s; // one-hot select
    output [k-1:0] b;  // output
    wire [k-1:0] b = ({k{s[0]}} & a0) |({k{s[1]}} & a1);
    
  endmodule  
  
