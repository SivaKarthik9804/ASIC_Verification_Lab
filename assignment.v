/*module counter3(
    input clk,
    input reset,
    output reg [2:0] y
);

always @(posedge clk)
begin
    if(reset)
        y <= 3'b000;
    else
        y <= y + 1;
end
endmodule

module top;
reg clk;
reg reset;
wire [2:0] y;

counter3 dut( .clk(clk), .reset(reset), .y(y) );

always #5 clk = ~clk;

initial begin
    $monitor("Time=%0t Reset=%b Y=%d (%b)", $time, reset, y, y);  
    clk = 0;
    reset = 1;
    #12;
    reset = 0;
    #100;
    reset = 1;
    #10;
    reset = 0;
    #50;
    $finish;
end
end
endmodule */

/*module mod7_counter(
    input clk,
    input reset,
    output reg [2:0] y
);

always @(posedge clk)
begin
    if(reset)
        y <= 3'd0;
    else if(y == 3'd6)
        y <= 3'd0;
    else
        y <= y + 1;
end
endmodule

module top;
reg clk;
reg reset;
wire [2:0] y;

mod7_counter dut(
    .clk(clk),
    .reset(reset),
    .y(y)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    $monitor("Time=%0t Reset=%b Y=%0d", $time, reset, y);
    #12 reset = 0;
    #100 reset = 1;
    #10 reset = 0;
    #50 $finish;
end
endmodule */


module mul3_counter(
    input clk,
    input reset,
    input [3:0] A,
    output reg [3:0] y
);

always @(posedge clk)
begin
    if(reset)
        y <= 0;
    else if(y + 3 <= A)
        y <= y + 3;
    else
        y <= 0;
end
endmodule

module top;
reg clk;
reg reset;
reg [3:0] A;
wire [3:0] y;

mul3_counter dut(
    .clk(clk),
    .reset(reset),
    .A(A),
    .y(y)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    A = 15;
    $monitor("Time=%0t Reset=%b A=%0d Y=%0d",$time,reset,A,y);
    #12 reset = 0;
    #100 A = 9;
    #50 reset = 1;
    #10 reset = 0;
    #50 $finish;
end
endmodule 

/*module skip3_counter(
    input clk,
    input reset,
    output reg [7:0] y
);

always @(posedge clk)
begin
    if(reset)
        y <= 0;
    else begin
        y <= y + 1;
        if((y + 1) % 3 == 0)
            y <= y + 2;
    end
end
endmodule

module top;
reg clk;
reg reset;
wire [7:0] y;

skip3_counter dut(
    .clk(clk),
    .reset(reset),
    .y(y)
);

always #5 clk = ~clk;

initial begin
    clk=0;
    reset=1;
    $monitor("Time=%0t Reset=%b Y=%0d",$time,reset,y);
    #12 reset=0;
    #120 $finish;
end
endmodule */

/*module mask3_counter(
    input clk,
    input reset,
    output reg [7:0] y
);

always @(posedge clk)
begin
    if(reset)
        y <= 0;
    else if(y % 3 == 0)
        y <= y;
    else
        y <= y + 1;
end
endmodule

module top;
reg clk;
reg reset;
wire [7:0] y;

mask3_counter dut(
    .clk(clk),
    .reset(reset),
    .y(y)
);

always #5 clk = ~clk;
initial begin
    clk = 0;
    reset = 1;

    $monitor("Time=%0t Reset=%b Y=%0d", $time, reset, y);

    #12 reset = 0;
    #100 reset = 1;
    #10 reset = 0;
    #50 $finish;
end
endmodule


module mask5_counter(
    input clk,
    input reset,
    output reg [9:0] y
);

always @(posedge clk)
begin
    if(reset)
        y <= 0;
    else if(y >= 1000)
        y <= 0;
    else if(y % 5 == 0)
        y <= y;
    else
        y <= y + 1;
end
endmodule



module top;
reg clk;
reg reset;
wire [9:0] y;

mask5_counter dut(.clk(clk), .reset(reset), .y(y));

always #5 clk = ~clk;
initial begin
    clk = 0;
    reset = 1;
    $monitor("Time=%0t Reset=%b Y=%0d",$time,reset,y);
    #12 reset = 0;
    #200 $finish;
end
endmodule


module up_counter(
    input clk,
    input reset,
    output reg [2:0] y
);

always @(posedge clk)
begin
    if(reset)
        y <= 0;
    else
        y <= y + 1;
end
endmodule

module top;
reg clk;
reg reset;
wire [2:0] y;

up_counter dut(.clk(clk), .reset(reset), .y(y));
always #5 clk = ~clk;
initial begin
    clk = 0;
    reset = 1;

    $monitor("Time=%0t Reset=%b Y=%0d",$time,reset,y);

    #12 reset = 0;
    #100 $finish;
end
endmodule

module updown_counter(
    input clk,
    input reset,
    output reg [2:0] y
);

reg dir;
always @(posedge clk)
begin
    if(reset)
    begin
        y <= 0;
        dir <= 0;
    end
    else
    begin
        if(dir == 0)
        begin
            if(y == 7)
            begin
                dir <= 1;
                y <= 6;
            end
            else
                y <= y + 1;
        end
        else
        begin
            if(y == 0)
            begin
                dir <= 0;
                y <= 1;
            end
            else
                y <= y - 1;
        end
    end
end
endmodule

module top;
reg clk;
reg reset;
wire [2:0] y;

updown_counter dut(.clk(clk), .reset(reset), .y(y));

always #5 clk = ~clk;
initial begin
    clk = 0;
    reset = 1;

    $monitor("Time=%0t Reset=%b Y=%0d",$time,reset,y);

    #12 reset = 0;
    #250 $finish;
end
endmodule


module pattern1(
    input clk,
    input reset,
    output reg [7:0] y
);

reg [1:0] count;
always @(posedge clk)
begin
    if(reset)
    begin
        y <= 1;
        count <= 0;
    end
    else
    begin
        if(count == 3)
        begin
            y <= y + 1;
            count <= 0;
        end
        else
            count <= count + 1;
    end
end
endmodule

module top;
reg clk;
reg reset;
wire [7:0] y;

pattern1 dut(.clk(clk), .reset(reset), .y(y));

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    $monitor("Time=%0t Y=%0d",$time,y);

    #12 reset = 0;
    #250 $finish;
end
endmodule


module pattern2(
    input clk,
    input reset,
    output reg [7:0] y
);
reg [7:0] count;

always @(posedge clk)
begin
    if(reset)
    begin
        y <= 1;
        count <= 1;
    end
    else
    begin
        if(count == y)
        begin
            y <= y + 1;
            count <= 1;
        end
        else
            count <= count + 1;
    end
end
endmodule

module top;
reg clk;
reg reset;
wire [7:0] y;

pattern2 dut(
    .clk(clk),
    .reset(reset),
    .y(y)
);
always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    $monitor("Time=%0t Y=%0d",$time,y);

    #12 reset = 0;
    #300 $finish;
end
endmodule


module address_decoder(
    input clk,
    input reset,
    input [15:0] data,
    input adr,
    output reg [15:0] AA_out,
    output reg [15:0] BB_out,
    output reg [15:0] CC_out
);

always @(posedge clk)
begin
    if(reset)
    begin
        AA_out <= 0;
        BB_out <= 0;
        CC_out <= 0;
    end
    else
    begin
        if(adr == 0)
            AA_out <= data;
        else
            BB_out <= data;
    end
end
endmodule

module top;
reg clk;
reg reset;
reg adr;
reg [15:0] data;
wire [15:0] AA_out;
wire [15:0] BB_out;
wire [15:0] CC_out;

address_decoder dut(
    .clk(clk),
    .reset(reset),
    .data(data),
    .adr(adr),
    .AA_out(AA_out),
    .BB_out(BB_out),
    .CC_out(CC_out)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    adr = 0;
    data = 16'h0000;

    $monitor("Time=%0t adr=%b data=%h AA=%h BB=%h CC=%h",
             $time,adr,data,AA_out,BB_out,CC_out);

    #12 reset = 0;

    data = 16'h1234; adr = 0;
    #10;

    data = 16'h5678; adr = 1;
    #10;

    data = 16'hABCD; adr = 0;
    #20;

    $finish;
end
endmodule */
