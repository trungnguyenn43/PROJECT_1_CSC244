
module decoder4_16(
		input logic [3:0] A,
		output logic [3:0] SG1, 
		output logic [3:0] SG2, 
		output logic [3:0] SG3, 
		output logic dot
);

		logic [3:0] Case;
		
		assign Case[0] = (~A[3] & A[2] & ~A[1] & A[0]); //State 5
		assign Case[1] = (~A[3] & A[2] & A[1] & ~A[0]);	//State 6
		assign Case[2] = (~A[3] & A[2] & A[1] & A[0]);	//State 7
		assign Case[3] = (A[3] & ~A[2] & ~A[1] & ~A[0]);	//State 8
		
		//SG1 is always zero
		assign SG1[0] = 1'b0;
		assign SG1[1] = 1'b0;
		assign SG1[2] = 1'b0; //There is no case higher than 0.75 so SG1 stays at 0
		assign SG1[3] = 1'b0;
		assign dot = 1'b0; //The dot
		
		//SG2 - based on bits
		assign SG2[0] = Case[2] | Case[2] | Case[3];
		assign SG2[1] = Case[1] | Case[3];
		assign SG2[2] = Case[2] | Case[2] | Case[3];
		assign SG2[3] = 1'b0;
		
		//SG3
		assign SG3[0] = Case[1] | Case[3];
		assign SG3[1] = 1'b0;
		assign SG3[2] = Case[1] |  Case[3];
		assign SG3[3] = 1'b0;
		
		

endmodule