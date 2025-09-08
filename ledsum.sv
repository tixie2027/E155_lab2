// Tian Xie
// tixie@hmc.edu
// 9/3/2025
// This calculates the sum of s1 and s2. 


module ledsum (
    input logic s1[3:0],
    input logic s2[3:0],
    output logic sum[4:0]);

        assign sum = s1 + s2;

endmodule