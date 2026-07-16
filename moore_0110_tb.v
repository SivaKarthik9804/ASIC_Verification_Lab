`include "moore.v"

module top;
  reg clk, rst, x;
  wire out;

  always #5 clk = ~clk;

  moore_0110 dut (.*);

  initial begin
    clk = 0; rst = 1; 
    #10;
    rst = 0;

    mooore(0);
    mooore(1);
    mooore(1);
    mooore(0);
    mooore(0);
    mooore(1);    
    mooore(1);
    mooore(0);
    mooore(0);
    mooore(1);
    mooore(1);
    mooore(0);
#10 $finish;
end

always @(posedge clk)
  $display("input=%d | output=%d", x, out);

task mooore(input reg in);
  begin @(negedge clk)
  x = in;
end
endtask
endmodule


