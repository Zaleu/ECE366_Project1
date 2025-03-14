module mux_2to1(input [31:0] A, input [31:0] B, input sel, output [31:0] out);
    assign out = sel ? ~B : B;
endmodule
