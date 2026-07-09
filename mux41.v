/*module mux41(
input i0, i1, i2, i3,
input [1:0]s,
output y );

assign y=( ~s[1] & ~s[0] & i0 | ~s[1] & s[0] & i1 | s[1] & ~s[0] & i2 | s[1] & s[2] & i3 );

endmodule 

module mux41_tb;
reg i0, i1, i2, i3;
reg [1:0]s;
wire y;

mux41 dut (.i0(i0), .i1(i1), .i2(i2), .i3(i3), .s(s), .y(y) );

initial begin
 $monitor ("Time=%t i0=%b i1=%b  i2=%b i3=%b  s=%b  y=%b",$time, i0, i1, i2, i3, s, y);

i0=0; i1=0; i2=0; i3=0;
s=2'b00;
#10 s=2'b01;
#10 s=2'b10;
#10 s=2'b11;


i0=0; i1=0; i2=0; i3=1;
s=2'b00;
#10 s=2'b01;
#10 s=2'b10;
#10 s=2'b11;


i0=0; i1=0; i2=1; i3=0;
s=2'b00;
#10 s=2'b01;
#10 s=2'b10;
#10 s=2'b11;


i0=0; i1=0; i2=1; i3=1;
s=2'b00;
#10 s=2'b01;
#10 s=2'b10;
#10 s=2'b11;


i0=0; i1=1; i2=0; i3=0;
s=2'b00;
#10 s=2'b01;
#10 s=2'b10;
#10 s=2'b11;


i0=0; i1=1; i2=0; i3=1;
s=2'b00;
#10 s=2'b01;
#10 s=2'b10;
#10 s=2'b11;


i0=0; i1=1; i2=1; i3=0;
s=2'b00;
#10 s=2'b01;
#10 s=2'b10;
#10 s=2'b11;


i0=0; i1=1; i2=1; i3=1;
s=2'b00;
#10 s=2'b01;
#10 s=2'b10;
#10 s=2'b11;


i0=1; i1=0; i2=0; i3=0;
s=2'b00;
#10 s=2'b01;
#10 s=2'b10;
#10 s=2'b11;


i0=1; i1=0; i2=0; i3=1;
s=2'b00;
#10 s=2'b01;
#10 s=2'b10;
#10 s=2'b11;


i0=1; i1=0; i2=1; i3=0;
s=2'b00;
#10 s=2'b01;
#10 s=2'b10;
#10 s=2'b11;


i0=1; i1=0; i2=1; i3=1;
s=2'b00;
#10 s=2'b01;
#10 s=2'b10;
#10 s=2'b11;


i0=1; i1=1; i2=0; i3=0;
s=2'b00;
#10 s=2'b01;
#10 s=2'b10;
#10 s=2'b11;


i0=1; i1=1; i2=0; i3=1;
s=2'b00;
#10 s=2'b01;
#10 s=2'b10;
#10 s=2'b11;


i0=1; i1=1; i2=1; i3=0;
s=2'b00;
#10 s=2'b01;
#10 s=2'b10;
#10 s=2'b11;


i0=1; i1=1; i2=1; i3=1;
s=2'b00;
#10 s=2'b01;
#10 s=2'b10;
#10 s=2'b11;

#10 $finish;


end
endmodule */

module mux41(
    input [3:0] i,
    input [1:0] s,
    output y
);

wire [3:0] w;
assign w = {i[3], i[2], i[1], i[0]};
assign y = w[s];
endmodule


module mux41_tb;
reg [3:0] i;
reg [1:0] s;
wire y;

integer k;

mux41 dut( .i(i), .s(s), .y(y) );

initial begin
    $monitor("i=%b s=%b y=%b", i, s, y);
    i = 4'b1010;
    for(k=0; k<4; k=k+1) begin
        s = k;
        #10;
    end
    $finish;
end
endmodule
