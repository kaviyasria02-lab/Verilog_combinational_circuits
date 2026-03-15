module decoder_1x2 (A,Y0,Y1);
    input A;
    output reg Y0, Y1;
  always @(A) begin
    Y0=~A;
    Y1=A;
  end
endmodule

#testbench
 module decoder_1x2_tb;
   reg A;
   wire Y0,Y1;
   decoder_1x2 dut(A,Y0,Y1);
   initial begin
        A = 0;    
    #10 A = 1; #10;  
    #10 $finish;
    end
   always@(A)
     $monitor("A=%b,Y0=%b,Y1=%b",A,Y0,Y1);
endmodule
