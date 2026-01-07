// Testbench for Half Adder
// Date: 12/03/2025

module Half_Adder_tb;

    reg a, b;        // Test inputs
    wire S, Cout;    // Test outputs

    // Instantiate the Half Adder
    Half_Adder U1(
        .a(a),
        .b(b),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        // Set up VCD dump file for waveform viewing
        $dumpfile("waveform.vcd");
        $dumpvars(0, Half_Adder_tb);

        // Monitor changes in signals
        $monitor("At time %0t: a=%b b=%b, sum=%b, carry=%b", $time, a, b, S, Cout);

        // Test all input combinations
        a = 0; b = 0; #1;
        a = 0; b = 1; #1;
        a = 1; b = 0; #1;
        a = 1; b = 1; #1;
    end

endmodule
