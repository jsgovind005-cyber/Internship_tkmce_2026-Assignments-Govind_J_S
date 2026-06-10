`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 11:15:41
// Design Name: 
// Module Name: ov_seq_1110
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


module ov_seq_1110(
    input clk,
    input rst,
    input din,
    output reg detect
);

parameter idle = 2'b00;
parameter s1   = 2'b01;
parameter s2   = 2'b10;
parameter s3   = 2'b11;

reg [1:0] ps, ns;

// Present state logic
always @(posedge clk)
begin
    if(rst)
        ps <= idle;
    else
        ps <= ns;
end

// Next-state logic 
always @(*)
begin
    detect = 1'b0;

    case(ps)

        idle:
        begin
            if(din == 1'b1)
                ns = s1;
            else
                ns = idle;
        end

        s1:
        begin
            if(din == 1'b1)
                ns = s2;
            else
                ns = idle;
        end

        s2:
        begin
            if(din == 1'b1)
                ns = s3;
            else
                ns = idle;
        end

        s3:
        begin
            if(din == 1'b0)
            begin
                detect = 1'b1;  // Sequence 1110 detected
                ns = idle;      // Non-overlapping
            end
            else
                ns = s2;
        end

        default:
            ns = idle;

    endcase
end
endmodule
