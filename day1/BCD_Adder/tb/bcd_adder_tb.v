`timescale 1ns/1ps

module bcd_adder_tb;

reg A_0,A_1,A_2,A_3;
reg B_0,B_1,B_2,B_3;
reg Cin;

wire S_0,S_1,S_2,S_3;
wire Cout;

integer i,j;

// Instantiate DUT
bcd_adder DUT(
    .A_0(A_0), .A_1(A_1), .A_2(A_2), .A_3(A_3),
    .B_0(B_0), .B_1(B_1), .B_2(B_2), .B_3(B_3),
    .Cin(Cin),
    .S_0(S_0), .S_1(S_1), .S_2(S_2), .S_3(S_3),
    .Cout(Cout)
);

initial
begin
    $display("   A      B    Cin | Cout   Sum");
    $monitor("%b%b%b%b  %b%b%b%b   %b  |  %b    %b%b%b%b",
              A_3,A_2,A_1,A_0,
              B_3,B_2,B_1,B_0,
              Cin,
              Cout,
              S_3,S_2,S_1,S_0);

    Cin = 0;

    // Test all valid BCD digits (0-9)
    for(i=0; i<=9; i=i+1)
    begin
        for(j=0; j<=9; j=j+1)
        begin
            {A_3,A_2,A_1,A_0} = i;
            {B_3,B_2,B_1,B_0} = j;
            #10;
        end
    end

    $finish;
end

endmodule