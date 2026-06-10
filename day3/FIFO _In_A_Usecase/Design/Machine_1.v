`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 21:09:21
// Design Name: 
// Module Name: Machine_1
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


module Machine_1(
    input clk,
    input rst,
    input full,
    output reg wrenb,
    output reg [7:0] data_out
);

always @(posedge clk)
begin
    if(rst)
    begin
        data_out <= 8'd1;
        wrenb <= 0;
    end
    else
    begin
        if(!full)
        begin
            wrenb <= 1'b1;
            data_out <= data_out + 1'b1;
        end
        else
            wrenb <= 1'b0;
    end
end

endmodule