#Using_conditional_statments_4x1_MUX
module mux_4x1 (S0,S1,I0,I1,I2,I3,Y);
    input S0,S1,I0,I1,I2,I3;
    output Y;
  assign Y = ((S1 == 0 && S0 == 0) ? I0 : 
              (S1 == 0 && S0 == 1) ? I1 : 
              (S1 == 1 && S0 == 0) ? I2 : I3) ; 
endmodule

#Testbench
module mux_4x1_tb;
  reg S0,S1,I0,I1,I2,I3;
  wire Y;
  mux_4x1 dut(S0,S1,I0,I1,I2,I3,Y);
  initial begin
    I0=0;I1=1;I2=0;I3=1;
    
        S1=0;S0=0;
   #10  S1=0;S0=1;
   #10  S1=1;S0=0;
   #10  S1=1;S0=1;
   #10  $finish;
  end
  always@(S0,S1,I0,I1,I2,I3)
    $monitor("S1=%b S0=%b I0=%b I1=%b I2=%b I3=%b Y=%b",S1,S0,I0,I1,I2,I3,Y);
endmodule

#Using_if_else_statements_4x1_mux
module mux4_1(out,in,sel);
  output out;
  input[3:0] in;
  input[1:0] sel;
  reg out;
  wire [3:0] in;
  wire [1:0] sel;
  always@(in or sel) begin
    if (sel==0)
      out=in[0];
    else if (sel==1)
      out=in[1];
    else if (sel==2)
      out=in[2];
    else
      out=in[3];
  end
endmodule

#testbench
module muxif_tb;
  reg [3:0]in; 
  reg [1:0]sel;
  wire out;
  mux4_1 dut(out,in,sel);
  initial begin
    in = 4'b0100;
    sel=2'b00; #10
    sel=2'b01; #10
    sel=2'b10; #10
    sel=2'b11; #10
    #50 $finish;
  end
  always@ (in, sel) begin
      $monitor("in=%b,sel=%b,out=%b", in,sel,out);
  end
endmodule

#Using_if_else_mux_8x1
module mux8x1 (in,sel,out);
  input [7:0]in;
  input [2:0] sel;
  output out;
  reg out;
  wire[7:0]in;
  wire[2:0] sel;
  always@(in or sel) begin
    if (sel==0)
      out=in[0];
    else if (sel==1)
      out= in[1];
    else if (sel==2)
      out= in[2];
    else if (sel==3)
      out= in[3];
    else if (sel==4)
      out= in[4];
    else if (sel==5)
      out= in[5];
    else if (sel==6)
      out= in[6];
    else 
      out=in[7];
  end
endmodule

#Using_case_statements_mux_8x1
module mux8x1_case (in,sel,out);
  input [7:0]in;
  input [2:0] sel;
  output out;
  reg out;
  wire[7:0]in;
  wire[2:0] sel;
  always@(in or sel) begin
    case(sel)
      0:out=in[0];
      1:out=in[1];
      2:out=in[2];
      3:out=in[3];
      4:out=in[4];
      5:out=in[5];
      6:out=in[6];
      7:out=in[7];
    endcase
  end
endmodule

#testbench_mux_8x1
module mux8x1_tb;
  reg  [7:0] in;     
  reg  [2:0] sel;    
  wire out;        
  mux8x1_case dut(in,sel,out);
    initial begin
        in = 8'b00000001; sel = 3'b000; #10;
        in = 8'b00000010; sel = 3'b001; #10;
        in = 8'b00000100; sel = 3'b010; #10;
        in = 8'b00001000; sel = 3'b011; #10;
        in = 8'b00010000; sel = 3'b100; #10;
        in = 8'b00100000; sel = 3'b101; #10;
        in = 8'b01000000; sel = 3'b110; #10;
        in = 8'b10000000; sel = 3'b111; #10;
        $finish;
    end
  initial begin
    $monitor("sel=%b, out=%b, in[0]=%b, in[1]=%b ,in[2]=%b ,in[3]=%b, in[4]=%b, in[5]=%b, in[6]=%b, in[7]=%b", sel, out,in[0], in[1], in[2], in[3],in[4], in[5], in[6], in[7]);
  end
endmodule
