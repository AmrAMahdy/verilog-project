module d_flip_flop(q, clk, reset, d);
  input clk, reset, d;
  output reg q;

  always @ (reset or negedge clk) begin
    if(reset) q = 0;
    else q = d;
  end
endmodule


module d_flip_flop_tb;
  reg clk, reset, d;
  wire q;

  d_flip_flop DUT(q, clk, reset, d);

  initial begin
    clk = 0;
    reset = 0;
    d = 0;
    #3 reset = 1;
    #1 reset = 0;
    #1 d = 1;
    #3 d = 0;
    #2 d = 1;
    #5 d = 0;
    #1 d = 1;
    #2 reset = 1;
    #1 reset = 0;
  end

  always
    #2 clk = !clk;
endmodule
