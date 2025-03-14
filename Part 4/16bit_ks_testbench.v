`timescale 1ns / 1ps

module kogge_stone_adder_tb;
    reg [15:0] A, B;
    reg Cin;
    wire [15:0] S;
    wire Cout;

    kogge_stone_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    task run_test(input [15:0] test_A, input [15:0] test_B, input test_Cin);
        begin
            A = test_A;
            B = test_B;
            Cin = test_Cin;
            #10; // Wait for propagation
            $display("A = %b, B = %b, Cin = %b | S = %b, Cout = %b", A, B, Cin, S, Cout);
        end
    endtask

    initial begin
        $display("Starting Kogge-Stone Adder Test...");

        // Test 1: Zero Addition
        run_test(16'b0000000000000000, 16'b0000000000000000, 1'b0);
        
        // Test 2: Add with Cin = 1
        run_test(16'b0000000000000000, 16'b0000000000000000, 1'b1);

        // Test 3: Adding two small numbers
        run_test(16'b0000000000000011, 16'b0000000000000101, 1'b0); // 3 + 5

        // Test 4: Adding two larger numbers
        run_test(16'b0000111100001111, 16'b0000000011110000, 1'b0);

        // Test 5: Max Values (Overflow Check)
        run_test(16'b1111111111111111, 16'b1111111111111111, 1'b0);

        // Test 6: Alternating bits
        run_test(16'b1010101010101010, 16'b0101010101010101, 1'b0);

        // Test 7: Random value test
        run_test(16'b1100110011001100, 16'b0011001100110011, 1'b1);

        // Test 8: One operand is zero
        run_test(16'b1111000011110000, 16'b0000000000000000, 1'b0);

        // Test 9: One-bit carry propagation
        run_test(16'b0000000000000001, 16'b0000000000000001, 1'b0);

        // Test 10: Largest possible carry propagation
        run_test(16'b0111111111111111, 16'b0000000000000001, 1'b0);

        // End test
        $display("Kogge-Stone Adder Test Complete!");
        $finish;
    end
endmodule
