`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 21:10:54
// Design Name: 
// Module Name: Machine_2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Machine_2(
    input clk,
    input rst,
    input empty,
    input [7:0] fifo_data,
    output reg rdenb,
    output reg [7:0] final_out
);

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;

reg [1:0] ps;
reg read_pending;

always @(posedge clk)
begin
    if(rst)
    begin
        ps <= S0;
        rdenb <= 0;
        final_out <= 0;
        read_pending <= 0;
    end
    else
    begin
        if(read_pending)
        begin
            final_out <= fifo_data;
            read_pending <= 0;
        end

        rdenb <= 0;

        case(ps)

            S0:
                ps <= S1;

            S1:
                ps <= S2;

            S2:
            begin
                if(!empty)
                begin
                    rdenb <= 1;
                    read_pending <= 1;
                end
                ps <= S0;
            end

            default:
                ps <= S0;

        endcase
    end
end

endmodule