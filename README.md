# ⚙️ Implementation of 30 Digital Circuits in Verilog

This repository is a collection of 30 digital circuits implemented using Verilog HDL, covering both combinational and sequential logic. The project's goal was to design, write testbenches for, and simulate each circuit individually, demonstrating practical skills in digital design and hardware verification.

In addition to the behavioral modeling of each circuit, the project also implements all circuits from scratch using structural modeling, where only the basic gates (NOT, AND, OR) are used to build more complex modules. This approach allows a deeper understanding of the internal workings of each design, similar to how IC design engineers create functional modules and then hand them off for integration.

The exercises are based on the reference guide: *“30 Digital Circuits (Combinational + Sequential) Verilog + Testbench”* by [THE SILICON SANDBOX](https://www.linkedin.com/posts/the1silicon1sandbox_30-digital-circuits-verilog-testbench-activity-7401068262324715520-ZGv7/?utm_source=share&utm_medium=member_android&rcm=ACoAAFIQpiYBmTP2AfGWXjBImU4u9eYQnwlK2tk).

---

## 🛠️ Tools and Methodology

### Design Methodology

The hardware description (HDL) was implemented using two main modeling styles in Verilog to compare the different types of circuits:

* **Behavioral Modeling:** Describes the *behavior* or functionality of a circuit at a high level of abstraction (e.g., using `always` blocks or `assign` statements).
* **Structural Modeling:** Builds the circuit by instantiating and connecting smaller modules or primitive logic gates, emphasizing the hardware’s *physical structure*.


### Software Utilized

The following open-source tools were used for development and verification:

* **[Icarus Verilog](https://packages.fedoraproject.org/pkgs/iverilog/iverilog/):** The compiler and simulator used to process the Verilog code and generate the value change dump (`.vcd`) files.
* **[GTKWave](https://gtkwave.sourceforge.net/):** The waveform viewer used to visually analyze the simulation results and verify the correct functionality of the circuits.
* **[Yosys](https://packages.fedoraproject.org/pkgs/yosys/yosys/):** The synthesis tool used to generate schematics and analyze the structural representation of the circuits.


---

## 📂 Repository Structure

Each circuit resides in its own dedicated folder. Within each folder, you will typically find:

* `[circuit_name].v`: The main circuit module.
* `[circuit_name]_tb.v`: The corresponding testbench used for verification.
* `waveform.vcd` (generated after simulation): The simulation dump file.
* `circuit_name.png` (generated after simulation with DigitalJS/Yosys): The simulation schematic.
* `circuit_name.digitaljs` (generated after simulation with DigitalJS/Yosys): The DigitalJS schematic file.



---

## ▶️ How to Run the Simulations

To compile and run a simulation (for example, for the `Half_Adder` circuit, you must navigate to its specific folder):

1.  Ensure you have Icarus Verilog and GTKWave installed.
2.  Open your terminal and navigate to the desired circuit folder.
3.  **Compile** the testbench using `iverilog`:
    ```bash
    iverilog -o waveform.vvp [circuit_name]_tb.v circuit_name.v 
    ```
4.  **Execute** the compiled file to generate the `.vcd` file:
    ```bash
    vvp waveform.vvp
    ```
5.  **Visualize** the signals with GTKWave:
    ```bash
    gtkwave waveform.vcd
    ```

---



