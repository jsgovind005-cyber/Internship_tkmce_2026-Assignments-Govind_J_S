`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 19:23:48
// Design Name: 
// Module Name: top_modul_tb
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


module top_modul_tb;

reg clk;
reg rst;

wire [7:0] machine1_out;
wire [7:0] final_out;

top_modul DUT(
    .clk(clk),
    .rst(rst),
    .machine1_out(machine1_out),
    .final_out(final_out)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;

    #20 rst = 0;

    #400 $finish;
end

endmodule