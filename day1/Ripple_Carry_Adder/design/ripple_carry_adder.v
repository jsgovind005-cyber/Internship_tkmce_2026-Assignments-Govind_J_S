`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 21:13:37
// Design Name: 
// Module Name: ripple_carry_adder
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

module ripple_carry_adder(input A_0,A_1,A_2,A_3,B_0,B_1,B_2,B_3,Cin,output S_0,S_1,S_2,S_3,Cout);
wire W1,W2,W3;
fulladd FA1(A_0,B_0,Cin,S_0,W1);
fulladd FA2(A_1,B_1,W1,S_1,W2);
fulladd FA3(A_2,B_2,W2,S_2,W3);
fulladd FA4(A_3,B_3,W3,S_3,Cout);
endmodule
