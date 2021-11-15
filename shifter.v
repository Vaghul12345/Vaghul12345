module shifter(shift, in, out)
  
  input [1:0] shift;
  input [15:0] in;
  output [15:0] out;
  
  always@(*)
    casex(shift)
      2'b00: out = in;
      2'b01: out = in<<1;
      2'b10: out = in>>1;
      2'b11: out = 
      default out = 16'bxxxxxxxxxxxxxxxx;
    endcase
  end
endmodule
