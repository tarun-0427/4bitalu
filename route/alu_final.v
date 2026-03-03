module alu_4bit (CARRY_OUT,
    OVERFLOW,
    ZERO,
    A,
    ALU_CTRL,
    B,
    RESULT);
 output CARRY_OUT;
 output OVERFLOW;
 output ZERO;
 input [3:0] A;
 input [2:0] ALU_CTRL;
 input [3:0] B;
 output [3:0] RESULT;

 wire _143_;
 wire _144_;
 wire _145_;
 wire _146_;
 wire _147_;
 wire _148_;
 wire _149_;
 wire _150_;
 wire _151_;
 wire _152_;
 wire _153_;
 wire _154_;
 wire _155_;
 wire _156_;
 wire _157_;
 wire _158_;
 wire _159_;
 wire _160_;
 wire _161_;
 wire _162_;
 wire _163_;
 wire _164_;
 wire _165_;
 wire _166_;
 wire _167_;
 wire _168_;
 wire _169_;
 wire _170_;
 wire _171_;
 wire _172_;
 wire _173_;
 wire _174_;
 wire _175_;
 wire _176_;
 wire _177_;
 wire _178_;
 wire _179_;
 wire _180_;
 wire _181_;
 wire _182_;
 wire _183_;
 wire _184_;
 wire _185_;
 wire _186_;
 wire _187_;
 wire _188_;
 wire _189_;
 wire _190_;
 wire _191_;
 wire _192_;
 wire _193_;
 wire _194_;
 wire _195_;
 wire _196_;
 wire _197_;
 wire _198_;
 wire _199_;
 wire _200_;
 wire _201_;
 wire _202_;
 wire _203_;
 wire _204_;
 wire _205_;
 wire _206_;
 wire _207_;
 wire _208_;
 wire _209_;
 wire _210_;
 wire _211_;
 wire _212_;
 wire _213_;
 wire _214_;
 wire _215_;
 wire _216_;
 wire _217_;
 wire _218_;
 wire _219_;
 wire _220_;
 wire _221_;

 sky130_fd_sc_hd__nand3b_1 _222_ (.A_N(ALU_CTRL[1]),
    .B(ALU_CTRL[0]),
    .C(ALU_CTRL[2]),
    .Y(_150_));
 sky130_fd_sc_hd__nor2_1 _223_ (.A(A[0]),
    .B(_150_),
    .Y(_151_));
 sky130_fd_sc_hd__nand2_1 _224_ (.A(ALU_CTRL[0]),
    .B(ALU_CTRL[1]),
    .Y(_152_));
 sky130_fd_sc_hd__nor2_1 _225_ (.A(ALU_CTRL[2]),
    .B(_152_),
    .Y(_153_));
 sky130_fd_sc_hd__and2_0 _226_ (.A(B[0]),
    .B(A[0]),
    .X(_154_));
 sky130_fd_sc_hd__nor3b_1 _227_ (.A(ALU_CTRL[2]),
    .B(ALU_CTRL[1]),
    .C_N(ALU_CTRL[0]),
    .Y(_155_));
 sky130_fd_sc_hd__clkinv_1 _228_ (.A(_155_),
    .Y(_156_));
 sky130_fd_sc_hd__a211oi_1 _229_ (.A1(ALU_CTRL[2]),
    .A2(ALU_CTRL[0]),
    .B1(ALU_CTRL[1]),
    .C1(_154_),
    .Y(_157_));
 sky130_fd_sc_hd__lpflow_isobufsrc_1 _230_ (.A(ALU_CTRL[1]),
    .SLEEP(ALU_CTRL[0]),
    .X(_158_));
 sky130_fd_sc_hd__and3_1 _231_ (.A(ALU_CTRL[2]),
    .B(ALU_CTRL[0]),
    .C(ALU_CTRL[1]),
    .X(_159_));
 sky130_fd_sc_hd__o211ai_1 _232_ (.A1(B[0]),
    .A2(ALU_CTRL[2]),
    .B1(_158_),
    .C1(A[0]),
    .Y(_160_));
 sky130_fd_sc_hd__o22ai_1 _233_ (.A1(B[0]),
    .A2(A[0]),
    .B1(_153_),
    .B2(_157_),
    .Y(_161_));
 sky130_fd_sc_hd__a21oi_1 _234_ (.A1(B[0]),
    .A2(_159_),
    .B1(_151_),
    .Y(_162_));
 sky130_fd_sc_hd__nand3_1 _235_ (.A(_160_),
    .B(_161_),
    .C(_162_),
    .Y(_145_));
 sky130_fd_sc_hd__nand2_1 _236_ (.A(B[0]),
    .B(B[1]),
    .Y(_163_));
 sky130_fd_sc_hd__lpflow_inputiso1p_1 _237_ (.A(B[0]),
    .SLEEP(B[1]),
    .X(_164_));
 sky130_fd_sc_hd__and3_1 _238_ (.A(A[1]),
    .B(_163_),
    .C(_164_),
    .X(_165_));
 sky130_fd_sc_hd__a21oi_1 _239_ (.A1(_163_),
    .A2(_164_),
    .B1(A[1]),
    .Y(_166_));
 sky130_fd_sc_hd__o21bai_1 _240_ (.A1(_165_),
    .A2(_166_),
    .B1_N(_154_),
    .Y(_167_));
 sky130_fd_sc_hd__nor2_1 _241_ (.A(B[1]),
    .B(A[1]),
    .Y(_168_));
 sky130_fd_sc_hd__nand2_1 _242_ (.A(B[1]),
    .B(A[1]),
    .Y(_169_));
 sky130_fd_sc_hd__xnor2_1 _243_ (.A(B[1]),
    .B(A[1]),
    .Y(_170_));
 sky130_fd_sc_hd__a21oi_1 _244_ (.A1(_154_),
    .A2(_170_),
    .B1(_156_),
    .Y(_171_));
 sky130_fd_sc_hd__nand2_1 _245_ (.A(_167_),
    .B(_171_),
    .Y(_172_));
 sky130_fd_sc_hd__nor3_1 _246_ (.A(ALU_CTRL[2]),
    .B(ALU_CTRL[0]),
    .C(ALU_CTRL[1]),
    .Y(_173_));
 sky130_fd_sc_hd__xnor2_1 _247_ (.A(_154_),
    .B(_170_),
    .Y(_174_));
 sky130_fd_sc_hd__nor3_1 _248_ (.A(ALU_CTRL[2]),
    .B(_152_),
    .C(_168_),
    .Y(_175_));
 sky130_fd_sc_hd__nor2_1 _249_ (.A(A[1]),
    .B(_150_),
    .Y(_176_));
 sky130_fd_sc_hd__or3b_1 _250_ (.A(ALU_CTRL[0]),
    .B(ALU_CTRL[1]),
    .C_N(ALU_CTRL[2]),
    .X(_177_));
 sky130_fd_sc_hd__nand2b_1 _251_ (.A_N(ALU_CTRL[2]),
    .B(_158_),
    .Y(_178_));
 sky130_fd_sc_hd__o22ai_1 _252_ (.A1(_170_),
    .A2(_177_),
    .B1(_178_),
    .B2(_169_),
    .Y(_179_));
 sky130_fd_sc_hd__a2111oi_0 _253_ (.A1(B[1]),
    .A2(_159_),
    .B1(_175_),
    .C1(_176_),
    .D1(_179_),
    .Y(_180_));
 sky130_fd_sc_hd__a32oi_1 _254_ (.A1(ALU_CTRL[2]),
    .A2(A[1]),
    .A3(_158_),
    .B1(_173_),
    .B2(_174_),
    .Y(_181_));
 sky130_fd_sc_hd__nand3_1 _255_ (.A(_172_),
    .B(_180_),
    .C(_181_),
    .Y(_146_));
 sky130_fd_sc_hd__a32oi_1 _256_ (.A1(A[1]),
    .A2(_163_),
    .A3(_164_),
    .B1(_170_),
    .B2(_154_),
    .Y(_182_));
 sky130_fd_sc_hd__or3_1 _257_ (.A(B[0]),
    .B(B[1]),
    .C(B[2]),
    .X(_183_));
 sky130_fd_sc_hd__o21ai_0 _258_ (.A1(B[0]),
    .A2(B[1]),
    .B1(B[2]),
    .Y(_184_));
 sky130_fd_sc_hd__and3_1 _259_ (.A(A[2]),
    .B(_183_),
    .C(_184_),
    .X(_185_));
 sky130_fd_sc_hd__a21oi_1 _260_ (.A1(_183_),
    .A2(_184_),
    .B1(A[2]),
    .Y(_186_));
 sky130_fd_sc_hd__o21ai_0 _261_ (.A1(_185_),
    .A2(_186_),
    .B1(_182_),
    .Y(_187_));
 sky130_fd_sc_hd__o31a_1 _262_ (.A1(_182_),
    .A2(_185_),
    .A3(_186_),
    .B1(_155_),
    .X(_188_));
 sky130_fd_sc_hd__nand2_1 _263_ (.A(_187_),
    .B(_188_),
    .Y(_189_));
 sky130_fd_sc_hd__nand2_1 _264_ (.A(B[2]),
    .B(A[2]),
    .Y(_190_));
 sky130_fd_sc_hd__xnor2_1 _265_ (.A(B[2]),
    .B(A[2]),
    .Y(_191_));
 sky130_fd_sc_hd__a22oi_1 _266_ (.A1(B[0]),
    .A2(A[0]),
    .B1(B[1]),
    .B2(A[1]),
    .Y(_192_));
 sky130_fd_sc_hd__o21ai_0 _267_ (.A1(_168_),
    .A2(_192_),
    .B1(_191_),
    .Y(_193_));
 sky130_fd_sc_hd__o311ai_0 _268_ (.A1(_168_),
    .A2(_191_),
    .A3(_192_),
    .B1(_193_),
    .C1(_173_),
    .Y(_194_));
 sky130_fd_sc_hd__nand3b_1 _269_ (.A_N(ALU_CTRL[2]),
    .B(A[2]),
    .C(_158_),
    .Y(_195_));
 sky130_fd_sc_hd__a21oi_1 _270_ (.A1(A[2]),
    .A2(_153_),
    .B1(B[2]),
    .Y(_196_));
 sky130_fd_sc_hd__a21o_1 _271_ (.A1(_152_),
    .A2(_195_),
    .B1(_196_),
    .X(_197_));
 sky130_fd_sc_hd__o22ai_1 _272_ (.A1(A[2]),
    .A2(_150_),
    .B1(_177_),
    .B2(_191_),
    .Y(_198_));
 sky130_fd_sc_hd__a31oi_1 _273_ (.A1(ALU_CTRL[2]),
    .A2(A[2]),
    .A3(_158_),
    .B1(_198_),
    .Y(_199_));
 sky130_fd_sc_hd__nand4_1 _274_ (.A(_189_),
    .B(_194_),
    .C(_197_),
    .D(_199_),
    .Y(_147_));
 sky130_fd_sc_hd__o21bai_1 _275_ (.A1(_182_),
    .A2(_186_),
    .B1_N(_185_),
    .Y(_200_));
 sky130_fd_sc_hd__xor2_1 _276_ (.A(B[3]),
    .B(_183_),
    .X(_201_));
 sky130_fd_sc_hd__xor2_1 _277_ (.A(A[3]),
    .B(_201_),
    .X(_202_));
 sky130_fd_sc_hd__xnor2_1 _278_ (.A(_200_),
    .B(_202_),
    .Y(_203_));
 sky130_fd_sc_hd__nor2_1 _279_ (.A(B[3]),
    .B(A[3]),
    .Y(_204_));
 sky130_fd_sc_hd__and2_0 _280_ (.A(B[3]),
    .B(A[3]),
    .X(_205_));
 sky130_fd_sc_hd__nor2_1 _281_ (.A(_204_),
    .B(_205_),
    .Y(_206_));
 sky130_fd_sc_hd__o31ai_1 _282_ (.A1(_168_),
    .A2(_191_),
    .A3(_192_),
    .B1(_190_),
    .Y(_207_));
 sky130_fd_sc_hd__xor2_1 _283_ (.A(_206_),
    .B(_207_),
    .X(_208_));
 sky130_fd_sc_hd__nand2_1 _284_ (.A(_173_),
    .B(_208_),
    .Y(_209_));
 sky130_fd_sc_hd__nor2_1 _285_ (.A(_177_),
    .B(_205_),
    .Y(_210_));
 sky130_fd_sc_hd__o22ai_1 _286_ (.A1(B[3]),
    .A2(A[3]),
    .B1(_153_),
    .B2(_210_),
    .Y(_211_));
 sky130_fd_sc_hd__nor2_1 _287_ (.A(A[3]),
    .B(_150_),
    .Y(_212_));
 sky130_fd_sc_hd__o211ai_1 _288_ (.A1(ALU_CTRL[2]),
    .A2(B[3]),
    .B1(A[3]),
    .C1(_158_),
    .Y(_213_));
 sky130_fd_sc_hd__a21oi_1 _289_ (.A1(B[3]),
    .A2(_159_),
    .B1(_212_),
    .Y(_214_));
 sky130_fd_sc_hd__and3_1 _290_ (.A(_211_),
    .B(_213_),
    .C(_214_),
    .X(_215_));
 sky130_fd_sc_hd__o211ai_1 _291_ (.A1(_156_),
    .A2(_203_),
    .B1(_209_),
    .C1(_215_),
    .Y(_148_));
 sky130_fd_sc_hd__nor4_1 _292_ (.A(_145_),
    .B(_146_),
    .C(_147_),
    .D(_148_),
    .Y(_149_));
 sky130_fd_sc_hd__nor2b_1 _293_ (.A(_204_),
    .B_N(_207_),
    .Y(_216_));
 sky130_fd_sc_hd__o21ai_0 _294_ (.A1(_205_),
    .A2(_207_),
    .B1(_173_),
    .Y(_217_));
 sky130_fd_sc_hd__nand2_1 _295_ (.A(_155_),
    .B(_206_),
    .Y(_218_));
 sky130_fd_sc_hd__mux2i_1 _296_ (.A0(B[3]),
    .A1(A[3]),
    .S(_203_),
    .Y(_219_));
 sky130_fd_sc_hd__o22ai_1 _297_ (.A1(_216_),
    .A2(_217_),
    .B1(_218_),
    .B2(_219_),
    .Y(_144_));
 sky130_fd_sc_hd__a21oi_1 _298_ (.A1(A[3]),
    .A2(_201_),
    .B1(_200_),
    .Y(_220_));
 sky130_fd_sc_hd__o21ai_0 _299_ (.A1(A[3]),
    .A2(_201_),
    .B1(_155_),
    .Y(_221_));
 sky130_fd_sc_hd__o22ai_1 _300_ (.A1(_204_),
    .A2(_217_),
    .B1(_220_),
    .B2(_221_),
    .Y(_143_));
 assign CARRY_OUT = _143_;
 assign OVERFLOW = _144_;
 assign RESULT[0] = _145_;
 assign RESULT[1] = _146_;
 assign RESULT[2] = _147_;
 assign RESULT[3] = _148_;
 assign ZERO = _149_;
endmodule
