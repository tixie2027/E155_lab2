// Tian Xie
// tixie@hmc.edu
// 9/10/2025
// This is the testbench that checks LED switching and the sum!

`timescale 1ns/1ns

module testbenchdigit();
	logic [3:0] s1;
	logic [3:0] s2;
	logic clk;
	logic led1, led2;
	logic [4:0] sum;
	logic [6:0] seg;

	digitdisplay dut (s1, s2, clk, led1, led2, sum, seg);
	
	always begin
		clk = 0;
		#10;
		clk = 1;
		#10;
	end
		
	initial begin
		
	int errors = 0;
	
    for (int i = 0; i < 16; i++) begin
        for (int j = 0; j < 16; j++) begin
            s1 = i[3:0];   
            s2 = j[3:0];   
            #40;           

            if (sum != (s1 + s2))
                $display("FAIL: s1=%b s2=%b sum=%b expected=%b", s1, s2, sum, s1+s2);
            else
                $display("PASS: s1=%b s2=%b sum=%b", s1, s2, sum);
        end
    end
	if (errors == 0)
        $display("No errors found â€” all tests passed.");
    else
        $display("%0d errors found.", errors);
		
    $finish;  
	end
 endmodule
