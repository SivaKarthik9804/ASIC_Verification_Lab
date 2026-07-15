/* module flipflops_gate(
  input d,
    input clk,
    output reg q
  );

  always @ (posedge clk) begin
    q <= d;
  end
endmodule

module flipflops_gate_tb;
  reg d;
  reg clk;
  wire q;

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end  

  flipflops_gate dut ( .d(d), .clk(clk), .q(q) );
  initial begin
    $monitor( " d=%b clk=%b y=%b", d, clk, q );

    d = 0;
#10 d = 1;
#10 d = 0;
#10 d = 1;
#10 $finish;
end
endmodule */

module flipflops_gate(
    input s, r,
    output q, qbar 
  );
  
  nand n1 (q, s, qbar);
  nand n2 (qbar, r, q);

endmodule

module flipflops_gate_tb;
  reg s, r;
  wire q, qbar;

  flipflops_gate dut ( .s(s), .r(r), .q(q), .qbar(qbar) );
  initial begin
    $monitor( "s=%b r=%b q=%b qbar=%b", s, r, q, qbar );
    s=1'b0; r=1'b0;
#10 s=1'b0; r=1'b1;
#10 s=1'b1; r=1'b0;
#10 s=1'b1; r=1'b1;
#10 $finish;
end
endmodule 
/*
module flipflops_gate(
    input j, k,
    output q, qbar
  );

  nand n1 ( qbar, j, q);
  nand n2 (q, k, qbar);

endmodule 

module flipflops_gate_tb;
  reg j, k;
  wire q, qbar;

  flipflops_gate dut ( .j(j), .k(k), .q(q), .qbar(qbar) );

  initial begin
    $monitor ( "j=%b k=%b q=%b qbar=%b", j, k, q, qbar);
    j=1'b0; k=1'b0;
#10 j=1'b0; k=1'b1;
#10 j=1'b1; k=1'b0;
#10 j=1'b1; k=1'b1;
#10 $finish;

end
endmodule */

/*
module flipflops_gate(
    input d,
    output q, qbar
  );

  nand n1( q, d, qbar );
  nand n2( qbar, ~d, q);
endmodule

module flipflops_gate_tb;
  reg d;
  wire q, qbar;

  flipflops_gate dut ( .d(d), .q(q), .qbar(qbar) );
  initial begin
    $monitor ("d=%b q=%b qbar=%b", d, q, qbar);
    d=0;
#10 d=1;
#10 d=0;
#10 d=1;
#10 d=1;
#10 $finish;
end
endmodule */

/*
module flipflops_gate(
    input t,
    output q, qbar
  );

  nand n1 ( q, t, qbar);
  nand n2 ( qbar, t, q);
endmodule

module flipflops_gate_tb;
  reg t;
  wire q, qbar;

  flipflops_gate dut ( .t(t), .q(q), .qbar(qbar) );
  initial begin 
    $monitor ( "t=%b q=%b qbar=%b", t, q, qbar);
    t=0;
#10 t=1;
#10 t=0;
#10 t=1;
#10 t=0;
#10 $finish;

end
endmodule */
