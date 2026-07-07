// Using if - else statements

module fulladder_beh(
  input a, b, cin,
    output reg sum, carry
  );

  always @ (*) begin
    if ( a==1'b0 && b==1'b0 && cin==1'b0)       begin sum = 1'b0; carry= 1'b0; end
    else if  ( a==1'b0 && b==1'b0 && cin==1'b1) begin sum = 1'b1; carry= 1'b0; end
    else if  ( a==1'b0 && b==1'b1 && cin==1'b0) begin sum = 1'b1; carry= 1'b0; end
    else if  ( a==1'b0 && b==1'b1 && cin==1'b1) begin sum = 1'b0; carry= 1'b1; end
    else if  ( a==1'b1 && b==1'b0 && cin==1'b0) begin sum = 1'b1; carry= 1'b0; end
    else if  ( a==1'b1 && b==1'b0 && cin==1'b1) begin sum = 1'b0; carry= 1'b1; end
    else if  ( a==1'b1 && b==1'b1 && cin==1'b0) begin sum = 1'b0; carry= 1'b1; end
    else begin sum=1'b1; carry=1'b1; end
  end
endmodule

module fulladder_beh_tb;
  reg a, b, cin;
  wire sum, carry;

  fulladder_beh dut ( .a(a), .b(b), .cin(cin), .sum(sum), .carry(carry) );
  initial begin
    $monitor( "$Time=0%t a=%b b=%b cin=%b sum=%b carry=%b", $time, a, b, cin, sum, carry );
    a=1'b0; b=1'b0; cin=1'b0;
#10 a=1'b0; b=1'b0; cin=1'b1;
#10 a=1'b0; b=1'b1; cin=1'b0;
#10 a=1'b0; b=1'b1; cin=1'b1;
#10 a=1'b1; b=1'b0; cin=1'b0;
#10 a=1'b1; b=1'b0; cin=1'b1;
#10 a=1'b1; b=1'b1; cin=1'b0;
#10 a=1'b1; b=1'b1; cin=1'b1;
#10 $finish;

end
endmodule

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//Using Case Statements 

module fulladder_case(
  input a, b, cin,
    output reg sum, carry
  );

 always @ (*) begin
   case({a, b, cin})
     3'b000 : begin sum=1'b0; carry=1'b0; end
     3'b001 : begin sum=1'b1; carry=1'b0; end
     3'b010 : begin sum=1'b1; carry=1'b0; end
     3'b011 : begin sum=1'b0; carry=1'b1; end
     3'b100 : begin sum=1'b1; carry=1'b0; end
     3'b101 : begin sum=1'b0; carry=1'b1; end
     3'b110 : begin sum=1'b0; carry=1'b1; end
     3'b111 : begin sum=1'b1; carry=1'b1; end
     default : begin sum=1'b0; carry=1'b0; end
   endcase
 end
 endmodule

 module fulladder_case_tb;
   reg a, b, cin;
   wire sum, carry;

   fulladder_case dut ( .a(a), .b(b), .cin(cin), .sum(sum), .carry(carry) );
   initial begin
   $monitor( "$Time=0%t a=%b b=%b cin=%b sum=%b carry=%b", $time, a, b, cin, sum, carry );
    a=1'b0; b=1'b0; cin=1'b0;
#10 a=1'b0; b=1'b0; cin=1'b1;
#10 a=1'b0; b=1'b1; cin=1'b0;
#10 a=1'b0; b=1'b1; cin=1'b1;
#10 a=1'b1; b=1'b0; cin=1'b0;
#10 a=1'b1; b=1'b0; cin=1'b1;
#10 a=1'b1; b=1'b1; cin=1'b0;
#10 a=1'b1; b=1'b1; cin=1'b1;
#10 $finish;

end
endmodule







