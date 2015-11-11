module d_flip_flop(q, clk, reset, d);
  input clk, reset, d;
  output reg q;

  always @ (reset or negedge clk) begin
    if(reset) #1 q = 0;
    else #1 q = d;
  end
endmodule


module d_flip_flop_tb;
  reg clk, reset, d;
  wire q;

  d_flip_flop DUT(q, clk, reset, d);

  reg [31:0] inp;
  reg [4:0] i;
  initial begin
    i = 0;
    inp = 548126;
    for(i = 0; i < 32; i = i + 1) begin
      #10 d = inp[i];
    end
  end

  initial begin
    clk = 0;
    reset = 0;
    d = 0;
    #3 reset = 1;
    #1 reset = 0;
  end

  always
    #8 clk = !clk;
endmodule
