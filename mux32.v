module mux32(
    input [31:0]in,
    input [4:0]s,
    output y 
  );

  assign y=in[s];

endmodule

module mux32_tb;
  reg [31:0] in;
  reg [4:0]s;
  wire y;

  mux32 dut ( .in(in), .s(s), .y(y) );
  initial begin 
      $monitor ( "in=%b s=%b y=%b", in, s, y);

    in=32'd30; s=4'd5;
  end
endmodule
