`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 11:34:48
// Design Name: 
// Module Name: ov_seq_1110_tb
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


module ov_seq_1110_tb;

reg clk;
reg rst;
reg din;
wire detect;

// Instantiate the DUT
ov_seq_1110 uut (
    .clk(clk),
    .rst(rst),
    .din(din),
    .detect(detect)
);

// Clock generation (10 ns period)
always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    din = 0;

    // Apply reset
    #10;
    rst = 0;

    // Test Case 1: 1110 (should detect once)
    din = 1; #10;
    din = 1; #10;
    din = 1; #10;
    din = 0; #10;

    // Test Case 2: 11101110 (should detect twice)
    din = 1; #10;
    din = 1; #10;
    din = 1; #10;
    din = 0; #10;

    din = 1; #10;
    din = 1; #10;
    din = 1; #10;
    din = 0; #10;

    // Test Case 3: 111110 (overlap path check)
    din = 1; #10;
    din = 1; #10;
    din = 1; #10;
    din = 1; #10;
    din = 1; #10;
    din = 0; #10;

    #20;
    $finish;
end

// Monitor signals
initial
begin
    $monitor("Time=%0t | rst=%b | din=%b | detect=%b",
              $time, rst, din, detect);
end

endmodule