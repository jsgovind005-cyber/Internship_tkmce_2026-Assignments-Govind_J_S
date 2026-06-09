`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 19:13:25
// Design Name: 
// Module Name: d_ff_tb
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


module d_ff_tb;
    reg d;
    reg rst;
    reg clk;
    
    wire q;
    wire qb;
    
    d_ff uut (d,rst,clk,q,qb);

   
    always #5 clk = ~clk;

    
    initial begin
      
        clk = 0;
        rst = 1;   
        d = 0;

        #10;
        rst = 0; 

        #10 d = 1; 
        #10 d = 0; 
        #10 d = 1; 
        
        #10 rst = 1; 
        #10 rst = 0; 
        
        #10 d = 0;

        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | clk=%b | rst=%b | d=%b | q=%b | qb=%b", $time, clk, rst, d, q, qb);
    end

endmodule
