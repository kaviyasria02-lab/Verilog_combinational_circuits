#Gatelevel_modelling
module mux_2input(S,A,B,Y);
  input S,A,B;
  output Y;
  wire S_bar;
  wire I1,I2;
  not(S_bar, S);
  and and1(I1,A,S_bar);
  and and2(I2,B,S);
  or (Y,I1,I2);
endmodule

#Dataflow_modelling
module mux_2input(S,A,B,Y);
  input S,A,B;
  output Y;
  assign Y=((~S)&A)|(S&B);
endmodule

#Behavioral_modelling
module mux_2input(S,A,B,Y);
  input S,A,B;
  output Y;
  always @(*)
begin
    if (sel == 0)
        y = a;
    else
        y = b;
  end
endmodule

#testbench
module mux_2input_tb;
  reg S,A,B;
  wire Y;
  mux_2input dut(S,A,B,Y);
  initial begin
    S=0;A=0;B=1;
    #10 S=1;A=1;B=0;
    #10 $finish;
  end
  always@(S,A,B)
    $monitor("S=%b,A=%b,B=%b,Y=%b",S,A,B,Y);
endmodule

