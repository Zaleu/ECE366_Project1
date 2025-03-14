module RCA_testbench;
  reg [3:0] A, B;
  reg Cin;
  reg [3:0] S;
  reg Cout;
  
  
  four_bit_RCA_RCS DUT  (.A (A),
                     .B (B),
                     .Cin (Cin),
                     .S (S),
                     .Cout (Cout)
                    );
   initial
   begin
    //display header
    $display("A     B     Cin     Cout     S");
    $display("--------------------------------");
    
    //display test cases and outputs
    
    A = 4'b0000; 
    B = 4'b0000;
    Cin = 1'b0; 
    #10
    $display("%b  + %b     %b  |  %b   %b", A, B, Cin, Cout, S);

    A = 4'b0000; 
    B = 4'b0000;
    Cin = 1'b1; 
    #10
    $display("%b  + %b     %b  |  %b   %b", A, B, Cin, Cout, S);

     
    A = 4'b0101; 
    B = 4'b0011;
    Cin = 1'b1; 
    #10
    $display("%b  + %b     %b  |  %b   %b", A, B, Cin, Cout, S);

    A = 4'b1001; 
    B = 4'b0110; 
    Cin = 1'b0; 
    #10
    $display("%b  + %b     %b  |  %b   %b", A, B, Cin, Cout, S);

    A = 4'b1111; 
    B = 4'b0001;
    Cin = 1'b0;
    #10
    $display("%b  + %b     %b  |  %b   %b", A, B, Cin, Cout, S);

    A = 4'b1111; 
    B = 4'b1111;
    Cin = 1'b0; 
    #10
    $display("%b  + %b     %b  |  %b   %b", A, B, Cin, Cout, S);
    
   end
  
endmodule
