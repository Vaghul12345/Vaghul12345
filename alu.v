
module alu(Ain,Bin,ALUop,out,Z);
  input Ain, Bin;
  input [1:0] ALUop;
  output out;
  output Z;
  wire [15:0] Ain, Bin;
  reg Z;
  reg [15:0] out;

  //Always block for each case of ALU operation
  always @(*) begin
    case (ALUop)
      2'b00: out = Ain+Bin; //Add Ain and Bin
      2'b01: out = Ain-Bin;  //Subtract Ain and Bin
      2'b10: out = Ain & Bin; //Ain and Bin
      2'b11: out = ~Bin; //Complement of Bin
      //default out = 16'bxxxxxxxxxxxxxxxx;
    endcase
  
  //Special case, if out is 0, then Z is 1
  if(out == 16'b0000000000000000)
    Z = 1;
  else
    Z = 0;
  
  end
endmodule
