/*module counter(
    input clk,rst,
    output reg [3:0]count);
  always@(posedge clk or posedge rst) begin
    if(rst)
      count<=0;
    else
      count<= count +1;
  end
endmodule


module tb;
  reg clk,rst;
  wire [3:0]count;
  counter dut(.*);

  always #5 clk=~clk;

  initial begin
    $monitor("count=%d",count);
    clk=0;rst=1;
    #10;
    rst=0;
    #150;
    $finish;
  end
endmodule
*/
 
/*
module counter(
    input clk,rst,
    output reg [3:0]count);
  always@(posedge clk or posedge rst) begin
    if(rst)
      count<=15;
    else
      count<= count - 1;
  end
endmodule


module tb;
  reg clk,rst;
  wire [3:0]count;
  counter dut(.*);

  always #5 clk=~clk;

  initial begin
    $monitor("count=%d",count);
    clk=0;rst=1;
    #10;
    rst=0;
    #150;
    $finish;
  end
endmodule
*/

/* 
module counter(
    input clk,rst,mode,
    output reg [3:0]count);
  always@(posedge clk or posedge rst) begin
    if(rst)
      count<=0;
    else if(mode)
      count<= count +1;
    else
      count<=count -1;
  end
endmodule


module tb;
  reg clk,rst,mode;
  wire [3:0]count;
  counter dut(.*);

  always #5 clk=~clk;

  initial begin
    $monitor("count=%d",count);
    clk=0;rst=1;
    #10;
    rst=0;mode=1;
    #150;
    mode=0;#150;
    $finish;
  end
endmodule
*/


module counter(
    input clk,rst,
    output reg [4:0]count);
  always@(posedge clk or posedge rst) begin
    if(rst || count ==6)
      count<=0;
      else 
      count<= count-1;
  end
endmodule


module tb;
  reg clk,rst;
  wire [4:0]count;
  counter dut(.*);

  always #5 clk=~clk;

  initial begin
    $monitor("count=%d",count);
    clk=0;rst=1;
    #10;
    rst=0;
    #1500;
    $finish;
  end
endmodule

