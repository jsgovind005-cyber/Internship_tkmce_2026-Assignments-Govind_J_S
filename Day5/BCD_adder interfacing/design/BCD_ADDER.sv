`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 19:42:02
// Design Name: 
// Module Name: BCD_ADDER
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


module BCD_ADDER(
    input  logic [3:0] A,
    input  logic [3:0] B,
    input  logic       CIN,
    output logic [3:0] SUM,
    output logic       COUT
);

    logic [4:0] temp;

    always_comb begin
        temp = A + B + CIN;

        if (temp > 9) begin
            temp = temp + 6;
            COUT = 1'b1;
        end
        else begin
            COUT = 1'b0;
        end

        SUM = temp[3:0];
    end

endmodule
