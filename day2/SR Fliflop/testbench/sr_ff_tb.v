`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 14:02:18
// Design Name: 
// Module Name: sr_ff_tb
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


module sr_ff_tb();
  // Testbench signals
  reg s_tb;
  reg r_tb;
  reg rst_tb;
  reg clk_tb;
  
  wire q_tb;
  wire qb_tb;

  sr_latch dut(s_tb, r_tb, rst_tb, clk_tb, q_tb, qb_tb);

  always #5 clk_tb = ~clk_tb;

  initial begin
    $monitor("Time=%0t | enb=%b rst=%b | s=%b r=%b | q=%b qb=%b", 
             $time, clk_tb, rst_tb, s_tb, r_tb, q_tb, qb_tb);

    
    s_tb   = 0;
    r_tb   = 0;
    rst_tb = 0;
    clk_tb = 0; 
    #5;         

    rst_tb = 1; 
    #10;        
    
    rst_tb = 0;
    #5;

        s_tb = 1; r_tb = 0;
    #10;

    
    s_tb = 0; r_tb = 0;
    #10;

    
    s_tb = 0; r_tb = 1;
    #10;

    
    s_tb = 1; r_tb = 0; 
    #10;                
    s_tb = 1; r_tb = 1;
    #10;

    // End simulation
    $finish;
  end

endmodule
