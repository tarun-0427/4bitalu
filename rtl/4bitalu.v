module alu_4bit (
    input  wire        clk,        // DFT / STA only
    input  wire        rst_n,      // DFT requirement
    input  wire [3:0]  A,
    input  wire [3:0]  B,
    input  wire [2:0]  ALU_CTRL,

    output reg  [3:0]  RESULT,
    output reg         CARRY_OUT,
    output reg         ZERO,
    output reg         OVERFLOW
);

    // Internal extended signals for arithmetic
    reg  [4:0] sum_ext;
    reg  [4:0] sub_ext;

    always @(*) begin
        // Defaults (critical to avoid inferred latches)
        RESULT     = 4'b0000;
        CARRY_OUT  = 1'b0;
        OVERFLOW   = 1'b0;

        case (ALU_CTRL)

            // ADD
            3'b000: begin
                sum_ext   = {1'b0, A} + {1'b0, B};
                RESULT    = sum_ext[3:0];
                CARRY_OUT = sum_ext[4];
                OVERFLOW  = (~(A[3] ^ B[3])) & (RESULT[3] ^ A[3]);
            end

            // SUB : A + (~B + 1)
            3'b001: begin
                sub_ext   = {1'b0, A} + {1'b0, (~B + 4'b0001)};
                RESULT    = sub_ext[3:0];
                CARRY_OUT = sub_ext[4];
                OVERFLOW  = (A[3] ^ B[3]) & (RESULT[3] ^ A[3]);
            end

            // AND
            3'b010: begin
                RESULT = A & B;
            end

            // OR
            3'b011: begin
                RESULT = A | B;
            end

            // XOR
            3'b100: begin
                RESULT = A ^ B;
            end

            // SLT (signed)
            3'b101: begin
                RESULT = ($signed(A) < $signed(B)) ? 4'b0001 : 4'b0000;
            end

            // PASS A
            3'b110: begin
                RESULT = A;
            end

            // PASS B
            3'b111: begin
                RESULT = B;
            end

            default: begin
                RESULT = 4'b0000;
            end
        endcase

        // ZERO flag (valid for all ops)
        ZERO = (RESULT == 4'b0000);
    end

endmodule
