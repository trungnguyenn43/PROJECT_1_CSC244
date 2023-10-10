
module Project1_CSC244(

	input logic CLK, CLK50MHZ, RES, 	//input for clock, on-board clock, reset
	input logic Pen, HFa, Fa,			// input for pennies, farthings and half-farthings
	
	output logic Item,  //output for Item
	output logic [6:0] Change1, //output for change 7segment displays
	output logic [6:0] Change2, 
	output logic [6:0] Change3, 
	output logic DOT,	//output for 7segments*3 for change
	output logic [6:0] out_CrrState, out_CrrChange,	//output for 7segments for current state
	output [3:0] outBits	//output for pennies, farthings, half-farthings
	
);

	logic CLK_DBounced, RES_DBounced;
	
	debouncer(.A(CLK_DBounced), .A_noisy(CLK), .CLK50M(CLK50MHZ)); //debounce the noisy CLK signal
	
	debouncer(.A(RES_DBounced), .A_noisy(RES), .CLK50M(CLK50MHZ)); //debounce the noisy RES signal
	
	//SIGNALS THROUGH ENCODER
	logic [1:0] A; // encoder output for pen, fa, hfa
	Encoder3_2 encoder3_2( .A(A), .P(Pen), .H(HFa), .F(Fa)); 
	
	//DETERMINE NEXT STATE
	logic [3:0] next_St;
	logic [3:0] crr_St;
	NextStateLogic(.Out(next_St), .S(crr_St), .A(A));
	
	//D-ffs (register)
	D_FF_neg(.Q(crr_St[0]), .D(next_St[0]), .CLKb(CLK_DBounced), .RSTb(RES_DBounced));
	D_FF_neg(.Q(crr_St[1]), .D(next_St[1]), .CLKb(CLK_DBounced), .RSTb(RES_DBounced));
	D_FF_neg(.Q(crr_St[2]), .D(next_St[2]), .CLKb(CLK_DBounced), .RSTb(RES_DBounced));
	D_FF_neg(.Q(crr_St[3]), .D(next_St[3]), .CLKb(CLK_DBounced), .RSTb(RES_DBounced));
	
	//Output
	seven_seg state(.out_sig(out_CrrState), .a(crr_St)); //Output state in farthing
	StateBits(.O(outBits), .I(crr_St)); //Bits led light indicators
	
	logic [3:0] changeBits1;
	logic [3:0] changeBits2;
	logic [3:0] changeBits3;
	logic dotbit; //the dot for first segment
	
	decoder4_16(.SG1(changeBits1), .SG2(changeBits2), .SG3(changeBits3), .dot(dotbit), .A(crr_St)); //Decoder and logic for change in dollar
	seven_seg Change1_Seg(.out_sig(Change1), .a(changeBits1), .dot_out(DOT), .dot(dotbit)); //Display 1
	seven_seg Change2_Seg(.out_sig(Change2), .a(changeBits2)); //Display 2
	seven_seg Change3_Seg(.out_sig(Change3), .a(changeBits3)); //Display 3
	
	logic [3:0] Fa_change;
	OutputLogic (.Item_out(Item), .ChangeBit_out(Fa_change), .A(crr_St));
	seven_seg Fa_Change_Segment(.out_sig(out_CrrChange), .a(Fa_change)); //Output change in farthing
	
endmodule


