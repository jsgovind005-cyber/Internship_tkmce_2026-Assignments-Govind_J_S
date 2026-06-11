`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2026 19:15:46
// Design Name: 
// Module Name: tb_block_memory_gen
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


module tb_block_memory_generator();

    // 1. Parameter Definitions
    // Using a smaller address width (4 bits = 16 locations) for a cleaner simulation
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4; 

    // 2. Testbench Signals
    reg  clk;
    reg  we;
    reg  [ADDR_WIDTH-1:0] addr;
    reg  [DATA_WIDTH-1:0] din;
    wire [DATA_WIDTH-1:0] dout;

    // 3. Instantiate the Unit Under Test (UUT)
    block_memory_generator #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    // 4. Clock Generation (10ns period / 100MHz)
    always #5 clk = ~clk;

    // 5. Stimulus Process
    initial begin
        // Initialize inputs
        clk = 0;
        we = 0;
        addr = 0;
        din = 0;

        // Set up console monitoring to watch the signals change
        $display("Starting Block RAM Testbench...");
        $display("Time\t clk we addr din  dout");
        $monitor("%0t\t  %b   %b   %0h   %0h   %0h", $time, clk, we, addr, din, dout);

        // Wait a bit before starting
        #15;

        // --- WRITE PHASE ---
        // It is best practice to change synchronous inputs on the falling edge 
        // to ensure setup/hold times are met for the rising edge.
        
        @(negedge clk);
        we = 1; addr = 4'h0; din = 8'hAA; // Write AA to address 0

        @(negedge clk);
        we = 1; addr = 4'h1; din = 8'hBB; // Write BB to address 1

        @(negedge clk);
        we = 1; addr = 4'h5; din = 8'hCC; // Write CC to address 5

        // --- READ PHASE ---
        // Turn off write enable to transition to reading
        @(negedge clk);
        we = 0; addr = 4'h0; // Request read from address 0
        
        // Note: Because this is synchronous RAM, `dout` will not equal 8'hAA 
        // until the NEXT rising edge of the clock.
        
        @(negedge clk);
        addr = 4'h1; // Request read from address 1 (Address 0's data is now on dout)

        @(negedge clk);
        addr = 4'h5; // Request read from address 5 (Address 1's data is now on dout)

        @(negedge clk);
        addr = 4'hF; // Request read from empty address 15 

        // Wait a few clock cycles before ending
        #20;
        $display("Testbench completed.");
        $finish;
    end

endmodule
