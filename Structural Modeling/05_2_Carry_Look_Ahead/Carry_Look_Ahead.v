// Carry_Look_Ahead_Adder
// de 8bits.
// by Alan Gomez

module FullAdder(
    input A,// Entrada A
    input B,// Entrada B
    input Cin,// Carry de entrada
    output S// Resultado de suma
    //output Pi,
    //output Gi
);
wire w;
// Conexiones
assign w = A ^ B;
assign S = w ^ Cin;// Resultado final
//assign Pi = A | B;
//assign Gi = A & B;
// No hay Cout ya que vamos a predecir el carry
endmodule

module CLA(
    input [7:0] A, // Entrada A de 8bits
    input [7:0] B, // Entrada B de 8bits
    output [31:0] S // Salida de 2 bits
);
wire [7:0] P;// Se propagó un carry?
wire [7:0] G;// Se generó un carry?
wire [8:0] C;// Carry de 9 bits el bit 8 de la salida será el último carry.

assign P = A | B;// Se conecta salida P de 8bits
assign G = A & B;// Se conecta salida G de 8bits

// Se calculan el carry de 9bits menos el C0 que es 0. Por carry inicial.
assign C[1] = G[0] | P[0] & 1'b0;
assign C[2] = G[1] | P[1] & G[0] | P[1] & P[0] & 1'b0;
assign C[3] = G[2] | P[2] & G[1] | P[2] & P[1] & G[0] | P[2] & P[1] & P[0] & 1'b0;
assign C[4] = G[3] | P[3] & G[2] | P[3] & P[2] & G[1] | P[3] & P[2] & P[1] & G[0] | P[3] & P[2] & P[1] & P[0] & 1'b0;
assign C[5] = G[4] | P[4] & G[3] | P[4] & P[3] & G[2] | P[4] & P[3] & P[2] & G[1] | P[4] & P[3] & P[2] & P[1] & G[0] | P[4] & P[3] & P[2] & P[1] & P[0] & 1'b0;
assign C[6] = G[5] | P[5] & G[4] | P[5] & P[4] & G[3] | P[5] & P[4] & P[3] & G[2] | P[5] & P[4] & P[3] & P[2] & G[1] | P[5] & P[4] & P[3] & P[2] & P[1] & G[0] | P[5] & P[4] & P[3] & P[2] & P[1] & P[0] & 1'b0;
assign C[7] = G[6] | P[6] & G[5] | P[6] & P[5] & G[4] | P[6] & P[5] & P[4] & G[3] | P[6] & P[5] & P[4] & P[3] & G[2] | P[6] & P[5] & P[4] & P[3] & P[2] & G[1] | P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & G[0] | P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & P[0] & 1'b0;
assign C[8] = G[7] | P[7] & G[6] | P[7] & P[6] & G[5] | P[7] & P[6] & P[5] & G[4] | P[7] & P[6] & P[5] & P[4] & G[3] | P[7] & P[6] & P[5] & P[4] & P[3] & G[2] | P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & G[1] | P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & G[0] | P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & P[0] & 1'b0;
// Conexiones para de 8 Full adder de un bit para de uno de 8 bits
FullAdder FA1(.A(A[0]), .B(B[0]), .Cin(1'b0), .S(S[0]));
FullAdder FA2(.A(A[1]), .B(B[1]), .Cin(C[1]), .S(S[1]));
FullAdder FA3(.A(A[2]), .B(B[2]), .Cin(C[2]), .S(S[2]));
FullAdder FA4(.A(A[3]), .B(B[3]), .Cin(C[3]), .S(S[3]));
FullAdder FA5(.A(A[4]), .B(B[4]), .Cin(C[4]), .S(S[4]));
FullAdder FA6(.A(A[5]), .B(B[5]), .Cin(C[5]), .S(S[5]));
FullAdder FA7(.A(A[6]), .B(B[6]), .Cin(C[6]), .S(S[6]));
FullAdder FA8(.A(A[7]), .B(B[7]), .Cin(C[7]), .S(S[7]));

assign S[8] = C[8]; // El noveno bit de S es el carry del sumador de 8bits

assign S[31:9] = 23'b0;// el resto de bits del resultado son 0

endmodule

// REF 
//[1] “Ripple Carry Adder - COMPUTER SCIENCE BYTES,” COMPUTER SCIENCE BYTES, Jul. 12, 2017.
//     https://www.computersciencebytes.com/boolean-logic/ripple-carry-adder/ (accessed Sep. 01, 2025).
//[2] admin, “Carry Look Ahead Adder Verilog Code | 16 bit Carry Look Ahead Adder Verilog Implementation,” 
//    VLSI GYAN, Sep. 2017. https://vlsigyan.com/16-bit-carry-look-ahead-adder-verilog/ (accessed Sep. 01, 2025).
‌
