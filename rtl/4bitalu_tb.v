`timescale 1ns/1ps

module tb_alu_4bit;

    // DUT inputs
    reg  [3:0] A;
    reg  [3:0] B;
    reg  [2:0] ALU_CTRL;

    reg scan_enable;
    reg scan_in;

    // DUT outputs
    wire [3:0] RESULT;
    wire       CARRY_OUT;
    wire       OVERFLOW;
    wire       ZERO;
    wire       scan_out;

    // Instantiate DUT
    alu_4bit dut (
        .A(A),
        .B(B),
        .ALU_CTRL(ALU_CTRL),
        .RESULT(RESULT),
        .CARRY_OUT(CARRY_OUT),
        .OVERFLOW(OVERFLOW),
        .ZERO(ZERO),
        .scan_enable(scan_enable),
        .scan_in(scan_in),
        .scan_out(scan_out)
    );

    // Waveform dump
    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, tb_alu_4bit);
    end

    // Task to apply stimulus
    task apply;
        input [3:0] a_in;
        input [3:0] b_in;
        input [2:0] op_in;
        begin
            A = a_in;
            B = b_in;
            ALU_CTRL = op_in;
            #10;
            $display("A=%b B=%b OP=%b | RESULT=%b CARRY=%b OVF=%b ZERO=%b",
                      A, B, ALU_CTRL, RESULT, CARRY_OUT, OVERFLOW, ZERO);
        end
    endtask

    // Test sequence
    initial begin
        // Initialize
        A = 0;
        B = 0;
        ALU_CTRL = 0;
        scan_enable = 0;
        scan_in = 0;

        #10;

        // ADD
        apply(4'd5, 4'd3, 3'b000);
        apply(4'd7, 4'd9, 3'b000);

        // SUB
        apply(4'd9, 4'd4, 3'b001);
        apply(4'd4, 4'd9, 3'b001);

        // AND
        apply(4'b1100, 4'b1010, 3'b010);

        // OR
        apply(4'b1100, 4'b1010, 3'b011);

        // XOR
        apply(4'b1100, 4'b1010, 3'b100);

        // NOT A
        apply(4'b1010, 4'b0000, 3'b101);

        // PASS A
        apply(4'b0110, 4'b0000, 3'b110);

        // PASS B
        apply(4'b0000, 4'b1111, 3'b111);

        #20;
        $display("Simulation Finished");
        $finish;
    end

endmodule
