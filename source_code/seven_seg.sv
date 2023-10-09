
module seven_seg(input logic [3:0] a,
	output logic [6:0] out_sig);
	
	logic [15:0] y;
	
	logic in_enable;
	assign in_enable = 1'b1;
	
	//Decoder -> change output combinations to cases
	assign y[0] = (~a[3] * ~a[2] * ~a[1] * ~a[0]) ;
	assign y[1] = (~a[3] * ~a[2] * ~a[1] * a[0]) ;
	assign y[2] = (~a[3] * ~a[2] * a[1] * ~a[0]) ;
	assign y[3] = (~a[3] * ~a[2] * a[1] * a[0]) ;
	assign y[4] = (~a[3] * a[2] * ~a[1] * ~a[0]) ;
	assign y[5] = (~a[3] * a[2] * ~a[1] * a[0]) ;
	assign y[6] = (~a[3] * a[2] * a[1] * ~a[0]) ;
	assign y[7] = (~a[3] * a[2] * a[1] * a[0]) ;
	assign y[8] = (a[3] * ~a[2] * ~a[1] * ~a[0]) ;
	/*assign y[9] = (a[3] * ~a[2] * ~a[1] * a[0]) ;
	assign y[10] = (a[3] * ~a[2] * a[1] * ~a[0]) ;
	assign y[11] = (a[3] * ~a[2] * a[1] * a[0]) ;
	assign y[12] = (a[3] * a[2] * ~a[1] * ~a[0]) ;
	assign y[13] = (a[3] * a[2] * ~a[1] * a[0]) ;
	assign y[14] = (a[3] * a[2] * a[1] * ~a[0]) ;
	assign y[15] = (a[3] * a[2] * a[1] * a[0]) ;*/
	
	/*
	assign out_sig[0] = (y[0] | y[2] | y[3] | y[5] | y[6] | y[7] | y[8] | y[9] | y[10] | y[12] | y[14] | y[15]) 	* in_enable;
	assign out_sig[1] = (y[0] | y[1] | y[2] | y[3] | y[4] | y[7] | y[8] | y[9] | y[10] | y[13]) 							* in_enable;
	assign out_sig[2] = (y[0] | y[1] | y[3] | y[4] | y[5] | y[6] | y[7] | y[8] | y[9] | y[10] | y[11] | y[13]) 		* in_enable;
	assign out_sig[3] = (y[0] | y[2] | y[3] | y[5] | y[6] | y[8] | y[9] | y[11] | y[12] | y[13] | y[14]) 				* in_enable;
	assign out_sig[4] = (y[0] | y[2] | y[6] | y[8] | y[10] | y[11] | y[12] | y[13] | y[14] | y[15]) 						* in_enable;
	assign out_sig[5] = (y[0] | y[4] | y[5] | y[6] | y[8] | y[9] | y[10] | y[11] | y[12] | y[14] | y[15]) 				* in_enable;
	assign out_sig[6] = (y[2] | y[3] | y[4] | y[5] | y[6] | y[8] | y[9] | y[10] | y[11] | y[13] | y[14] | y[15]) 	* in_enable;
	*/
	
	assign out_sig[0] = (y[1] | y[4] | y[11] | y[13]) 							* in_enable;
	assign out_sig[1] = (y[5] | y[6] | y[11] | y[12] | y[14] | y[15]) 	* in_enable;
	assign out_sig[2] = (y[2] | y[12] | y[14] | y[15]) 						* in_enable;
	assign out_sig[3] = (y[1] | y[4] | y[7] | y[10] | y[15]) 				* in_enable;
	assign out_sig[4] = (y[1] | y[3] | y[4] | y[5] | y[7] | y[9]) 			* in_enable;
	assign out_sig[5] = (y[1] | y[2] | y[3] | y[7] | y[13]) 					* in_enable;
	assign out_sig[6] = (y[0] | y[1] | y[7] | y[12]) 							* in_enable;

endmodule