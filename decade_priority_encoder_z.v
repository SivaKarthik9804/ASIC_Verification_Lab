module priority_encoder_z(
    input [9:0]d,
    output reg [3:0]y
  );

  always @ (*) begin
   /* casez(d)
      10'b1????????? : y=4'b1001;
      10'b?1???????? : y=4'b1000;
      10'b??1??????? : y=4'b0111;
      10'b???1?????? : y=4'b0110;
      10'b????1????? : y=4'b0101;
      10'b?????1???? : y=4'b0100;
      10'b??????1??? : y=4'b0011;
      10'b???????1?? : y=4'b0010;
      10'b????????1? : y=4'b0001;
      10'b?????????1 : y=4'b0000;
      default : y=4'b0000;*/
     casex(d)
      10'b1xxxxxxxxx : y=4'b1001;
      10'bx1xxxxxxxx : y=4'b1000;
      10'bxx1xxxxxxx : y=4'b0111;
      10'bxxx1xxxxxx : y=4'b0110;
      10'bxxxx1xxxxx : y=4'b0101;
      10'bxxxxx1xxxx : y=4'b0100;
      10'bxxxxxx1xxx : y=4'b0011;
      10'bxxxxxxx1xx : y=4'b0010;
      10'bxxxxxxxx1x : y=4'b0001;
      10'bxxxxxxxxx1 : y=4'b0000;
      default : y=4'b0000;
    endcase
  end
endmodule

module priority_encoder_z_tb;
  reg [9:0]d;
  wire [3:0]y;

  priority_encoder_z dut ( .d(d), .y(y) );
  initial begin 
    $monitor("$Time=0%t d=%b y=%b", $time, d, y);
    d=10'b1000000000;
#10 d=10'b0100000000;
#10 d=10'b0010000000;
#10 d=10'b0001000000;
#10 d=10'b0000100000;
#10 d=10'b0000010000;
#10 d=10'b0000001000;
#10 d=10'b0000000100;
#10 d=10'b0000000010;
#10 d=10'b0000000001;

#10 d=10'b0100011100;
#10 d=10'b1011010011;
#10 d=10'b0000001111;
#10 d=10'b1010101010;

#10 $finish;

end
endmodule


