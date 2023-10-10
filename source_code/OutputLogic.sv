
module OutputLogic(
		input logic [3:0] A, //current state
		
		output logic Item_out, //signal for item led light
		output logic [3:0] ChangeBit_out
);
		logic [3:0] Case;
		
		assign Case[0] = (~A[3] & A[2] & ~A[1] & A[0]); 	//State 5 -> no change
		assign Case[1] = (~A[3] & A[2] & A[1] & ~A[0]);		//State 6 -> change: 0.25 -> 1 farthing
		assign Case[2] = (~A[3] & A[2] & A[1] & A[0]);		//State 7 -> change: 0.50 -> 2 farthings
		assign Case[3] = (A[3] & ~A[2] & ~A[1] & ~A[0]);	//State 8 -> change: 0.75 -> 3 farthings
		
		assign ChangeBit_out[0] = Case[1] | Case[3];
		assign ChangeBit_out[1] = Case[2] | Case[3];
		assign ChangeBit_out[2] = 1'b0;
		assign ChangeBit_out[3] = 1'b0; 			//always zero
		
		assign Item_out = Case[0] | Case[1] | Case[2] | Case[3];

endmodule