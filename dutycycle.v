module top;
  reg clk;
  initial begin
    $monitor("$Time=%t clk=%t", $time, clk);
    clk=0;
    repeat(10) begin
      #20 clk = 1;
      #30 clk = 0;
      //#500; $finish;
    end
  end
endmodule
