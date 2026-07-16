module moore_0110(
    input clk, rst, x,
    output reg out
  );

  reg [2:0]state, next_state;
  localparam s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100;

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
        next_state = s4;
    end

    s4 : begin
      if(x) next_state = s2;
      else
        next_state = s1; out = 1;
    end
  endcase
end
endmodule





