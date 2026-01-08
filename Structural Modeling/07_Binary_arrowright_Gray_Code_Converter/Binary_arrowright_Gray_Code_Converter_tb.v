// Date: 07/01/2026
// Autor: Alan Gomez
// Module: Binary_arrowright_Gray_Code_Converter_tb.v
// --------------------------------------------------

module Binary_arrowright_Gray_Code_Converter_tb;
    reg a, b;        // Test inputs
    wire S, Cout;    // Test outputs

    // Instantiate the Binary_arrowright_Gray_Code_Converter
    Binary_arrowright_Gray_Code_Converter U1(
        .a(a),
        .b(b),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        // Set up VCD dump file for waveform viewing
        $dumpfile("waveform.vcd");
        $dumpvars(0, Binary_arrowright_Gray_Code_Converter_tb);

        // Monitor changes in signals
        $monitor("At time %0t: a=%b b=%b, sum=%b, carry=%b", $time, a, b, S, Cout);

        // Test all input combinations
        a = 0; b = 0; 
        #40 ; // Finish Simulation
    end
    always #10 a = ~a; // Square wave with period 20
    always #5 b = ~b; // Square wave with period 10

endmodule
