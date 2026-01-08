// Date: 07/01/2026
// Autor: Alan Gomez
// Module: Full_Subtractor
// --------------------------------------------------

module Full_Subtractor (
    input a, b, Bin,// Inputs
    output D, Bout// Outputs
);

    assign D = a ^ b ^ Bin;
    assign Bout = (!a & b) | (!(a ^ b) & Bin);

endmodule
