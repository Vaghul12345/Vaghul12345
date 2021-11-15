module alu(Ain,Bin,out)



  always @(*)
    casex(ALUop)
      2'b00: out = Ain+Bin;
      2'b01  out = Ain-Bin;
      2'b10  out = Ain & Bin;
      2'b11  out = ~Bin;
      default out = 
