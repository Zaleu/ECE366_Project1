module RCS_testbench;
  reg [3:0] A, B;
  wire [3:0] S;
  wire Cout;
  
  
  four_bit_RCS_test (.A (A)
                     .B (B)
                     .S (S)
                     .Cout (Cout)
                    );
  intial
  begin
    //display header
    $display("A     B     Cout     S");
    $display("-----------------------");
    
    //display test cases and outputs
    
    /*seems like we can just assign A, B
    then print the outputs S and Cout like
    we would in C; %d gives you the dec, %b
    gives you the 4-bit binary */
    
    /*figure out this relevance of this
    "time unit" thing*/
    
    A = 4'b0000; B = 4'b0000;
    $display("%d  - %d  |  %d   %d", A, B, S, Cout);
    
     A = 4'b0101; B = 4'b0011;
    $display("%b  - %b  |  %b   %b", A, B, S, Cout);

    A = 4'b1001; B = 4'b0110;
    $display("%b  - %b  |  %b   %b", A, B, S, Cout);

    A = 4'b1111; B = 4'b0001;
    $display("%b  - %b  |  %b   %b", A, B, S, Cout);

    A = 4'b1111; B = 4'b1111;
    $display("%b  - %b  |  %b   %b", A, B, S, Cout);
    
  end
  
endmodule
