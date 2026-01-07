// Full Adder testbench in Verilog 
// Combinational circuit
// Date: 01/07/2026
module Full_Adder_tb;
reg a, b, cin;
wire S, Cout;

// interconnection modules.

Full_Adder U1(
    .a(a),
    .b(b),
    .cin(cin),
    .S(S),
    .Cout(Cout)
);

initial begin
   // Set up VCD dump file for waveform viewing
    $dumpfile("waveform.vcd");
    $dumpvars(0, Full_Adder_tb); 
    // Monitor changes in signals
    $monitor("At time %0t: | a=%b. b=%b. cin=%b. | S=%b. Cout=%b.", $time, a, b, cin, S, Cout);
    // Test all input combinations
    a = 0; b = 0; cin = 0; #1;
    a = 0; b = 0; cin = 1; #1;
    a = 0; b = 1; cin = 0; #1;
    a = 0; b = 1; cin = 1; #1;
    a = 1; b = 0; cin = 0; #1;
    a = 1; b = 0; cin = 1; #1;
    a = 1; b = 1; cin = 0; #1;
    a = 1; b = 1; cin = 1; #1;
end
    
endmodule