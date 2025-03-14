module kogge_stone_adder(
    input [15:0] A, B,
    input Cin,
    output [15:0] S,
    output Cout
);
    wire [15:0] P, G;
    wire [15:0] C;

    // Step 1: Compute Propagate (P) and Generate (G) signals
    assign P = A ^ B;  // Propagate: P[i] = A[i] ⊕ B[i]
    assign G = A & B;  // Generate: G[i] = A[i] & B[i]

    // Parallel Prefix Network (Carry Tree)
    wire [15:0] G1, P1;
    wire [15:0] G2, P2;
    wire [15:0] G3, P3;
    wire [15:0] G4;

    genvar i;

    // Level 1 (distance: 1)
    generate
        for (i = 0; i < 16; i = i + 1) begin : level1
            if (i == 0) begin
                assign G1[i] = G[i];
                assign P1[i] = P[i];
            end else begin
                assign G1[i] = G[i] | (P[i] & G[i-1]);
                assign P1[i] = P[i] & P[i-1];
            end
        end
    endgenerate

    // Level 2 (distance: 2)
    generate
        for (i = 0; i < 16; i = i + 1) begin : level2
            if (i < 2) begin
                assign G2[i] = G1[i];
                assign P2[i] = P1[i];
            end else begin
                assign G2[i] = G1[i] | (P1[i] & G1[i-2]);
                assign P2[i] = P1[i] & P1[i-2];
            end
        end
    endgenerate

    // Level 3 (distance: 4)
    generate
        for (i = 0; i < 16; i = i + 1) begin : level3
            if (i < 4) begin
                assign G3[i] = G2[i];
                assign P3[i] = P2[i];
            end else begin
                assign G3[i] = G2[i] | (P2[i] & G2[i-4]);
                assign P3[i] = P2[i] & P2[i-4];
            end
        end
    endgenerate

    // Level 4 (distance: 8)
    generate
        for (i = 0; i < 16; i = i + 1) begin : level4
            if (i < 8) begin
                assign G4[i] = G3[i];
            end else begin
                assign G4[i] = G3[i] | (P3[i] & G3[i-8]);
            end
        end
    endgenerate

    // Compute Carries
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
