#demux_1x2_dataflow
  module demux_1x2 (I,S,Y0,Y1);
    input I,S;
    output Y0,Y1;
    assign Y0 = I & ~S;
    assign Y1 = I &  S;
endmodule
  
#demux_1x2_gatelevel
  module demux_1x2 (I,S,Y0,Y1);
    input I,S;
    output Y0,Y1;
    wire S1;
    not(S1,S);
    and (Y0,I,S1);
  	and (Y1,I,S);
endmodule

#demux_1x2_behavioral
   module demux_1x2 (I,S,Y0,Y1);
    input I,S;
    output Y0,Y1;
    wire S1;
  always @(*)
    begin
    if (sel == 0)
    begin
        Y0 = I;
        Y1 = 0;
    end
    else
    begin
        Y0 = 0;
        Y1 = I;
    end
  end
endmodule

#testbench
    module demux_1x2_tb;
  reg I,S;
  wire Y0,Y1;
  demux_1x2 dut(I,S,Y0,Y1);
  initial begin
    I=0;S=1;
#10 I=1;S=0;
#10 $finish;
  end
  always@(I,S)
    $display("I=%b,S=%b,Yo=%b,Y1=%b",I,S,Y0,Y1);
endmodule

Verilog HDL code for demux using dataflow, gatelevel and behavioral modelling

  
