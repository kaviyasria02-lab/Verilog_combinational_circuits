#Demux_conditional_1x2
module demux_1x2 (A,B,Y0,Y1);
    input A,B;
    output Y0,Y1;
  assign Y0 = (A == 0) ? B : 1'b0;
  assign Y1 = (A == 1) ? B : 1'b0;
endmodule

#testbench
module demux_1x2_tb;
  reg A,B;
  wire Y0,Y1;
  demux_1x2 dut(A,B,Y0,Y1);
  initial begin
    A=0;B=1;
#10 A=1;B=0;
#10 $finish;
  end
  always@(A,B)
    $display("A=%b,B=%b,Yo=%b,Y1=%b",A,B,Y0,Y1);
endmodule

#Demux_case_1x2
module demux_1x2 (A,S,Y0,Y1);
  input A,S;
  output Y0,Y1;
  reg A,S;
  reg Y0,Y1;
  always@(A or S) begin
    Y0=0;
    Y1=0;
    case(S)
    0:Y0=A;
    1:Y1=A;
    endcase
  end
endmodule
    
#testbench
module demuxcase_tb;
  reg A,S;
  wire Y0,Y1;
  demux_1x2 dut(A,S,Y0,Y1);
  initial begin
    A=0;S=0;#10
    A=1;S=0;#10
    A=0;S=1;#10
    A=1; S=1;#10
    #20 $finish;
  end
  always@(A,S)
    $monitor("A=%b,S=%b,Y0=%b,Y1=%b",A,S,Y0,Y1);
endmodule

#demux_if_1x2
module demux_1x2 (A,S,Y0,Y1);
  input A,S;
  output Y0,Y1;
  reg A,S;
  reg Y0,Y1;
  always@(A or S) begin
    Y0=0;
    Y1=0;
    if (S==0)
      Y0=A;
    else
      Y1=A;
  end
endmodule

#testbench
module demuxif_tb;
  reg A,S;
  wire Y0,Y1;
  demux_1x2 dut(A,S,Y0,Y1);
  initial begin
    A=0;S=0;#10
    A=0;S=1;#10
    A=1;S=0;#10
    A=1;S=1;#10
    #20 $finish;
  end
  always@(A,S)
    $monitor("A=%b,S=%b,Y0=%b,Y1=%b",A,S,Y0,Y1);
endmodule

#Demux_1x4_if
module demux1x4_if (
    input in,
    input [1:0] sel,
    output reg y0,
    output reg y1,
    output reg y2,
    output reg y3
);
always @(*) begin
    y0 = 0; y1 = 0; y2 = 0; y3 = 0;   // default
    if (sel == 2'b00)
        y0 = in;
    else if (sel == 2'b01)
        y1 = in;
    else if (sel == 2'b10)
        y2 = in;
    else
        y3 = in;
  end
endmodule

#Testbench
module tb_demux_if;
reg in;
reg [1:0] sel;
wire y0, y1, y2, y3;
demux1x4_if uut (in, sel, y0, y1, y2, y3);
initial begin
    $monitor("Time=%0t sel=%b in=%b y0=%b y1=%b y2=%b y3=%b",$time, sel, in, y0, y1, y2, y3);
    in = 1;
    sel = 2'b00; #10;
    sel = 2'b01; #10;
    sel = 2'b10; #10;
    sel = 2'b11; #10;
    $finish;
end
endmodule

#Demux_1x4_case
module demux1x4_case (
    input in,
    input [1:0] sel,
    output reg y0,
    output reg y1,
    output reg y2,
    output reg y3
);
always @(*) begin
    y0 = 0; y1 = 0; y2 = 0; y3 = 0;

    case (sel)
        2'b00: y0 = in;
        2'b01: y1 = in;
        2'b10: y2 = in;
        2'b11: y3 = in;
        default: ;
    endcase
  end
endmodule

#testbench
module tb_demux_case;
reg in;
reg [1:0] sel;
wire y0, y1, y2, y3;
demux1x4_case uut (in, sel, y0, y1, y2, y3);
initial begin
    $monitor("Time=%0t sel=%b in=%b y0=%b y1=%b y2=%b y3=%b",$time, sel, in, y0, y1, y2, y3);
    in = 1;
    sel = 2'b00; #10;
    sel = 2'b01; #10;
    sel = 2'b10; #10;
    sel = 2'b11; #10;
    $finish;
  end
endmodule

Verilog code for demux 1x2 and 1x4 using conditional,case and if statements
