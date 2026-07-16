module palindrome(
    input [3:0] a,
    output y
);

assign y = ((a[3] == a[0]) && (a[2] == a[1])) ? 1'b1 : 1'b0;

endmodule

module palindrome_tb;
reg [3:0] a;
wire y;

integer i;

palindrome dut( .a(a), .y(y) );

initial begin
    $monitor("a=%b y=%b", a, y);
    for(i=0; i<16; i=i+1) begin
        a = i;
        #10;
    end
    $finish;
end
endmodule
