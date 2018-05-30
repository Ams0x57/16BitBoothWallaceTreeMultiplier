`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:04:04 05/24/2018 
// Design Name: 
// Module Name:    RippleCarryAdder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RippleCarryAdder #(parameter width=4)(
			input [width - 1:0] a,
			input [width - 1:0] b,
			input cin,
			output [width - 1:0] sum,
			output cout
    );
	 
wire [width -1: 0] c;

genvar i;
generate
	for (i = 0; i < width; i = i + 1) begin
		case (i)
			1'b0: FullAdder FA0(.A(a[i]), .B(b[i]),.Cin(cin), .S(sum[i]),.Cout(c[i]));
			default : FullAdder FA1(.A(a[i]), .B(b[i]),.Cin(c[i - 1]), .S(sum[i]),.Cout(c[i]));
		endcase
	end
endgenerate

assign cout = c[width - 1];

endmodule