module kogge_stone_adder(
    input [15:0] A, B,
    input Cin,
    output [15:0] S,
    output Cout
);
    wire [15:0] P, G;
    wire [15:0] C;

    // Step 1: Generate Propagate (P) and Generate (G) signals
    assign P = A ^ B;  // Propagate: P[i] = A[i] ⊕ B[i]
    assign G = A & B;  // Generate:  G[i] = A[i] & B[i]

    // Step 2: Carry computation using parallel prefix 
    wire [15:0] G1, P1;
    wire [15:0] G2, P2;
    wire [15:0] G3, P3;
    wire [15:0] G4;

    // Level 1
    assign G1[0]  = G[0];
    assign P1[0]  = P[0];
    genvar i;
    generate
        for (i = 1; i < 16; i = i + 1) begin : level1
            assign G1[i] = G[i] | (P[i] & G[i-1]);
            assign P1[i] = P[i] & P[i-1];
        end
    endgenerate

    // Level 2
    assign G2[0]  = G1[0];
    assign G2[1]  = G1[1];
    assign P2[0]  = P1[0];
    assign P2[1]  = P1[1];
    generate
        for (i = 2; i < 16; i = i + 1) begin : level2
            assign G2[i] = G1[i] | (P1[i] & G1[i-2]);
            assign P2[i] = P1[i] & P1[i-2];
        end
    endgenerate

    // Level 3
    assign G3[0]  = G2[0];
    assign G3[1]  = G2[1];
    assign G3[2]  = G2[2];
    assign G3[3]  = G2[3];
    generate
        for (i = 4; i < 16; i = i + 1) begin : level3
            assign G3[i] = G2[i] | (P2[i] & G2[i-4]);
            assign P3[i] = P2[i] & P2[i-4];
        end
    endgenerate

    // Level 4
    assign G4[0]  = G3[0];
    assign G4[1]  = G3[1];
    assign G4[2]  = G3[2];
    assign G4[3]  = G3[3];
    assign G4[4]  = G3[4];
    assign G4[5]  = G3[5];
    assign G4[6]  = G3[6];
    assign G4[7]  = G3[7];
    generate
        for (i = 8; i < 16; i = i + 1) begin : level4
            assign G4[i] = G3[i] | (P3[i] & G3[i-8]);
        end
    endgenerate

    // Step 3: Compute the carries
    assign C[0] = Cin;
    generate
        for (i = 1; i < 16; i = i + 1) begin : carry
            assign C[i] = G4[i-1] | (P[i-1] & Cin);
        end
    endgenerate

    // Step 4: Compute sum bits
    assign S = P ^ C;
    assign Cout = G4[15] | (P[15] & Cin);

endmodule