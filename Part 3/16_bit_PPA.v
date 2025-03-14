module kogge_stone_adder_16 (
    input  [15:0] A, B,  
    input         Cin,   
    output [15:0] Sum,   
    output        Cout  
);
    wire [15:0] P, G;  
    wire [15:0] C;    

    // Step 1: Compute Propagate and Generate
    assign P = A ^ B;  
    assign G = A & B;  

    // Step 2: Prefix Processing 
    wire [15:0] C1, C2, C3;  // Intermediate carry wires

    // Stage 1
    assign C1[0]  = G[0]  | (P[0]  & Cin);
    assign C1[1]  = G[1]  | (P[1]  & G[0]);
    assign C1[2]  = G[2]  | (P[2]  & G[1]);
    assign C1[3]  = G[3]  | (P[3]  & G[2]);
    assign C1[4]  = G[4]  | (P[4]  & G[3]);
    assign C1[5]  = G[5]  | (P[5]  & G[4]);
    assign C1[6]  = G[6]  | (P[6]  & G[5]);
    assign C1[7]  = G[7]  | (P[7]  & G[6]);
    assign C1[8]  = G[8]  | (P[8]  & G[7]);
    assign C1[9]  = G[9]  | (P[9]  & G[8]);
    assign C1[10] = G[10] | (P[10] & G[9]);
    assign C1[11] = G[11] | (P[11] & G[10]);
    assign C1[12] = G[12] | (P[12] & G[11]);
    assign C1[13] = G[13] | (P[13] & G[12]);
    assign C1[14] = G[14] | (P[14] & G[13]);
    assign C1[15] = G[15] | (P[15] & G[14]);

    // Stage 2
    assign C2[0]  = C1[0];
    assign C2[1]  = C1[1];
    assign C2[2]  = C1[2] | (P[2]  & C1[0]);
    assign C2[3]  = C1[3] | (P[3]  & C1[1]);
    assign C2[4]  = C1[4] | (P[4]  & C1[2]);
    assign C2[5]  = C1[5] | (P[5]  & C1[3]);
    assign C2[6]  = C1[6] | (P[6]  & C1[4]);
    assign C2[7]  = C1[7] | (P[7]  & C1[5]);
    assign C2[8]  = C1[8] | (P[8]  & C1[6]);
    assign C2[9]  = C1[9] | (P[9]  & C1[7]);
    assign C2[10] = C1[10] | (P[10] & C1[8]);
    assign C2[11] = C1[11] | (P[11] & C1[9]);
    assign C2[12] = C1[12] | (P[12] & C1[10]);
    assign C2[13] = C1[13] | (P[13] & C1[11]);
    assign C2[14] = C1[14] | (P[14] & C1[12]);
    assign C2[15] = C1[15] | (P[15] & C1[13]);

    // Stage 3
    assign C3[0]  = C2[0];
    assign C3[1]  = C2[1];
    assign C3[2]  = C2[2];
    assign C3[3]  = C2[3];
    assign C3[4]  = C2[4]  | (P[4]  & C2[0]);
    assign C3[5]  = C2[5]  | (P[5]  & C2[1]);
    assign C3[6]  = C2[6]  | (P[6]  & C2[2]);
    assign C3[7]  = C2[7]  | (P[7]  & C2[3]);
    assign C3[8]  = C2[8]  | (P[8]  & C2[4]);
    assign C3[9]  = C2[9]  | (P[9]  & C2[5]);
    assign C3[10] = C2[10] | (P[10] & C2[6]);
    assign C3[11] = C2[11] | (P[11] & C2[7]);
    assign C3[12] = C2[12] | (P[12] & C2[8]);
    assign C3[13] = C2[13] | (P[13] & C2[9]);
    assign C3[14] = C2[14] | (P[14] & C2[10]);
    assign C3[15] = C2[15] | (P[15] & C2[11]);

    // Final Carry and Sum Computation
    assign C[0] = Cin;
    assign C[1] = C1[0];
    assign C[2] = C2[1];
    assign C[3] = C3[2];
    assign C[4] = C3[3];
    assign C[5] = C3[4];
    assign C[6] = C3[5];
    assign C[7] = C3[6];
    assign C[8] = C3[7];
    assign C[9] = C3[8];
    assign C[10] = C3[9];
    assign C[11] = C3[10];
    assign C[12] = C3[11];
    assign C[13] = C3[12];
    assign C[14] = C3[13];
    assign C[15] = C3[14];
    assign Cout  = C3[15];

    assign Sum = P ^ C;  // Sum computation
endmodule
