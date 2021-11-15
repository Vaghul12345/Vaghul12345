module alu(Ain,Bin,ALUop,out,Z);
  input[15:0] Ain, Bin;
  input [1:0] ALUop;
  output [15:0] out;
  output Z;

  //Always block for each case of ALU operation
  always @(*)
    casex(ALUop)
      2'b00: out = Ain+Bin;
      2'b01  out = Ain-Bin;
      2'b10  out = Ain & Bin;
      2'b11  out = ~Bin;
      default out = 16'bxxxxxxxxxxxxxxxx;
    endcase
  
  //Special case, if out is 0, then Z is 1
  if(out == 16'b0000000000000000)
    Z = 1'b1;
  else
    Z = 1'b0;
  end
endmodule
