`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:06:12 05/24/2018 
// Design Name: 
// Module Name:    BoothSelector 
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
module BoothSelector(
			input SINGLEi,
			input DOUBLEi,
			input NEGi,
			input Y,
			input SHIFTY,
			output PPi
    );

wire net0,net1,net2;

and #0.1 (net0,SINGLEi,Y);
and #0.1 (net1,DOUBLEi,SHIFTY);
or #0.1 (net2,net0,net1);
xor #0.1(PPi,NEGi,net2);

endmodule