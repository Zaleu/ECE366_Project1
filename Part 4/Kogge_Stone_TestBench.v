module kogge_stone_adder_testbench;
    reg [15:0] A, B;
    reg Cin;
    wire [15:0] S;
    wire Cout;

    // Instantiate the prefix adder module
    kogge_stone_adder DUT (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        // Test case 1: Adding zero
        A = 16'b0000000000000000; B = 16'b0000000000000000; Cin = 0;
        #10;
        $display("TC1: A=%b, B=%b, Cin=%b => Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);

        // Test case 2: Adding small numbers
        A = 16'b0000000000000101; B = 16'b0000000000000011; Cin = 0;
        #10;
        $display("TC2: A=%b, B=%b, Cin=%b => Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);

        // Test case 3: Adding with carry-in
        A = 16'b0000000000000101; B = 16'b0000000000000011; Cin = 1;
        #10;
        $display("TC3: A=%b, B=%b, Cin=%b => Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);
      
      // Test case 4: Adding only carry-in
        A = 16'b0000000000000000; B = 16'b0000000000000000; Cin = 1;
        #10;
        $display("TC3: A=%b, B=%b, Cin=%b => Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);

        // Test case 5: Maximum values
        A = 16'b1111111111111111; B = 16'b1111111111111111; Cin = 0;
        #10;
        $display("TC4: A=%b, B=%b, Cin=%b => Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);

        // Test case 6: Carry propagation test
        A = 16'b0000111100001111; B = 16'b1111000011110000; Cin = 0;
        #10;
        $display("TC5: A=%b, B=%b, Cin=%b => Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);

        // End simulation
        $stop;
    end
endmodule
