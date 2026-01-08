// Date: 07/01/2026
// Autor: Alan Gomez
// Module: Half_Subtractor_tb.v
// --------------------------------------------------

module Half_Subtractor_tb;
    reg a, b;        // Test inputs
    wire D, B;    // Test outputs

    // Instantiate the Half_Subtractor
    Half_Subtractor U1(
        .a(a),
        .b(b),
        .D(D),
        .B(B)
    );

    initial begin
        // Set up VCD dump file for waveform viewing
        $dumpfile("waveform.vcd");
        $dumpvars(0, Half_Subtractor_tb);

        // Monitor changes in signals
        $monitor("At time %0t: a=%b b=%b, Difference=%b, Borrow=%b", $time, a, b, D, B);

        // Test all input combinations
        a = 0; b = 0; #1;
        a = 0; b = 1; #1;
        a = 1; b = 0; #1;
        a = 1; b = 1; #1;
    end

endmodule
