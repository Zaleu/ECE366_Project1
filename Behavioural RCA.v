module four_bit_RCA_RCS(A,B,Cin,S,Cout);
  
  input [3:0] A,B;
  input Cin;
  output [3:0] S;
  output Cout;
  
  assign S = A ^ B ^ Cin;
  assign Cout = (A & B) | (B & Cin) | (Cin & A);
  
  
endmodule
