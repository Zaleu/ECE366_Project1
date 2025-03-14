//not giving a specific timescale gave no errors and was left
//to the default of Icarus Verilog 12.0
module RCS_testbench;
  reg [3:0] A, B;
  reg [3:0] S;
  reg Cout;
  
  
  four_bit_RCS DUT  (.A (A),
                     .B (B),
                     .S (S),
                     .Cout (Cout)
                    );
   initial
   begin
    //display header
    $display("A     B     Cout     S");
    $display("-----------------------");
    
    //display test cases and outputs
    
    A = 4'b0000; 
    B = 4'b0000; 
    #10
     $display("%b  - %b  |  %b   %b", A, B, Cout, S);
    
    A = 4'b0101; 
    B = 4'b0011; 
    #10
     $display("%b  - %b  |  %b   %b", A, B, Cout, S);

    A = 4'b1001; 
    B = 4'b0110; 
    #10
     $display("%b  - %b  |  %b   %b", A, B, Cout, S);

    A = 4'b1111; 
    B = 4'b0001; 
    #10
     $display("%b  - %b  |  %b   %b", A, B, Cout, S);

    A = 4'b1111; 
    B = 4'b1111; 
    #10
     $display("%b  - %b  |  %b   %b", A, B, Cout, S);
    
   end
  
endmodule
