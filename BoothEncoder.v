`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:05:20 05/24/2018 
// Design Name: 
// Module Name:    BoothEncoder 
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
module BoothEncoder(
			input _2iM1,
			input _2i,
			input _2iP1,
			output SINGLEi,
			output DOUBLEi,
			output NEGi
    );

wire not2iP1, not2iM1, not2i;
wire net0,net1;

not #0.01 (not2iP1,_2iP1);
not #0.01 (not2iM1,_2iM1);
not #0.01 (not2i,_2i);
assign #0.1 net0 = not2iP1 & _2iM1 & _2i;
assign #0.1 net1 = _2iP1 & not2iM1 & not2i;
or #0.1 (DOUBLEi,net0,net1);
assign NEGi = _2iP1;
xor #0.1 (SINGLEi,_2i,_2iM1);

endmodule
