module digitdisplay (input logic [3:0] s1, 
	 input logic [3:0] s2,
	 input logic clk,
     output logic led1, led2,
     output logic [4:0] sum,
     output logic [6:0] seg);
	
	logic toggle = 0;
	logic [24:0] counter = 0;
	logic [3:0] s = s1;
	
	always_ff @(posedge clk) begin
		if (counter == 100000) begin
				toggle <= ~toggle;
				counter <= 0;
		end else begin
			counter <= counter + 1;
		end
	end

	always_comb begin
		s = toggle ? s1: s2;
	end
	
	assign led1 = ~toggle;
	assign led2 = toggle;
	
	// calls 7 segments
	segment7 s7 ( .s   (s), .seg (seg));
	
	always_comb begin
		sum = s1 + s2;
	end
	
	
endmodule



