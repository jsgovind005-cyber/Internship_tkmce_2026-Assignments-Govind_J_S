`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 19:20:59
// Design Name: 
// Module Name: bcd_intf
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


interface bcd_if;
    logic [3:0] A;
    logic [3:0] B;
    logic       CIN;
    logic [3:0] SUM;
    logic       COUT;
endinterface


module bcd_intf;

    bcd_if bcd();

    BCD_ADDER dut(
        bcd.A,
        bcd.B,
        bcd.CIN,
        bcd.SUM,
        bcd.COUT
    );

    initial begin

        $monitor("Time=%0t A=%b B=%b CIN=%b SUM=%b COUT=%b",
                  $time,
                  bcd.A,
                  bcd.B,
                  bcd.CIN,
                  bcd.SUM,
                  bcd.COUT);

        bcd.A   = 4'd0;
        bcd.B   = 4'd0;
        bcd.CIN = 1'b0;
        #10;

        bcd.A   = 4'd1;
        bcd.B   = 4'd2;
        bcd.CIN = 1'b0;
        #10;

        bcd.A   = 4'd4;
        bcd.B   = 4'd5;
        bcd.CIN = 1'b0;
        #10;

        bcd.A   = 4'd6;
        bcd.B   = 4'd7;
        bcd.CIN = 1'b0;
        #10;

        bcd.A   = 4'd8;
        bcd.B   = 4'd8;
        bcd.CIN = 1'b0;
        #10;

        bcd.A   = 4'd9;
        bcd.B   = 4'd9;
        bcd.CIN = 1'b1;
        #10;

        $finish;

    end

endmodule