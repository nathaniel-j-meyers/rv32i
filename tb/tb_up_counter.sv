module top (
    input  logic        sys_clk,
    input  logic        sys_rst_n,
    output logic [15:0] timer_val
);
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(0, top);
	end
	
    logic timer_done;

    // Instantiate a 16-bit version of up_counter
    up_counter #(
        .WIDTH(16)
    ) u_timer (
        .clk      (sys_clk),
        .rst_n    (sys_rst_n),
        .en       (1'b1),
        .count    (timer_val),
        .max_tick (timer_done)
    );

endmodule : top
