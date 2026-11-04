`timescale 1ns/1ps
// 独立舵机PWM，默认关闭；所有寄存器和输出都在GP时钟域。
module fdw_servo_pwm #(
    parameter integer CLOCK_HZ = 100000000,
    parameter integer PERIOD_TICKS = (CLOCK_HZ + 166) / 333
) (
    input wire clk,
    input wire resetn,
    input wire write_valid,
    input wire [7:0] write_offset,
    input wire [31:0] write_data,
    input wire [7:0] read_offset,
    output reg [31:0] read_data,
    output reg pwm = 1'b0
);
    localparam integer WIDTH = $clog2(PERIOD_TICKS);
    localparam integer INITIAL_TICKS = CLOCK_HZ / 1000000 * 1520;
    localparam integer MIN_TICKS = CLOCK_HZ / 1000000 * 1500;
    localparam integer MAX_TICKS = CLOCK_HZ / 1000000 * 2100;
    reg enabled = 1'b0;
    reg error = 1'b0;
    reg [WIDTH-1:0] counter = 0;
    reg [WIDTH-1:0] requested_pulse = INITIAL_TICKS;
    reg [WIDTH-1:0] active_pulse = INITIAL_TICKS;
    wire pending = requested_pulse != active_pulse;

    always @* begin
        case (read_offset)
            8'h00: read_data = 32'h53525631;
            8'h04: read_data = {29'd0, error, pending, enabled};
            8'h08: read_data = requested_pulse;
            8'h0c: read_data = PERIOD_TICKS;
            8'h10: read_data = active_pulse;
            8'h14: read_data = CLOCK_HZ;
            8'h18: read_data = counter;
            8'h1c: read_data = 32'h20261027;
            default: read_data = 0;
        endcase
    end

    always @(posedge clk) begin
        if (!resetn) begin
            enabled <= 0; error <= 0; counter <= 0; pwm <= 0;
            requested_pulse <= INITIAL_TICKS;
            active_pulse <= INITIAL_TICKS;
        end else begin
            if (enabled) begin
                if (counter == PERIOD_TICKS - 1) begin
                    counter <= 0;
                    active_pulse <= requested_pulse;
                    pwm <= 1;
                end else begin
                    counter <= counter + 1'b1;
                    pwm <= (counter + 1'b1) < active_pulse;
                end
            end else begin
                counter <= 0; pwm <= 0;
                active_pulse <= requested_pulse;
            end
            if (write_valid) begin
                case (write_offset)
                    8'h04: begin
                        if (write_data == 0) begin
                            enabled <= 0; counter <= 0; pwm <= 0;
                        end else if (write_data == 1 && !error) begin
                            enabled <= 1;
                            if (!enabled) begin
                                counter <= 0; active_pulse <= requested_pulse; pwm <= 1;
                            end
                        end else error <= 1;
                    end
                    8'h08: begin
                        if (write_data >= MIN_TICKS && write_data <= MAX_TICKS &&
                            write_data < PERIOD_TICKS) begin
                            requested_pulse <= write_data[WIDTH-1:0];
                            if (!enabled) active_pulse <= write_data[WIDTH-1:0];
                            error <= 0;
                        end else error <= 1;
                    end
                    default: error <= 1;
                endcase
            end
        end
    end
endmodule
