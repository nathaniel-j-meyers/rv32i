module up_counter #(
    parameter int WIDTH = 8  // Configurable bit-width (defaults to 8)
) (
    input  logic             clk,      // System clock
    input  logic             rst_n,    // Active-low asynchronous reset
    input  logic             en,       // Count enable
    output logic [WIDTH-1:0] count,    // Current counter value
    output logic             max_tick  // High when counter reaches max value
);

    // Sequential logic: updates registers on the rising clock edge
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= '0;               // Reset all bits to 0
        end else if (en) begin
            count <= count + 1'b1;     // Increment counter
        end
    end

    // Combinational logic: continuously evaluates the roll-over flag
    always_comb begin
        max_tick = (count == {WIDTH{1'b1}}) && en;
    end

endmodule : up_counter
