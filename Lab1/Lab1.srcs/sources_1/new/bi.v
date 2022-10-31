`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/29 14:55:42
// Design Name: 
// Module Name: time
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


module max2to1(a,b,max);
    input[3:0] a,b;
    output reg[3:0]max;
    always@(a,b)
    begin
    if(a>b)
    max=a;
    else
    max=b;
    end
endmodule



module clock(input[3:0] A,
 input [3:0] B,input[3:0]C,output[3:0]max);
   wire [3:0]max1,max2;
   always@(*);
   begin 
   max2to1 max_1(.a(A),.b(B),.max(max1));
   max2to1 max_2(.a(B),.b(C),.max(max2));
   max2to1 remax(.a(max1),.b(max2),.max(max));
   end
endmodule

