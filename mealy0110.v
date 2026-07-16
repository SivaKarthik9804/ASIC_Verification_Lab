module mealy_0110(
    input clk, rst, x,
    output reg out
  );

  reg [1:0]state, next_state;

  localparam s0=2'b00, s1=2'b01, s2=2'b10, s3=2'b11;
  always @ (posedge clk or posedge rst) begin
    if(rst)
      state <= s0;
    else
      state <= next_state;
  end

  always @ (*) begin
    out = 0;
    next_state = state;

    case(state)
      s0 : begin
        if(x) next_state = s0;
        else
          next_state = s1;
      end

      s1 : begin
        if(x) next_state = s2;
        else
          next_state = s1;
      end

      s2 : begin
        if(x) next_state = s3;
        else
          next_state = s1;
      end

      s3 : begin
        if(x) next_state = s0;
        else
          next_state = s1; 
        out = 1'b1;
      end
    default : begin
      next_state = s0;
      out = 0;
    end
  endcase
end
endmodule
