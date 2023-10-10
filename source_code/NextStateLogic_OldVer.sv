//Old version
module NextStateLogic(
		input logic [3:0] S,
		input logic [1:0] A,
		
		output logic [3:0] Out
);
	
	logic [8:0] S_next;
	
	//Get next state
	assign S_next[0] = ~S[3] & ~S[2] & ~S[1] & ~S[0] & ~A[1] & ~A[0] | ~S[3] & S[2] & ~S[1] & S[0] & ~A[1] & ~A[0];
	
	assign S_next[1] = ~S[3] & ~S[2] & ~S[1] & ~S[0] & ~A[1] & A[0] | ~S[3] & ~S[2] & ~S[1] & S[0] & ~A[1] & ~A[0] | ~S[3] & S[2] & S[1] & ~S[0] & ~A[1] & ~A[0];
	
	assign S_next[2] = ~S[3] & ~S[2] & ~S[1] & ~S[0] & A[1] & ~A[0] | ~S[3] & ~S[2] & ~S[1] & S[0] & ~A[1] & A[0] 
							| ~S[3] & ~S[2] & S[1] & ~S[0] & ~A[1] & ~A[0] | ~S[3] & S[2] & S[1] & S[0] & ~A[1] & ~A[0];
							
	assign S_next[3] = ~S[3] & ~S[2] & ~S[1] & S[0] & A[1] & ~A[0] | ~S[3] & ~S[2] & S[1] & S[0] & ~A[1] & ~A[0]
							| ~S[3] & ~S[2] & S[1] & ~S[0] & ~A[1] & A[0] | S[3] & ~S[2] & ~S[1] & ~S[0] & ~A[1] & ~A[0];
							
	assign S_next[4] = ~S[3] & ~S[2] & ~S[1] & ~S[0] & A[1] & A[0] | ~S[3] & ~S[2] & S[1] & S[0] & ~A[1] & A[0]
							| ~S[3] & ~S[2] & S[1] & ~S[0] & A[1] & ~A[0] | ~S[3] & S[2] & ~S[1] & ~S[0] & ~A[1] & ~A[0];
							
	assign S_next[5] = ~S[3] & ~S[2] & ~S[1] & S[0] & A[1] & A[0] | ~S[3] & ~S[2] & S[1] & S[0] & A[1] & ~A[0] 
							| ~S[3] & S[2] & ~S[1] & ~S[0] & ~A[1] & A[0];
	
	assign S_next[6] = ~S[3] & ~S[2] & S[1] & ~S[0] & A[1] & A[0] | ~S[3] & S[2] & ~S[1] & ~S[0] & A[1] & ~A[0];
	
	assign S_next[7] = (~S[3] & ~S[2] & S[1] & S[0]) & (A[1] & A[0]);
	
	assign S_next[8] = (~S[3] & S[2] & ~S[1] & ~S[0]) & (A[1] & A[0]);
	
	
	//Send the bits out based on state
	assign Out[0] = S_next[1] | S_next[3] | S_next[5] | S_next[7];
	assign Out[1] = S_next[2] | S_next[3] | S_next[6] | S_next[7];
	assign Out[2] = S_next[4] | S_next[5] | S_next[6] | S_next[7];
	assign Out[3] = S_next[8];
	
endmodule