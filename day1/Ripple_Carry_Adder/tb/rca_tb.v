`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 09:34:49
// Design Name: 
// Module Name: rca_tb
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
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module ripple_carry_adder_tb;

    // Inputs
    reg A_0, A_1, A_2, A_3;
    reg B_0, B_1, B_2, B_3;
    reg Cin;

    // Outputs
    wire S_0, S_1, S_2, S_3;
    wire Cout;

    // Instantiate the DUT (Device Under Test)
    ripple_carry_adder DUT (
        .A_0(A_0),
        .A_1(A_1),
        .A_2(A_2),
        .A_3(A_3),
        .B_0(B_0),
        .B_1(B_1),
        .B_2(B_2),
        .B_3(B_3),
        .Cin(Cin),
        .S_0(S_0),
        .S_1(S_1),
        .S_2(S_2),
        .S_3(S_3),
        .Cout(Cout)
    );

    initial begin

        // Test Case 1: 0000 + 0000 + 0
        {A_3,A_2,A_1,A_0} = 4'b0000;
        {B_3,B_2,B_1,B_0} = 4'b0000;
        Cin = 0;
        #10;

        // Test Case 2: 0011 + 0101 + 0 = 1000
        {A_3,A_2,A_1,A_0} = 4'b0011;
        {B_3,B_2,B_1,B_0} = 4'b0101;
        Cin = 0;
        #10;

        // Test Case 3: 0111 + 0001 + 0 = 1000
        {A_3,A_2,A_1,A_0} = 4'b0111;
        {B_3,B_2,B_1,B_0} = 4'b0001;
        Cin = 0;
        #10;

        // Test Case 4: 1111 + 0001 + 0 = 10000
        {A_3,A_2,A_1,A_0} = 4'b1111;
        {B_3,B_2,B_1,B_0} = 4'b0001;
        Cin = 0;
        #10;

        // Test Case 5: 1010 + 0101 + 1 = 10000
        {A_3,A_2,A_1,A_0} = 4'b1010;
        {B_3,B_2,B_1,B_0} = 4'b0101;
        Cin = 1;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t A=%b%b%b%b B=%b%b%b%b Cin=%b Sum=%b%b%b%b Cout=%b",$time,A_3,A_2,A_1,A_0,B_3,B_2,B_1,B_0,Cin,S_3,S_2,S_1,S_0,Cout);
    end

endmodule
