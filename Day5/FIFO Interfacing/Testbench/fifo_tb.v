`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 19:54:10
// Design Name: 
// Module Name: fifo_tb
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

interface fifo_if;

    logic clk;
    logic rst;
    logic wr_en;
    logic rd_en;
    logic [7:0] data_in;
    logic [7:0] data_out;
    logic full;
    logic empty;

endinterface
module fifo_tb;

    fifo_if fifo();

    FIFO dut(
        fifo.clk,
        fifo.rst,
        fifo.wr_en,
        fifo.rd_en,
        fifo.data_in,
        fifo.data_out,
        fifo.full,
        fifo.empty
    );

    initial begin
        fifo.clk = 0;
        forever #5 fifo.clk = ~fifo.clk;
    end

    initial begin

        $monitor("T=%0t rst=%b wr=%b rd=%b din=%h dout=%h full=%b empty=%b",
                  $time,
                  fifo.rst,
                  fifo.wr_en,
                  fifo.rd_en,
                  fifo.data_in,
                  fifo.data_out,
                  fifo.full,
                  fifo.empty);

        fifo.rst = 1;
        fifo.wr_en = 0;
        fifo.rd_en = 0;
        fifo.data_in = 0;

        #10;
        fifo.rst = 0;

        // Write data
        fifo.wr_en = 1;

        fifo.data_in = 8'h11;
        #10;

        fifo.data_in = 8'h22;
        #10;

        fifo.data_in = 8'h33;
        #10;

        fifo.data_in = 8'h44;
        #10;

        fifo.wr_en = 0;

        // Read data
        fifo.rd_en = 1;

        #10;
        #10;
        #10;
        #10;

        fifo.rd_en = 0;

        #20;
        $finish;

    end

endmodule

