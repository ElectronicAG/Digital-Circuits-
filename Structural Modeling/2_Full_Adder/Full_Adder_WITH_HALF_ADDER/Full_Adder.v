// Full Adder in Verilog 
// Combinational circuit
// Date: 01/07/2026

module Full_Adder (
    input a, b, cin,
    output S, Cout
);
    wire s, c0, c1;

    Half_Adder U1(.a(a), .b(b), .S(s), .Cout(c0)); // Two input, and two output
    Half_Adder U2(.a(cin), .b(s), .S(S), .Cout(c1)); // 
    assign Cout = c0 | c1; // 
    
endmodule
