module alu #(
	parameter int WIDTH = 32,
	parameter int OPCODES = 4
)(
	input logic clk,
	input logic rst_h,
	input logic [$clog2(OPCODES)-1:0] opcode,
	input logic [$clog2(WIDTH)-1:0] a,
	input logic [$clog2(WIDTH)-1:0] b,
	
	output logic [$clog2(WIDTH)-1:0] out,
	output logic carry
);

endmodule : alu