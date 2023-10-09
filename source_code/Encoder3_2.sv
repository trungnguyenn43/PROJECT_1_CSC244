
module Encoder3_2(
		input logic P, H, F,
		output logic [1:0] A
);
	
	assign A[0] = ~P*~H*F | P*~H*~F;
	assign A[1] = ~P*H*~F | P*~H*~F;
	
endmodule