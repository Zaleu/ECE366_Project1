module carry_logic(input [31:0] A, input [31:0] B, output [31:0] P, output [31:0] G);
    assign P = A ^ B; // Propagate
    assign G = A & B; // Generate
endmodule
