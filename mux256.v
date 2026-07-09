module mux256(
    input [255:0]i,
    input [7:0]s,
    output y
  );
  assign y=i[s];
endmodule

module mux256_tb;
  reg [255:0]i;
  reg [7:0]s;
  wire y;
  integer k;

  mux256 dut (.i(i), .s(s), .y(y) );
  initial begin
  $monitor ( "i=%b s=%b y=%b", i, s, y );
  i = 256'd0;
    for(k=0; k<256; k=k+1)
        i[k] = k % 2; 
    for(k=0; k<256; k=k+1) begin
        s = k;
        #10;
    end
    $finish;
end
endmodule
