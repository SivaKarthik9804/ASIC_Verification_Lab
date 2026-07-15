/*module tff(
    input clk, rst, t,
    output reg q
  );

    always @ (posedge clk or posedge rst)   
      if (rst) begin
      q <= 1'b0;
    end
      else if (t)
        q <= ~q;
     else 
        q <= q;
  endmodule


module async_down_counter(
    input clk, rst, 
    output [1:0] q
  );

  tff ff0 ( .clk(clk), .rst(rst), .t(1'b1), .q(q[0]) );
  tff ff1 ( .clk(q[0]), .rst(rst), .t(1'b1), .q(q[1]) );

endmodule

module top;
  reg clk, rst;
  wire [1:0] q;

  async_up_counter dut (.*);
  always #10 clk = ~clk;

  initial begin
    $monitor("$Time=%t clk=%t rst=%b q=%b", $time, clk, rst, q);
    clk=0; rst=1; 
#10 rst=0;
#2000;
$finish;
end
endmodule
*/

/*
module tff(
    input clk, rst, t,
    output reg q
  );

  always @ (negedge clk or posedge rst)  
    if (rst) begin
      q <= 1'b0;
    end
      else if (t)
        q <= ~q;
      else 
        q <= q;
  endmodule


module async_up_counter(
    input clk, rst, 
    output [1:0] q
  );

  tff ff0 ( .clk(clk), .rst(rst), .t(1'b1), .q(q[0]) );
  tff ff1 ( .clk(q[0]), .rst(rst), .t(1'b1), .q(q[1]) );

endmodule

module top;
  reg clk, rst, mode;
  wire [1:0] q;

  async_up_counter dut (.*);
  always #10 clk = ~clk;

  initial begin
    $monitor("$Time=%t clk=%t rst=%b q=%b", $time, clk, rst, q);
    clk=0; rst=1; 
#10 rst=0;
#100 mode =0;
#2000;
$finish;
end
endmodule
*/


/*
module tff(
    input clk, rst, t,
    output reg q
  );

    always @ (posedge clk or posedge rst)   
      if (rst) begin
      q <= 1'b0;
    end
      else if (t)
        q <= ~q;
  endmodule


module async_up_counter(
    input clk, rst, mode, 
    output [1:0] q
  );

  tff ff0 ( .clk(clk), .rst(rst), .t(1'b1), .q(q[0]) );
  tff ff1 ( .clk(mode ? q[0] : ~q[0]), .rst(rst), .t(1'b1), .q(q[1]) );

endmodule

module top;
  reg clk, rst, mode;
  wire [1:0] q;

  async_up_counter dut (.*);
  always #10 clk = ~clk;

  initial begin
    $monitor("$Time=%t clk=%t rst=%b mode=%bq=%b", $time, clk, rst, mode, q);
    clk=0; rst=1; mode =1;
#10 rst=0;
#100 mode =0;
#2000;
$finish;
end
endmodule
*/

module modn#(parameter n=4,parameter mod=6)(
    input clk,rst,
    output reg [n-1:0]q
  );
  always@(posedge clk)
  begin
    if(rst || q == mod)
       q=0;
     else 
       q=q+1;
   end
 endmodule 
 module tb;
   parameter n=3;
 reg clk,rst;
 wire [n-1:0]q;
 modn dut(.*);
 always #5 clk=~clk;
 integer i;
 initial begin
      
   $monitor("clk=%b,rst=%b,q=%b",clk,rst,q);
   clk=0;rst=1;
   #10;
   rst=0;#100;
   $finish;
 end
 endmodule

