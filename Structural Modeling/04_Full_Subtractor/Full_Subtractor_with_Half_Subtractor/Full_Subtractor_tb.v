// Date: 07/01/2026
// Autor: Alan Gomez
// Module: Full_Subtractor_tb.v
// --------------------------------------------------

module Full_Subtractor_tb;
    reg a, b, Bin;        // Test inputs
    wire D, Bout;    // Test outputs

    // Instantiate the Full_Subtractor
    Full_Subtractor U1(
        .a(a),
        .b(b),
        .Bin(Bin),
        .D(D),
        .Bout(Bout)
    );

    initial begin
        // Set up VCD dump file for waveform viewing
        $dumpfile("waveform.vcd");
        $dumpvars(0, Full_Subtractor_tb);

        // Monitor changes in signals
        $monitor("At time %0t: a=%b b=%b, Bin=%b, Difference=%b, Borrow_out=%b", $time, a, b, Bin, D, Bout);

        // Test all input combinations
        a = 0;
        b = 0;
        Bin = 0;
        #40 $finish; // Finish Simulation
    end
    always #20 a = ~a; // Square wave with period 40
    always #10 b = ~b; // Square wave with period 20
    always #5 Bin = ~Bin; // Square wave with period 10

endmodule
