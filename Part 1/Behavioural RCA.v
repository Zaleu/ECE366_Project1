module alt_one_bit_full_adder(A,B,Cin,S,
						  Cout);
  
input A, B, Cin;
output S, Cout;
  

 assign  S = A ^ B ^ Cin;                     
 assign  Cout = (A & B) | (B & Cin) | (Cin & A); 

endmodule// full_adder

module four_bit_RCA_RCS(A,B,Cin,S,Cout);
  
  input [3:0] A,B;
  input Cin;
  output [3:0] S;
  output Cout;
  
  wire C1, C2, C3;
  
  alt_one_bit_full_adder FA0(A[0], B[0], Cin, S[0], C1);
  alt_one_bit_full_adder FA1(A[1], B[1], C1, S[1], C2);
  alt_one_bit_full_adder FA2(A[2], B[2], C2, S[2], C3);
  alt_one_bit_full_adder FA3(A[3], B[3], C3, S[3], Cout);
  
endmodule // RCA-RCS
