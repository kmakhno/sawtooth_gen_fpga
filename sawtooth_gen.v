module sawtooth_gen
#(parameter WIDTH_ADDR = 16, parameter HEIGHT_ADDR = 16)
(
	input i_clk,
	input [3:0] sw,
	output i_clk_to_dac,
	output reg [13:0] dac_in
);

wire o_pll_clk;
reg [13:0] step = 14'd327;

my_pll my_pll_inst(
							.inclk0(i_clk),
							.c0(o_pll_clk));

assign i_clk_to_dac = ~o_pll_clk;
	
always @(posedge i_clk_to_dac)
	dac_in <= dac_in + step;

	
endmodule
