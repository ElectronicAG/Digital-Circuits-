// Date: 07/01/2026
// Autor: Alan Gomez
// Module: Ripple_Carry_Adder_tb.v
// --------------------------------------------------

module CLA_tb;

    // Entradas
    reg [7:0] A;
    reg [7:0] B;

    // Salidas
    wire [31:0] SUM;

    // Variables de tiempo
    time start, finish;

    // Instancia del DUT (Device Under Test)
    CLA uut (
        .A(A),
        .B(B),
        .S(SUM)
    );

    initial begin
        // Generar archivo de ondas para GTKWave (opcional)
        $dumpfile("waveform.vcd");
        $dumpvars(0, CLA_tb);

        // Caso 1
        A = 0; B = 0;
        start = $time;
        #1; // esperar que la salida se estabilice
        finish = $time;
        $display("Time=%0t | A=%b (%0d), B=%b (%0d) -> SUM=%b (%0d), Cout=%b",
                 finish, A, A, B, B, SUM, SUM, SUM[8]);
        // Caso 2
        A = 1; B = 1;
        start = $time;
        #1;
        finish = $time;
        $display("Time=%0t | A=%b (%0d), B=%b (%0d) -> SUM=%b (%0d), Cout=%b",
                 finish, A, A, B, B, SUM, SUM, SUM[8]);
        // Caso 3
        A = 255; B = 1;
        start = $time;
        #1;
        finish = $time;
        $display("Time=%0t | A=%b (%0d), B=%b (%0d) -> SUM=%b (%0d), Cout=%b",
                 finish, A, A, B, B, SUM, SUM, SUM[8]);
        // Caso 4
        A = 10; B = 5;
        start = $time;
        #1;
        finish = $time;
        $display("Time=%0t | A=%b (%0d), B=%b (%0d) -> SUM=%b (%0d), Cout=%b",
                 finish, A, A, B, B, SUM, SUM, SUM[8]);
        // Caso 5
        A = 127; B = 1;
        start = $time;
        #1;
        finish = $time;
        $display("Time=%0t | A=%b (%0d), B=%b (%0d) -> SUM=%b (%0d), Cout=%b",
                 finish, A, A, B, B, SUM, SUM, SUM[8]);
        // Caso 6
        A = 240; B = 15;
        start = $time;
        #1;
        finish = $time;
        $display("Time=%0t | A=%b (%0d), B=%b (%0d) -> SUM=%b (%0d), Cout=%b",
                 finish, A, A, B, B, SUM, SUM, SUM[8]);
        // Caso 7
        A = 5; B = 3;
        start = $time;
        #1;
        finish = $time;
        $display("Time=%0t | A=%b (%0d), B=%b (%0d) -> SUM=%b (%0d), Cout=%b",
                 finish, A, A, B, B, SUM, SUM, SUM[8]);
        // Caso 8
        A = 170; B = 85;
        start = $time;
        #1;
        finish = $time;
        $display("Time=%0t | A=%b (%0d), B=%b (%0d) -> SUM=%b (%0d), Cout=%b",
                 finish, A, A, B, B, SUM, SUM, SUM[8]);
        // Caso 9
        A = 0; B = 85;
        start = $time;
        #1;
        finish = $time;
        $display("Time=%0t | A=%b (%0d), B=%b (%0d) -> SUM=%b (%0d), Cout=%b",
                 finish, A, A, B, B, SUM, SUM, SUM[8]);
        // Caso 10
        A = 255; B = 255;
        start = $time;
        #1;
        finish = $time;
        $display("Time=%0t | A=%b (%0d), B=%b (%0d) -> SUM=%b (%0d), Cout=%b",
                 finish, A, A, B, B, SUM, SUM, SUM[8]);
        // Finalizar simulación
        #10 $finish;
    end

endmodule
