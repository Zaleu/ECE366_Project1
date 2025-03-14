module cla_adder(input [31:0] A, input [31:0] B, input Cin, output [31:0] S, output Cout);
    wire [7:0] C; // Carry outputs from 4-bit CLA blocks

    // Instantiate eight 4-bit CLA blocks
    four_bit_cla cla0(A[3:0], B[3:0], Cin, S[3:0], C[0]);
    four_bit_cla cla1(A[7:4], B[7:4], C[0], S[7:4], C[1]);
    four_bit_cla cla2(A[11:8], B[11:8], C[1], S[11:8], C[2]);
    four_bit_cla cla3(A[15:12], B[15:12], C[2], S[15:12], C[3]);
    four_bit_cla cla4(A[19:16], B[19:16], C[3], S[19:16], C[4]);
    four_bit_cla cla5(A[23:20], B[23:20], C[4], S[23:20], C[5]);
    four_bit_cla cla6(A[27:24], B[27:24], C[5], S[27:24], C[6]);
    four_bit_cla cla7(A[31:28], B[31:28], C[6], S[31:28], Cout);
endmodule

