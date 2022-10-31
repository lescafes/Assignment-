`timescale 1ns / 1ps


module main(
    input [7:0] I,
    output wire[6:0] a,
    input EI
    );
    wire [2:0] H_code;
    wire H_GSto_BL;
    wire H_EO;
    encoder_83 encode(I,H_code,EI,H_EO,H_GSto_BL);
    decoder decode(
    .I(H_code),
    .a(a),
    .LE(0),
    ._BL(H_GSto_BL),
    ._LT(1)
    );
endmodule
module decoder(
    input [2:0] I,
    output reg [6:0] a,
    input LE,
    input _BL,
    input _LT
    );
    always@(I or LE or _BL or _LT)
            if (_LT == 0) begin a<=7'b0000000; end
            else if(_BL == 0) begin a<=7'b1111111; end
            else if(I == 3'b000) begin a<=7'b0000001;end
            else if(I == 3'b001) begin a<=7'b1001111;end 
            else if(I == 3'b010) begin a<=7'b0010010;end 
            else if(I == 3'b011) begin a<=7'b0000110;end    
            else if(I == 3'b100) begin a<=7'b1001100;end
            else if(I == 3'b101) begin a<=7'b0100100;end
            else if(I == 3'b110) begin a<=7'b1100000;end
            else if(I == 3'b111) begin a<=7'b0001111;end
endmodule

module encoder_83(
    input wire[7:0] I,
    output reg [2:0] a,
    input EI,
    output reg EO,
    output reg GS
    );
    always @(I or EI)
          if(EI == 0) begin a <= 3'b000; GS <= 0; EO <= 0; end 
          else if (I[7] == 1) begin a <= 3'b111; GS <= 1; EO <= 0; end
          else if (I[6] == 1) begin a <= 3'b110; GS <= 1; EO <= 0; end
          else if (I[5] == 1) begin a <= 3'b101; GS <= 1; EO <= 0; end
          else if (I[4] == 1) begin a <= 3'b100; GS <= 1; EO <= 0; end
          else if (I[3] == 1) begin a <= 3'b011; GS <= 1; EO <= 0; end
          else if (I[2] == 1) begin a <= 3'b010; GS <= 1; EO <= 0; end
          else if (I[1] == 1) begin a <= 3'b001; GS <= 1; EO <= 0; end
          else if (I[0] == 1) begin a <= 3'b000; GS <= 1; EO <= 0; end
          else if (I == 8'b00000000) begin a <= 3'b000; GS <= 0; EO <= 1; end
endmodule
