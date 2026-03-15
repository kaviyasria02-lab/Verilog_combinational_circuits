module comparator_4bit(A,B,G,L,E);
  input [3:0] A;
  input [3:0] B;
  output G;
  output L;
  output E;
  assign G = (A>B);
  assign L = (A<B);
  assign E = (A==B);
endmodule

#testbench
module comparator_4bit_tb;
  reg [3:0] A;
  reg [3:0] B;
  wire G;
  wire L;
  wire E;
  comparator_4bit uut (A,B,G,L,E);
  initial begin
    $monitor("A=%d, B=%d, A>B=%d, A=B=%d, A<B=%d",A,B,G,E,L);
    A = 4'b0001; B = 4'b0010; #10;
    A = 4'b0101; B = 4'b0101; #10;
    A = 4'b1010; B = 4'b1001; #10;
    A = 4'b0110; B = 4'b1000; #10;
    $finish;
  end
endmodule
