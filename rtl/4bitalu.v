module alu_4bit (
  //  input  wire        clk,        // DFT / STA only
  //   input  wire        rst_n,      // DFT requirement
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
    // --------------------------------
    // DEFAULT ASSIGNMENTS (MANDATORY)
    // --------------------------------
    RESULT    = 4'b0000;
    CARRY_OUT = 1'b0;
    OVERFLOW  = 1'b0;
    ZERO      = 1'b0;
    sum_ext   = 5'b00000;
    sub_ext   = 5'b00000;

    case (ALU_CTRL)

        // ADD
        3'b000: begin
            sum_ext   = {1'b0, A} + {1'b0, B};
            RESULT    = sum_ext[3:0];
            CARRY_OUT = sum_ext[4];
            OVERFLOW  = (~(A[3] ^ B[3])) & (RESULT[3] ^ A[3]);
        end

        // SUB : A - B
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

        default: begin
          RESULT    = 4'bxxxx;
    CARRY_OUT = 1'bx;
    OVERFLOW  = 1'bx;
    ZERO      = 1'bx;   // defaults already cover everything
        end
    endcase

    // ZERO flag (derived output, must be last)
    if (RESULT == 4'b0000)
        ZERO = 1'b1;
    else
        ZERO = 1'b0;
end

endmodule

