// Half Adder in Verilog (Behavioral Modeling)
// Combinational circuit
// Date: 12/03/2025

module Half_Adder(
    input  a,     // Input A (1 bit)
    input  b,     // Input B (1 bit)
    output S,     // Sum output (A + B, 1 bit)
    output Cout   // Carry output (1 bit)
);
    assign S    = a ^ b; // XOR gate for sum
    assign Cout = a & b; // AND gate for carry

endmodule
