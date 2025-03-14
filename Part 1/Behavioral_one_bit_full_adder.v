module full_adder (
    input A,B,Cin
    output reg S, Cout
    
);

always @(*) begin
    S = A ^ B ^ Cin;                     
    Cout = (A & B) | (B & Cin) | (Cin & A); 
end

endmodule// full_adder