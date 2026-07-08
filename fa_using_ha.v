module halfadder(
    input a, b,
    output sum, carry
  );
  assign sum= a^b;
  assign carry= a&b;
endmodule

module fulladder_hire(
    input a, b, cin,
    output sum, carry 
  );
  wire s1, c1, c2;

  halfadder ha1 (a, b, s1, c1);
  halfadder ha2 (s1, cin, sum, c2);  
  assign carry = c1 | c2;
endmodule

module fulladder_hire_tb;
  reg a, b , cin;
  wire sum, carry;

  fulladder_hire dut ( .a(a), .b(b), .cin(cin), .sum(sum), .carry(carry) );

  initial begin 
     $monitor("A=%b B=%b Cin=%b Sum=%b Carry=%b",
              a,b,cin,sum,carry);
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




 
