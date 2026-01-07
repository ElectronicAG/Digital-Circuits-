// Full Adder in Verilog
// Combinational circuit
// Date: 01/07/2026

module Full_Adder(
    input a, b, cin, // a - bit 1, b - bit 2, cin - carry input
    output S, Cout // S - output, Cout -  Carry output
);
    assign S = a ^ b ^ cin;
    assign Cout = (a & b) | (b & cin) | (a & cin); 
endmodule
