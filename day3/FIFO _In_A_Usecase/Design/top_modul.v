`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 19:22:29
// Design Name: 
// Module Name: top_modul
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



module top_modul(
    input clk,
    input rst,
    output [7:0] machine1_out,
    output [7:0] final_out
);

wire wrenb;
wire rdenb;

wire full;
wire empty;

wire [7:0] fifo_out;

// Machine 1
Machine_1 M1(
    .clk(clk),
    .rst(rst),
    .full(full),
    .wrenb(wrenb),
    .data_out(machine1_out)
);

// FIFO
FIFO F1(
    .clk(clk),
    .rst(rst),
    .wrenb(wrenb),
    .rdenb(rdenb),
    .data_in(machine1_out),
    .data_out(fifo_out),
    .full(full),
    .empty(empty)
);

// Machine 2
Machine_2 M2(
    .clk(clk),
    .rst(rst),
    .empty(empty),
    .fifo_data(fifo_out),
    .rdenb(rdenb),
    .final_out(final_out)
);

endmodule
