module d_ff(
	input clk, rst, d,
	output reg q
);
always @(posedge clk or posedge rst)
begin
  if(rst)
    q<= 1'b0;
  else
    q<=d;
end
endmodule

module dff #( parameter N = 8 ) (
    input clk, rst,
    input [N-1:0]d,
    output [N-1:0] q
  );
  genvar i;

  generate 
    for(i=0; i<N; i=i+1)
    begin : DFF_GEN
      d_ff dut ( .clk(clk), .rst(rst), .d(d[i]), .q(q[i]) );
    end
  endgenerate
endmodule

module top;
  parameter N =8;
   reg clk, rst;
   reg [N-1:0]d;
   wire [N-1:0]q;

   dff dut (.*);

   always #5 clk=~clk;
   initial begin
     $monitor("clk=%t rst=%b d=%b q=%b", clk, rst, d, q);
     clk=0; rst=1; d=8'd0;
     #10 rst = 0; d=8'd5;
     #10 d=8'd10;
     #10 d=8'd69;
     #10 $finish;
   end
 endmodule


