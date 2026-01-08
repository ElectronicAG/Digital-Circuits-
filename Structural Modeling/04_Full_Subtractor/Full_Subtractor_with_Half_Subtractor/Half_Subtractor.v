// Date: 07/01/2026
// Autor: Alan Gomez
// Module: Half_Subtractor
// --------------------------------------------------

module Half_Subtractor (
    input a, b,// Inputs
    output D, B// Outputs
);

    assign D = a ^ b;
    assign B = !a & b;

endmodule
