module Fulladder(S,Cout,A,B,Cin)
    output S,Cout;
    input A,B,Cin;
    wire xor_wire, and_wire1, and_wire2, and_wire3;

    xor x1(xor_wire, A, B);
    xor x2(S, xor_wire, Cin);
    
    and a1(and_wire1, A, Cin);
    and a2(and_wire2, B, Cin);
    and a3(and_wire3, A,B);
    
    or o1(Cout, and_wire1, and_wire2, and_wire3);

endmodule// Fulladder