module top (input logic [3:0] s1,
                  input logic [3:0] s2,
                  input logic led1, led2,
                  output logic [4:0] sum
                  output logic [6:0] seg);

    logic int_osc;
	logic toggle = 0;
	logic [24:0] counter = 0;
	
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

    always_ff @(posedge int_osc)
		begin
            if (counter == 18'd200000) begin
                counter <= 0;
                toggle <= ~toggle;
            end else begin 
			    counter <= counter + 1;
		    end
        end

    if (toggle == 0)
        s = s1;
    else
        s = s2;

    assign led1 = toggle;
    assign led2 = ~toggle;
	
	// calls 7 segments
    segment7 s7 (s, seg);
    ledsum ls (s1, s2, sum);

endmodule

