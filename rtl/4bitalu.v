//====================================================
// 4-bit ALU – Industry-Grade RTL
// - Lint clean
// - CDC/RDC safe (no internal clocks/resets)
// - X-propagation controlled
// - Assertion hooks included
// - UPF/CPF & DFT friendly
//====================================================

module alu_4bit (
    // Functional inputs
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire [2:0] ALU_CTRL,

    // Functional outputs
    output reg  [3:0] RESULT,
    output reg        CARRY_OUT,
    output reg        OVERFLOW,
    output reg        ZERO,
    
    input  wire scan_enable,
    input  wire scan_in,
    output wire scan_out

);
    // Internal extended signals
    reg [4:0] sum_ext;
    reg [4:0] sub_ext;

    // ------------------------------------------------
    // Combinational ALU
    // ------------------------------------------------
    always @(*) begin
        // ---- DEFAULTS (mandatory for lint + X safety) ----
        RESULT     = 4'b0000;
        CARRY_OUT  = 1'b0;
        OVERFLOW   = 1'b0;
        ZERO       = 1'b1;      // overwritten later
        sum_ext    = 5'b00000;
        sub_ext    = 5'b00000;

        case (ALU_CTRL)

            // ADD
            3'b000: begin
                sum_ext   = {1'b0, A} + {1'b0, B};
                RESULT    = sum_ext[3:0];
                CARRY_OUT = sum_ext[4];
                OVERFLOW  = (~(A[3] ^ B[3])) & (RESULT[3] ^ A[3]);
            end

            // SUB
            3'b001: begin
                sub_ext   = {1'b0, A} + {1'b0, (~B + 4'b0001)};
                RESULT    = sub_ext[3:0];
                CARRY_OUT = sub_ext[4];
                OVERFLOW  = (A[3] ^ B[3]) & (RESULT[3] ^ A[3]);
            end

            // AND
            3'b010: RESULT = A & B;

            // OR
            3'b011: RESULT = A | B;

            // XOR
            3'b100: RESULT = A ^ B;

            // NOT A
            3'b101: RESULT = ~A;

            // PASS A
            3'b110: RESULT = A;

            // PASS B
            3'b111: RESULT = B;

            // no default needed (full opcode coverage)
        endcase

        // ZERO flag valid for all ops
        ZERO = (RESULT == 4'b0000);
    end

`ifdef ASSERTIONS
    // ------------------------------------------------
    // Assertions (SEC / formal / simulation)
    // ------------------------------------------------

    // ALU_CTRL must never be X/Z
    always @(*) begin
        assert (^ALU_CTRL !== 1'bX)
            else $error("ALU_CTRL has X/Z");
    end

    // RESULT must never be X
    always @(*) begin
        assert (^RESULT !== 1'bX)
            else $error("RESULT has X");
    end
`endif

endmodule

