module top (input logic [3:0] s1,
                  input logic [3:0] s2,
                  output logic led1, led2,
                  output logic [4:0] sum,
                  output logic [6:0] seg);
				  
	logic int_osc;
	
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	digitdisplay display (s1, s2, int_osc, led1, led2, sum, seg);

endmodule

