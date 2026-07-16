module mux2(
input i0,
input i1,
input s,
output y );

assign y= ~s & i0 | s & i1;

endmodule 

module fa_using_mux2(
    input a, b, c,
    output sum, carry 
  );
  wire y0, y1, y2, y3;

  mux2 m1 ( c, ~c, a, y0);
  mux2 m2 ( ~c, c, a, y1);
  mux2 m3 ( y0, y1, b, sum);
  mux2 m4 (1'b0, c, a, y2);
  mux2 m5 (c, 1'b1, a, y3);
  mux2 m6 (y2, y3, b, carry);
endmodule

module fa_using_mux2_tb;
  reg a, b, c;
  wire sum, carry;

  fa_using_mux2 dut ( .a(a), .b(b), .c(c), .sum(sum), .carry(carry) );
  initial begin 
    $monitor(" $Time= %t a= %b b=%b c=%b sum=%b carry=%b", $time, a, b, c, sum, carry);
    a= 1'b0; b=1'b0; c=1'b0;
#10 a= 1'b0; b=1'b0; c=1'b1;
#10 a= 1'b0; b=1'b1; c=1'b0;
#10 a= 1'b0; b=1'b1; c=1'b1;
#10 a= 1'b1; b=1'b0; c=1'b0;
#10 a= 1'b1; b=1'b0; c=1'b1;
#10 a= 1'b1; b=1'b1; c=1'b0;
#10 a= 1'b1; b=1'b1; c=1'b1;
#10 $finish;
  end
endmodule
