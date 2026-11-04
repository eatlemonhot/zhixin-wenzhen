`timescale 1ns/1ps
// 在CPU时钟域按周期边界更新PWM，两只舵机分别保存目标位置。
module fdw_servo_pair124 (
    input wire clk, input wire resetn,
    input wire write_valid, input wire [7:0] write_offset,
    input wire [31:0] write_data, input wire [7:0] read_offset,
    output reg [31:0] read_data, output wire [1:0] pwm
);
    reg [1:0] enabled = 0, down_selected = 0;
    reg [11:0] up_us [0:1];
    reg [11:0] down_us [0:1];
    reg [11:0] requested_us [0:1];
    wire [11:0] active_us [0:1];
    wire [18:0] counter [0:1];
    wire [18:0] active_ticks [0:1];
    wire [31:0] frames [0:1];
    wire [1:0] running, startup_done;
    wire [1:0] pending;
    reg [31:0] error_code = 0, last_command = 0, command_sequence = 0;
    integer k;
    initial begin
        for (k=0;k<2;k=k+1) begin
            // 用户已确定方向：900us抬针，2100us落针；机械端点需实物复核。
            up_us[k]=900; down_us[k]=2100; requested_us[k]=900;
        end
    end
    genvar ch;
    generate for (ch=0;ch<2;ch=ch+1) begin: channels
        assign pending[ch] = enabled[ch] && (!running[ch] || requested_us[ch] != active_us[ch]);
        fdw_servo_pwm124 generator(.clk(clk),.resetn(resetn),.enable(enabled[ch]),
            .pulse_us(requested_us[ch]),.pwm(pwm[ch]),.active_us(active_us[ch]),
            .active_ticks(active_ticks[ch]),.counter(counter[ch]),.frame_count(frames[ch]),
            .running(running[ch]),.startup_done(startup_done[ch]));
    end endgenerate
    always @* begin
        read_data=0;
        case (read_offset)
            8'h00: read_data=32'h53525633;
            8'h04: begin
                read_data[1:0]=enabled;
                read_data[9:8]=pending;
                read_data[17:16]=down_selected;
                read_data[25:24]=startup_done;
                read_data[31]=error_code!=0;
            end
            8'h08: read_data=last_command;
            8'h0c: read_data=300300;
            8'h10: read_data=100000000;
            8'h14: read_data=124;
            8'h20: read_data=up_us[0];
            8'h24: read_data=down_us[0];
            8'h28: read_data=requested_us[0];
            8'h2c: read_data=active_us[0];
            8'h30: read_data=counter[0];
            8'h34: read_data=active_ticks[0];
            8'h38: read_data=frames[0];
            8'h40: read_data=up_us[1];
            8'h44: read_data=down_us[1];
            8'h48: read_data=requested_us[1];
            8'h4c: read_data=active_us[1];
            8'h50: read_data=counter[1];
            8'h54: read_data=active_ticks[1];
            8'h58: read_data=frames[1];
            8'h60: read_data=900;
            8'h64: read_data=2100;
            8'h68: read_data=1;
            8'h6c: read_data=3;
            8'h70: read_data=error_code;
            8'h78: read_data=command_sequence;
        endcase
    end
    always @(posedge clk) begin
        if (!resetn) begin
            enabled<=0; down_selected<=0; error_code<=0;
            last_command<=0; command_sequence<=0;
            for(k=0;k<2;k=k+1) begin
                up_us[k]<=900; down_us[k]<=2100; requested_us[k]<=900;
            end
        end else if (write_valid) begin
            case (write_offset)
                8'h08: begin
                    // 命令位9:8：0停波、1抬针、2落针；位1:0为通道掩码。
                    if ((write_data & 32'hfffffcfc)!=0 || write_data[1:0]==0 || write_data[9:8]==3) begin
                        error_code<=1;
                    end else begin
                        last_command<=write_data; command_sequence<=command_sequence+1'b1;
                        for(k=0;k<2;k=k+1) if(write_data[k]) begin
                            if(write_data[9:8]==0) enabled[k]<=0;
                            else begin
                                enabled[k]<=1;
                                down_selected[k]<=write_data[9:8]==2;
                                requested_us[k]<=write_data[9:8]==2 ? down_us[k] : up_us[k];
                            end
                        end
                    end
                end
                8'h20,8'h24,8'h40,8'h44: begin
                    if(write_data<900 || write_data>2100) error_code<=2;
                    else begin
                        // 写入预设本身不运动；下一次抬针/落针命令才选用新值。
                        if(write_offset[2]) down_us[write_offset[6]]<=write_data[11:0];
                        else up_us[write_offset[6]]<=write_data[11:0];
                    end
                end
                8'h70: begin
                    if(write_data==1) error_code<=0;
                    else error_code<=3;
                end
                default: error_code<=3;
            endcase
        end
    end
endmodule

// 保留300300拍周期、100拍每微秒和完整周期更新；允许900～2100us，增加主工程同步复位。
module fdw_servo_pwm124 #(
    parameter integer STARTUP_TICKS=2048
) (
    input wire clk, input wire resetn, input wire enable, input wire [11:0] pulse_us,
    output reg pwm=0, output reg [11:0] active_us=900,
    output reg [18:0] active_ticks=90000, output reg [18:0] counter=0,
    output reg [31:0] frame_count=0, output reg running=0,
    output wire startup_done
);
    reg [11:0] startup_count=0;
    wire config_valid=pulse_us>=900 && pulse_us<=2100;
    wire [18:0] requested_ticks=pulse_us*19'd100;
    assign startup_done=startup_count==STARTUP_TICKS-1;
    always @(posedge clk) begin
        if(!resetn) begin
            startup_count<=0; counter<=0; pwm<=0; running<=0;
            active_us<=900; active_ticks<=90000; frame_count<=0;
        end else begin
            if(!startup_done) startup_count<=startup_count+1'b1;
            if(!startup_done || !enable || !config_valid) begin
                counter<=0; pwm<=0; running<=0;
            end else if(!running || counter==300299) begin
                running<=1; counter<=0; active_ticks<=requested_ticks; active_us<=pulse_us;
                pwm<=1; frame_count<=frame_count+1'b1;
            end else begin
                counter<=counter+1'b1;
                pwm<=counter+1'b1<active_ticks;
            end
        end
    end
endmodule
