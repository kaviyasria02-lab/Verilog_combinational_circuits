module encoder_4x2 (A,B,C,D,Y0,Y1);
  input A,B,C,D;
  output Y0,Y1;
  or (Y0,B,D);   
  or (Y1,C,D);   
endmodule

#testbench
module encoder_4x2_tb;
    reg A,B,C,D;
    wire Y0, Y1;
    encoder_4x2 dut (A,B,C,D,Y0,Y1);
    initial begin
        A=1; B=0; C=0; D=0;  
    #10 A=0; B=1; C=0; D=0;  
    #10 A=0; B=0; C=1; D=0;  
    #10 A=0; B=0; C=0; D=1;  
    #10 $finish;
    end
  always@(A,B,C,D)
    $monitor("A=%b,B=%b,C=%b,D=%b,Y0=%b,Y1=%b",A,B,C,D,Y0,Y1);
endmodule
