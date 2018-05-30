`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:07:29 05/24/2018 
// Design Name: 
// Module Name:    BoothWallaceMult16Bit 
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
module BoothWallaceMult16Bit(
			input [15:0] X,
			input [15:0] Y,
			output [31:0] Out
    );

wire [18:0] mX;

// prepare multiplicant mX
assign mX[0] = 1'b0;
assign mX[16:1] = X[15:0];
assign mX[17] = 1'b0;
assign mX[18] = 1'b0;
//assign test_mX = mX;

wire [2:0] PPC0,PPC1,PPC2,PPC3,PPC4,PPC5,PPC6,PPC7,PPC8;

BoothEncoder BE0(mX[0],mX[1],mX[2],PPC0[0],PPC0[1],PPC0[2]);
BoothEncoder BE1(mX[2],mX[3],mX[4],PPC1[0],PPC1[1],PPC1[2]);
BoothEncoder BE2(mX[4],mX[5],mX[6],PPC2[0],PPC2[1],PPC2[2]);
BoothEncoder BE3(mX[6],mX[7],mX[8],PPC3[0],PPC3[1],PPC3[2]);
BoothEncoder BE4(mX[8],mX[9],mX[10],PPC4[0],PPC4[1],PPC4[2]);
BoothEncoder BE5(mX[10],mX[11],mX[12],PPC5[0],PPC5[1],PPC5[2]);
BoothEncoder BE6(mX[12],mX[13],mX[14],PPC6[0],PPC6[1],PPC6[2]);
BoothEncoder BE7(mX[14],mX[15],mX[16],PPC7[0],PPC7[1],PPC7[2]);
BoothEncoder BE8(mX[16],mX[17],mX[18],PPC8[0],PPC8[1],PPC8[2]);

wire [31:0] PP00;
wire [29:0] PP01;
wire [27:0] PP02;
wire [25:0] PP03;
wire [23:0] PP04;
wire [21:0] PP05;
wire [19:0] PP06;
wire [17:0] PP07;
wire [15:0] PP08;

wire [31:0] PP10;
wire [29:0] PP11;
wire [27:0] PP12;
wire [25:0] PP13;
wire [23:0] PP14;
wire [21:0] PP15;
wire [19:0] PP16;
wire [17:0] PP17;
wire [15:0] PP18;

wire [31:0] nPP10;
wire [31:0] nPP11;
wire [31:0] nPP12;
wire [31:0] nPP13;
wire [31:0] nPP14;
wire [31:0] nPP15;
wire [31:0] nPP16;
wire [31:0] nPP17;
wire [31:0] nPP18;

genvar i;

// partial product level 00
BoothSelector BS0_l0(PPC0[0],PPC0[1],PPC0[2],Y[0],0,PP00[0]);		// first pp bit
generate
	for(i=1;i<16;i=i+1) begin
		BoothSelector BS1_l0(PPC0[0],PPC0[1],PPC0[2],Y[i],Y[i-1],PP00[i]);
	end
	BoothSelector BS2_l0(PPC0[0],PPC0[1],PPC0[2],0,Y[15],PP00[16]);		// last pp bit
endgenerate
wire dump0;
RippleCarryAdder #(17) rca0(PP00[16:0],{16'b0000000000000000,PPC0[2]},1'b0,PP10[16:0],dump0);
// sign bits
for(i=17;i<32;i=i+1) begin
	assign #0.1 PP10[i] = PPC0[2] & (PPC0[0] | PPC0[1]);	
end


// partial product level 01
BoothSelector BS0_l1(PPC1[0],PPC1[1],PPC1[2],Y[0],0,PP01[0]);		// first pp bit
generate
	for(i=1;i<16;i=i+1) begin
		BoothSelector BS1_l1(PPC1[0],PPC1[1],PPC1[2],Y[i],Y[i-1],PP01[i]);
	end
	BoothSelector BS2_l1(PPC1[0],PPC1[1],PPC1[2],0,Y[15],PP01[16]);		// last pp bit
endgenerate
wire dump1;
RippleCarryAdder #(17) rca1(PP01[16:0],{16'b0000000000000000,PPC1[2]},1'b0,PP11[16:0],dump1);
// sign bits
for(i=17;i<30;i=i+1) begin
	assign #0.1 PP11[i] = PPC1[2] & (PPC1[0] | PPC1[1]);
end


// partial product level 02
BoothSelector BS0_l2(PPC2[0],PPC2[1],PPC2[2],Y[0],0,PP02[0]);		// first pp bit
generate
	for(i=1;i<16;i=i+1) begin
		BoothSelector BS1_l2(PPC2[0],PPC2[1],PPC2[2],Y[i],Y[i-1],PP02[i]);
	end
	BoothSelector BS2_l2(PPC2[0],PPC2[1],PPC2[2],0,Y[15],PP02[16]);		// last pp bit
endgenerate
wire dump2;
RippleCarryAdder #(17) rca2(PP02[16:0],{16'b0000000000000000,PPC2[2]},1'b0,PP12[16:0],dump2);
// sign bits
for(i=17;i<28;i=i+1) begin
	assign #0.1 PP12[i] = PPC2[2] & (PPC2[0] | PPC2[1]);	
end


// partial product level 03
BoothSelector BS0_l3(PPC3[0],PPC3[1],PPC3[2],Y[0],0,PP03[0]);		// first pp bit
generate
	for(i=1;i<16;i=i+1) begin
		BoothSelector BS1_l3(PPC3[0],PPC3[1],PPC3[2],Y[i],Y[i-1],PP03[i]);
	end
	BoothSelector BS2_l3(PPC3[0],PPC3[1],PPC3[2],0,Y[15],PP03[16]);		// last pp bit
endgenerate
wire dump3;
RippleCarryAdder #(17) rca3(PP03[16:0],{16'b0000000000000000,PPC3[2]},1'b0,PP13[16:0],dump3);
// sign bits
for(i=17;i<26;i=i+1) begin
	assign #0.1 PP13[i] = PPC3[2] & (PPC3[0] | PPC3[1]);
end


// partial product level 04
BoothSelector BS0_l4(PPC4[0],PPC4[1],PPC4[2],Y[0],0,PP04[0]);		// first pp bit
generate
	for(i=1;i<16;i=i+1) begin
		BoothSelector BS1_l4(PPC4[0],PPC4[1],PPC4[2],Y[i],Y[i-1],PP04[i]);
	end
	BoothSelector BS2_l4(PPC4[0],PPC4[1],PPC4[2],0,Y[15],PP04[16]);		// last pp bit
endgenerate
wire dump4;
RippleCarryAdder #(17) rca4(PP04[16:0],{16'b0000000000000000,PPC4[2]},1'b0,PP14[16:0],dump4);
// sign bits
for(i=17;i<24;i=i+1) begin
	assign #0.1 PP14[i] = PPC4[2] & (PPC4[0] | PPC4[1]);
end


// partial product level 05
BoothSelector BS0_l5(PPC5[0],PPC5[1],PPC5[2],Y[0],0,PP05[0]);		// first pp bit
generate
	for(i=1;i<16;i=i+1) begin
		BoothSelector BS1_l5(PPC5[0],PPC5[1],PPC5[2],Y[i],Y[i-1],PP05[i]);
	end
	BoothSelector BS2_l5(PPC5[0],PPC5[1],PPC5[2],0,Y[15],PP05[16]);		// last pp bit
endgenerate
wire dump5;
RippleCarryAdder #(17) rca5(PP05[16:0],{16'b0000000000000000,PPC5[2]},1'b0,PP15[16:0],dump5);
// sign bits
for(i=17;i<22;i=i+1) begin
	assign #0.1 PP15[i] = PPC5[2] & (PPC5[0] | PPC5[1]);
end


// partial product level 06
BoothSelector BS0_l6(PPC6[0],PPC6[1],PPC6[2],Y[0],0,PP06[0]);		// first pp bit
generate
	for(i=1;i<16;i=i+1) begin
		BoothSelector BS1_l6(PPC6[0],PPC6[1],PPC6[2],Y[i],Y[i-1],PP06[i]);
	end
	BoothSelector BS2_l6(PPC6[0],PPC6[1],PPC6[2],0,Y[15],PP06[16]);		// last pp bit
endgenerate
wire dump6;
RippleCarryAdder #(17) rca6(PP06[16:0],{16'b0000000000000000,PPC6[2]},1'b0,PP16[16:0],dump6);
// sign bits
for(i=17;i<20;i=i+1) begin
	assign #0.1 PP16[i] = PPC6[2] & (PPC6[0] | PPC6[1]);
end


// partial product level 07
BoothSelector BS0_l7(PPC7[0],PPC7[1],PPC7[2],Y[0],0,PP07[0]);		// first pp bit
generate
	for(i=1;i<16;i=i+1) begin
		BoothSelector BS1_l7(PPC7[0],PPC7[1],PPC7[2],Y[i],Y[i-1],PP07[i]);
	end
	BoothSelector BS2_l7(PPC7[0],PPC7[1],PPC7[2],0,Y[15],PP07[16]);		// last pp bit
endgenerate
wire dump7;
RippleCarryAdder #(17) rca7(PP07[16:0],{16'b0000000000000000,PPC7[2]},1'b0,PP17[16:0],dump7);
// sign bits
for(i=17;i<18;i=i+1) begin
	assign #0.1 PP17[i] = PPC7[2] & (PPC7[0] | PPC7[1]);
end


// partial product level 08
BoothSelector BS0_l8(PPC8[0],PPC8[1],PPC8[2],Y[0],0,PP08[0]);		// first pp bit
generate
	for(i=1;i<16;i=i+1) begin
		BoothSelector BS1_l8(PPC8[0],PPC8[1],PPC8[2],Y[i],Y[i-1],PP08[i]);
	end
endgenerate
wire dump8;
RippleCarryAdder #(16) rca8(PP08[15:0],{15'b000000000000000,PPC8[2]},1'b0,PP18[15:0],dump8);


assign nPP10 = PP10;
assign nPP11 = {PP11[29:0],1'b0,1'b0};
assign nPP12 = {PP12[27:0],1'b0,1'b0,1'b0,1'b0};
assign nPP13 = {PP13[25:0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
assign nPP14 = {PP14[23:0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
assign nPP15 = {PP15[21:0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
assign nPP16 = {PP16[19:0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
assign nPP17 = {PP17[17:0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
assign nPP18 = {PP18[15:0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};



// Wallace tree
wire [32:0] WT00;
wire [32:0] WT01;
wire [32:0] WT02;
wire [32:0] WT03;
wire [32:0] WT04;
wire [32:0] WT05;
wire [32:0] WT10;
wire [32:0] WT11;
wire [32:0] WT12;
wire [32:0] WT13;
wire [32:0] WT20;
wire [32:0] WT21;
wire [32:0] WT22;
wire [32:0] WT30;
wire [32:0] WT31;

// Wallace 00
assign WT00[0] = nPP10[0];
assign WT00[1] = nPP10[1];
HalfAdder HAWT00_0(nPP10[2],nPP11[2],WT00[2],WT01[3]);
HalfAdder HAWT00_1(nPP10[3],nPP11[3],WT00[3],WT01[4]);
generate
	for(i=4;i<32;i=i+1) begin
		FullAdder FAWT00_1(nPP10[i],nPP11[i],nPP12[i],WT00[i],WT01[i+1]);
	end
endgenerate

// Wallace 02
assign WT02[6] = nPP13[6];
assign WT02[7] = nPP13[7];
HalfAdder HAWT02_0(nPP13[8],nPP14[8],WT02[8],WT03[9]);
HalfAdder HAWT02_1(nPP13[9],nPP14[9],WT02[9],WT03[10]);
generate
	for(i=10;i<32;i=i+1) begin
		FullAdder FAWT02_0(nPP13[i],nPP14[i],nPP15[i],WT02[i],WT03[i+1]);
	end
endgenerate

// Wallace 04
assign WT04[12] = nPP16[12];
assign WT04[13] = nPP16[13];
HalfAdder HAWT04_0(nPP16[14],nPP17[14],WT04[14],WT05[15]);
HalfAdder HAWT04_1(nPP16[15],nPP17[15],WT04[15],WT05[16]);
generate
	for(i=16;i<32;i=i+1) begin
		FullAdder FAWT04_0(nPP16[i],nPP17[i],nPP18[i],WT04[i],WT05[i+1]);
	end
endgenerate

// Wallace 10
assign WT10[0] = WT00[0];
assign WT10[1] = WT00[1];
assign WT10[2] = WT00[2];
HalfAdder HAWT10_0(WT00[3],WT01[3],WT10[3],WT11[4]);
HalfAdder HAWT10_1(WT00[4],WT01[4],WT10[4],WT11[5]);
HalfAdder HAWT10_2(WT00[5],WT01[5],WT10[5],WT11[6]);
generate
	for(i=6;i<32;i=i+1) begin
		FullAdder FAWT10_0(WT00[i],WT01[i],WT02[i],WT10[i],WT11[i+1]);
	end
endgenerate

// Wallace 12
assign WT12[9] = WT03[9];
assign WT12[10] = WT03[10];
assign WT12[11] = WT03[11];
HalfAdder HAWT12_0(WT03[12],WT04[12],WT12[12],WT13[13]);
HalfAdder HAWT12_1(WT03[13],WT04[13],WT12[13],WT13[14]);
HalfAdder HAWT12_2(WT03[14],WT04[14],WT12[14],WT13[15]);
generate
	for(i=15;i<32;i=i+1) begin
		FullAdder FAWT12_0(WT03[i],WT04[i],WT05[i],WT12[i],WT13[i+1]);
	end
endgenerate

// Wallace 20
assign WT20[0] = WT10[0];
assign WT20[1] = WT10[1];
assign WT20[2] = WT10[2];
assign WT20[3] = WT10[3];
HalfAdder HAWT20_0(WT10[4],WT11[4],WT20[4],WT21[5]);
HalfAdder HAWT20_1(WT10[5],WT11[5],WT20[5],WT21[6]);
HalfAdder HAWT20_2(WT10[6],WT11[6],WT20[6],WT21[7]);
HalfAdder HAWT20_3(WT10[7],WT11[7],WT20[7],WT21[8]);
HalfAdder HAWT20_4(WT10[8],WT11[8],WT20[8],WT21[9]);
generate
	for(i=9;i<32;i=i+1) begin
		FullAdder FAWT20_0(WT10[i],WT11[i],WT12[i],WT20[i],WT21[i+1]);
	end
endgenerate

// Wallace 22
assign WT22 = WT13;


// Walalce 30
assign WT30[0] = WT20[0];
assign WT30[1] = WT20[1];
assign WT30[2] = WT20[2];
assign WT30[3] = WT20[3];
assign WT30[4] = WT20[4];
HalfAdder HAWT30_0(WT20[5],WT21[5],WT30[5],WT31[6]);
HalfAdder HAWT30_1(WT20[6],WT21[6],WT30[6],WT31[7]);
HalfAdder HAWT30_2(WT20[7],WT21[7],WT30[7],WT31[8]);
HalfAdder HAWT30_3(WT20[8],WT21[8],WT30[8],WT31[9]);
HalfAdder HAWT30_4(WT20[9],WT21[9],WT30[9],WT31[10]);
HalfAdder HAWT30_5(WT20[10],WT21[10],WT30[10],WT31[11]);
HalfAdder HAWT30_6(WT20[11],WT21[11],WT30[11],WT31[12]);
HalfAdder HAWT30_7(WT20[12],WT21[12],WT30[12],WT31[13]);
generate
	for(i=13;i<32;i=i+1) begin
		FullAdder FAWT30_0(WT20[i],WT21[i],WT22[i],WT30[i],WT31[i+1]);
	end
endgenerate

wire dummyF;
// final stage
RippleCarryAdder #(32) rpaF(WT30[31:0],{WT31[31:6],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},1'b0,Out[31:0],dummyF);



endmodule
