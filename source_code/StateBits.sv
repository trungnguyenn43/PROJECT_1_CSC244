
module StateBits(
	input logic [3:0] I,
	output logic [3:0]O
);
	
	assign O[0] = I[0];
	assign O[1] = I[1];
	assign O[2] = I[2];
	assign O[3] = I[3];

endmodule