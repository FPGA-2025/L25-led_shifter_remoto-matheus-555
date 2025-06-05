module LedShifter #(
    parameter CLK_FREQ = 25_000_000 
) (
    input  wire clk,
    input  wire rst_n,
    output  reg [7:0] leds
);
    //
    localparam CLK = CLK_FREQ - 1;

    reg [31:0] counter;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 32'b0;
            leds    <= 8'b00011111;
        end else begin
            if (counter >= CLK_FREQ) begin
                leds    <= {leds[6:0], leds[7]};
                counter <= 32'b0;
            end else begin
                counter <= counter+1;
            end
        end
    end

endmodule
