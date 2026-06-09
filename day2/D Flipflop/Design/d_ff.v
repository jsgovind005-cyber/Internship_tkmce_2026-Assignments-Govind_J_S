`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 19:12:54
// Design Name: 
// Module Name: d_ff
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


module d_ff (
    input d,
    input rst,
    input clk,
    output reg q,
    output reg qb
);

always @(posedge clk) begin
    if (rst) begin      // Synchronous reset
        q  <= 1'b0;
        qb <= 1'b1;
    end 
    else begin
        q  <= d;
        qb <= ~d;
    end
end

endmodule
