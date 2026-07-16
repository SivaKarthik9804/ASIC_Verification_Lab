`include "mealy0110.v"

module top;
    reg clk,reset,x;
    wire out;

    always #5 clk = ~clk;

    mealy_0110 dut( .clk(clk), .rst(reset), .x(x), .out(out) );

    initial begin
        clk = 0;reset = 1;
        #10;
        reset = 0;

        mealyy(0);
        mealyy(1);
        mealyy(1);
        mealyy(0);
        mealyy(0);
        mealyy(1);
        mealyy(1);
        mealyy(0);
        mealyy(1);
        #10 $finish;
    end
    always @(posedge clk)
            $display("in=%b | out=%b",x,out);

    task mealyy(input reg in);
        begin
            @(negedge clk)
            x = in;
        end
    endtask
endmodule 
