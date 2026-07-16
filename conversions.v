/*module binary_gray_conversion(
    input [3:0]b,
    output [3:0]g
  );

  assign g[3] = b[3];
  assign g[2] = b[3] ^ b[2];
  assign g[1] = b[2] ^ b[1];
  assign g[0] = b[1] ^ b[0];

endmodule

module binary_gray_conversion_tb;
reg [3:0] b;
wire [3:0] g;

integer i;

binary_gray_conversion dut( .b(b), .g(g) );

initial begin
    $monitor("b=%b g=%b", b, g);
    for(i=0; i<16; i=i+1) begin
        b = i;
        #10;
    end
    $finish;
end
endmodule */


module gray_binary_conversion(
    input [3:0]g,
    output [3:0]b
  );

  assign b[3] = g[3];
  assign b[2] = b[3] ^ g[2];
  assign b[1] = b[2] ^ g[1];
  assign b[0] = b[1] ^ g[0];

endmodule

module gray_binary_conversion_tb;
reg [3:0] g;
wire [3:0] b;

integer i;

gray_binary_conversion dut( .g(g), .b(b) );

initial begin
    $monitor("g=%b b=%b", g, b);
    for(i=0; i<16; i=i+1) begin
        g = i;
        #10;
    end
    $finish;
end
endmodule 



