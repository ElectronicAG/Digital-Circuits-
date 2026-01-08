#!/bin/bash
#Alan Gomez
#07/01/2026

# Modules
modulos=(
    "Half_Subtractor"
    "Full_Subtractor"
    "Ripple_Carry_Adder"
    "4-bit_Adder_Subtractor"
    "Binary_arrowright_Gray_Code_Converter"
    "Gray_arrowright_Binary_Code_Converter"
    "Multiplexer"
    "Demultiplexer"
    "Encoder"
    "Priority_Encoder"
    "Decoder"
    "Comparator"
    "Array_Multiplier"
    "Booths_Multiplier"
    "D_Flip-Flop_Asynchronous_Reset"
    "D_Flip-Flop_Synchronous_Reset"
    "SR_Flip-Flop"
    "JK_Flip-Flop"
    "T_Flip-Flop"
    "Universal_Shift_Register"
    "Linear_Feedback_Shift_Register"
    "Asynchronous_Counter"
    "Synchronous_Counter"
    "Mealy_Sequence_Detector"
    "Moore_Sequence_Detector"
    "Synchronous_FIFO"
    "Asynchronous_FIFO"
)
# Names of the pictures
pictures=(
    "GTKwave_output"
    "True_Table"
    "vvp_output"
)

# We start wit 03. 01 and 02 already do it. 
i=3

for nombre in "${modulos[@]}"; do
    # Two digital format (03, 04, 05...)
    dir_name=$(printf "%02d_%s" $i "$nombre")
    
    echo "Generando: $dir_name"
    
    # 1. Create folders
    mkdir -p "$dir_name"
    mkdir -p "$dir_name/Pictures"
    
    # 2. Create files .png 

    for nombre_picture in "${pictures[@]}"; do
        touch "$dir_name/Pictures/$nombre_picture.png"
    done

    touch "$dir_name/Pictures/$nombre.png"

    # 3. Create files .v y _tb.v 
    touch "$dir_name/$nombre.v"
    touch "$dir_name/${nombre}_tb.v"

#4. Template .v 
    file_path="$dir_name/$nombre.v"

cat > "$file_path" <<EOF
// Date: $(date +'%d/%m/%Y')
// Autor: Alan Gomez
// Module: $nombre
// --------------------------------------------------

module $nombre (
    // Inputs
    // Outputs
);

endmodule
EOF

#5 Template testbench
    file_path_tb="$dir_name/${nombre}_tb.v"

cat > "$file_path_tb" <<EOF
// Date: $(date +'%d/%m/%Y')
// Autor: Alan Gomez
// Module: ${nombre}_tb.v
// --------------------------------------------------

module ${nombre}_tb;
    reg a, b;        // Test inputs
    wire S, Cout;    // Test outputs

    // Instantiate the $nombre
    $nombre U1(
        .a(a),
        .b(b),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        // Set up VCD dump file for waveform viewing
        \$dumpfile("waveform.vcd");
        \$dumpvars(0, ${nombre}_tb);

        // Monitor changes in signals
        \$monitor("At time %0t: a=%b b=%b, sum=%b, carry=%b", \$time, a, b, S, Cout);

        // Test all input combinations
        a = 0; b = 0; 
        #40 $finish; // Finish Simulation
    end
    always #10 a = ~a; // Square wave with period 20
    always #5 b = ~b; // Square wave with period 10

endmodule
EOF
    
    ((i++))
done
