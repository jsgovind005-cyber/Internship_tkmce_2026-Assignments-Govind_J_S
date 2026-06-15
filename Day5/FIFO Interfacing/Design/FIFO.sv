`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 19:52:46
// Design Name: 
// Module Name: FIFO
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


module FIFO(
    input logic clk,
    input logic rst,
    input logic wr_en,
    input logic rd_en,
    input logic [7:0] data_in,
    output logic [7:0] data_out,
    output logic full,
    output logic empty
);

    logic [7:0] mem [0:3];
    logic [1:0] w_ptr, r_ptr;
    logic [2:0] count;

    always_ff @(posedge clk or posedge rst) begin
        if(rst) begin
            w_ptr <= 0;
            r_ptr <= 0;
            count <= 0;
            data_out <= 0;
        end
        else begin

            if(wr_en && !full) begin
                mem[w_ptr] <= data_in;
                w_ptr <= w_ptr + 1;
                count <= count + 1;
            end

            if(rd_en && !empty) begin
                data_out <= mem[r_ptr];
                r_ptr <= r_ptr + 1;
                count <= count - 1;
            end

        end
    end

    assign full  = (count == 4);
    assign empty = (count == 0);

endmodule
