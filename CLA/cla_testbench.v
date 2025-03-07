module cla_testbench;
    reg [31:0] A, B;
    reg Cin;
    wire [31:0] S;
    wire Cout;

    // Instantiate the CLA module
    cla_adder uut(A, B, Cin, S, Cout);

    initial begin
        // Test Case 1: Simple Addition
        A = 32'h00000005; B = 32'h00000003; Cin = 0;
        #10;
        $display("A = %h, B = %h, Cin = %b -> Sum = %h, Cout = %b", A, B, Cin, S, Cout);
        
        // Test Case 2: Large Numbers
        A = 32'h12345678; B = 32'h87654321; Cin = 0;
        #10;
        $display("A = %h, B = %h, Cin = %b -> Sum = %h, Cout = %b", A, B, Cin, S, Cout);

        // Test Case 3: Overflow Case
        A = 32'hFFFFFFFF; B = 32'h00000001; Cin = 0;
        #10;
        $display("A = %h, B = %h, Cin = %b -> Sum = %h, Cout = %b", A, B, Cin, S, Cout);

        $stop;
    end
endmodule

