module full_adder(input A, input B, input Cin, output S, output Cout);
    assign S = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule

module mux_2to1(input [31:0] A, input [31:0] B, input sel, output [31:0] out);
    assign out = sel ? ~B : B;
endmodule

module carry_logic(input [31:0] A, input [31:0] B, output [31:0] P, output [31:0] G);
    assign P = A ^ B; // Propagate
    assign G = A & B; // Generate
endmodule

module four_bit_cla(input [3:0] A, input [3:0] B, input Cin, output [3:0] S, output Cout);
    wire [3:0] P, G, C;

    // Generate and propagate signals
    assign P = A ^ B;  // Propagate
    assign G = A & B;  // Generate

    // Carry Lookahead Logic
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign Cout = G[3] | (P[3] & C[3]);

    // Sum Calculation
    assign S = P ^ C;
endmodule


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
