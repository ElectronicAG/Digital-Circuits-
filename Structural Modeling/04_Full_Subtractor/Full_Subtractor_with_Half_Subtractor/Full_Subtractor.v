// Date: 07/01/2026
// Autor: Alan Gomez
// Module: Full_Subtractor
// --------------------------------------------------

module Half_Subtractor (
    input a, b,// Inputs
    output D, B// Outputs
);

    assign D = a ^ b;
    assign B = !a & b;

endmodule


module Full_Subtractor (
    // Inputs
    // Outputs
);

endmodule
