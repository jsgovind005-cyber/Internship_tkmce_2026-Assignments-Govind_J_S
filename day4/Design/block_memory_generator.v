`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2026 19:07:27
// Design Name: 
// Module Name: block_memory_generator
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


module block_memory_generator #(
    parameter DATA_WIDTH = 8,    
    parameter ADDR_WIDTH = 8     
)(
    input  wire                  clk,
    input  wire                  we,     
    input  wire [ADDR_WIDTH-1:0] addr,   
    input  wire [DATA_WIDTH-1:0] din,    // Data Input
    output reg  [DATA_WIDTH-1:0] dout    // Data Output
);

    
    localparam MEM_DEPTH = 1 << ADDR_WIDTH;

    
    reg [DATA_WIDTH-1:0] ram [0:MEM_DEPTH-1];

    
    always @(posedge clk) begin
        if (we) begin
            ram[addr] <= din;
        end
       
        dout <= ram[addr]; 
    end

endmodule
