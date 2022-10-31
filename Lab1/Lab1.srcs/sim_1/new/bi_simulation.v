`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/30 11:52:53
// Design Name: 
// Module Name: bi_simulation
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


module bi_simulation();
    
    reg[3:0] a,b,c;
    wire[3:0]max;
    clock c2(
    .A(a),
    .B(b),
    .C(c),
    .max(max)
    );
    initial begin
    a=4'b0000;
    b=4'b0001;
    c=4'b0010;
    $display("This is a test number: %b.", max);
    #200
    a=4'b1100;
    b=4'b0101;
    c=4'b0010;
    $display("This is a test number: %b.", max);
    #200
    a=4'b0100;
    b=4'b1111;
    c=4'b0001;
    $display("This is a test number: %b.", max);
    end
  
endmodule
