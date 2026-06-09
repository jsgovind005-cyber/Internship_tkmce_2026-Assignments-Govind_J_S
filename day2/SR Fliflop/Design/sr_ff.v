`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 12:38:54
// Design Name: 
// Module Name: sr_ff
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


module sr_ff(input s,r,rst,clk,output reg q,qb);

always @(posedge clk)
begin
if (clk) 
begin
if(rst) begin  //synchronous reset
q<=1'b0;
qb<=1'b1;
end
else if(s==0 & r==0)
begin
q<=q;
qb<=qb;
end
else if(s==0 & r==1)
begin
q<=1'b0;
qb<=1'b1;
end
else if(s==1 & r==0)
begin
q<=1'b1;
qb<=1'b0;
end
else if(s==1 & r==1)
begin
q<='bx;
qb<='bx;
end
end
end
endmodule
