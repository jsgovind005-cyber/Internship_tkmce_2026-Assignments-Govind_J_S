`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 20:33:24
// Design Name: 
// Module Name: usr_shiftregister_tb
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


module usr_shiftregister_tb;

reg clk;
reg rst;
reg [1:0] sel;
reg sin;
reg [3:0] pin;

wire sout;
wire [3:0] pout;

usr_shiftreg uut(
    .clk(clk),
    .rst(rst),
    .sel(sel),
    .sin(sin),
    .pin(pin),
    .sout(sout),
    .pout(pout)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    sel = 2'b00;
    sin = 0;
    pin = 4'b0000;

    #10 rst = 0;

    // PIPO: Load 1010
    sel = 2'b11;
    pin = 4'b1010;
    #10;

    // PISO: Shift out loaded data
    sel = 2'b10;
    #40;

    // SIPO: Shift in 1101
    sel = 2'b01;
    sin = 1; #10;
    sin = 1; #10;
    sin = 0; #10;
    sin = 1; #10;

    // SISO
    sel = 2'b00;
    sin = 1; #10;
    sin = 0; #10;

    $finish;
end

initial
begin
    $monitor("t=%0t sel=%b sin=%b pin=%b temp_out=%b sout=%b",
              $time, sel, sin, pin, pout, sout);
end

endmodule