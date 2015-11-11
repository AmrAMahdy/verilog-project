module counter(count, clk, reset, enable);
  input clk, reset, enable;
  output reg [3:0] count;

  always @(reset or posedge clk) begin
    if(reset) count = 4'b0000;
    else if(enable) count = count + 1;
  end
endmodule

module counter_tb;
  reg clk, reset, enable;
  wire [3:0] count;

  counter C1(count, clk, reset, enable);

  initial begin
    clk = 0;
    reset = 0;
    enable = 0;
    #2 reset = 1;
    #2 reset = 0;
    #2 enable = 1;
  end

  always
    #1 clk = !clk;

endmodule
