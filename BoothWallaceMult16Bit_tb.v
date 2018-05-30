`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:14:51 05/24/2018
// Design Name:   BoothWallaceMult16Bit
// Module Name:   /home/ise/BoothWallaceMult16Bit_2017701177/BoothWallaceMult16Bit_tb.v
// Project Name:  BoothWallaceMult16Bit_2017701177
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BoothWallaceMult16Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BoothWallaceMult16Bit_tb;

	// Inputs
	reg [15:0] X;
	reg [15:0] Y;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	BoothWallaceMult16Bit uut (
		.X(X), 
		.Y(Y), 
		.Out(Out)
	);

	initial begin
		// Initialize Inputs
		X = 0;
		Y = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		assign X = 16'b0000100101001011;
		assign Y = 16'b0000000101101011;

	end
      
endmodule

