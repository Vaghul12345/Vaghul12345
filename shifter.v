module shifter(shift, in, sout);
  
  input [1:0] shift;
  input [15:0] in;
  output [15:0] sout;
  reg [15:0] sout;
  
  //Shift the input either left or right by one, or keep it equal
  always@(*)begin
    casex(shift)
      2'b00: sout = in;
      2'b01: sout = in<<1;
      2'b10: sout = in>>1;
      2'b11: sout = {in[15], in[15:1]};
           
      default sout = 16'bxxxxxxxxxxxxxxxx;
    endcase
  end
endmodule
