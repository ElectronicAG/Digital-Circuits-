// Full Adder in Verilog 
// Combinational circuit
// Date: 01/07/2026

module Half_Adder(
    input  a,     // Input A (1 bit)
    input  b,     // Input B (1 bit)
    output S,     // Sum output (A + B, 1 bit)
    output Cout   // Carry output (1 bit)
);
    assign S    = a ^ b; // XOR gate for sum
    assign Cout = a & b; // AND gate for carry

endmodule

module Full_Adder (
    input a, b, cin,
    output S, Cout
);
    wire s, c0, c1;

    Half_Adder U1(.a(a), .b(b), .S(s), .Cout(c0)); // Two input, and two output
    Half_Adder U2(.a(cin), .b(s), .S(S), .Cout(c1)); // 
    assign Cout = c0 | c1; // 
    
endmodule
