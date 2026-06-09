module bcd_adder(
    input A_0,A_1,A_2,A_3,
    input B_0,B_1,B_2,B_3,
    input Cin,
    output S_0,S_1,S_2,S_3,
    output Cout
);

wire Z0,Z1,Z2,Z3;      // First addition result
wire C1;               // First addition carry
wire K;                // Correction signal

wire D0,D1,D2,D3;      // Second adder carry chain

// First 4-bit addition
ripple_carry_adder RCA1(
    A_0,A_1,A_2,A_3,
    B_0,B_1,B_2,B_3,
    Cin,
    Z0,Z1,Z2,Z3,
    C1
);

// Detect invalid BCD result
assign K = C1 | (Z3 & Z2) | (Z3 & Z1);

// Add 6 (0110) if correction is needed
ripple_carry_adder RCA2(
    Z0,Z1,Z2,Z3,
    1'b0,K,K,1'b0,   // 0110 when K=1, otherwise 0000
    1'b0,
    S_0,S_1,S_2,S_3,
    Cout
);

endmodule

