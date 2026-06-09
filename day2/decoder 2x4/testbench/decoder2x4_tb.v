`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 19:30:08
// Design Name: 
// Module Name: decoder_2by4_tb
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


module decoder_2by4_tb;

reg [1:0] a;
wire [3:0] d;

decoder_2by4 uut (a,d);

initial begin
    a = 2'b00;
    #10 a = 2'b01;
    #10 a = 2'b10;
    #10 a = 2'b11;
    #10 a = 2'bx;
    #10 $finish;
end

initial begin
    $monitor("Time=%0t | a=%b | d=%b", $time, a, d);
end

endmodule
