module MAIN(Clk,En,Clrn,Instnum);

input Clk,En,Clrn;
output wire Instnum;

wire [31:0] IF_Result,IF_Addr,IF_PCadd4,IF_Inst,D,ID_Qa,ID_Qb,ID_PCadd4,ID_Inst;
wire [31:0] E_R1,E_R2,E_I,E_I_L2,Y,E_R,E_PC,M_PC,M_R,M_S,Dout,W_D,W_C,ID_EXTIMM,Alu_X,E_NUM,ID_EXTIMM_L2,ID_PC;
wire[5:0] E_Op;
wire [4:0] ID_Wr,W_Wr,E_Rd,M_Rd;
wire [1:0]Aluc,Pcsrc,E_Aluc,FwdA,FwdB,E_FwdA,E_FwdB;
wire Regrt,Se,Wreg,Aluqb,Reg2reg,Wmem,Z;
wire E_Wreg,E_Reg2reg,E_Wmem,E_Aluqb,Cout,M_Wreg,M_Reg2reg,M_Wmem,W_Wreg,W_Reg2reg,stall,condep;
//wire [4:0] W_Rd;

COUNTER counter(Clk,Clrn,Instnum);

//IF段
MUX4X32 mux4x32(IF_PCadd4,0,E_PC,0,Pcsrc,IF_Result);
PC pc(IF_Result,Clk,En,Clrn,IF_Addr);
PCAdd4 pcadd4(IF_Addr,IF_PCadd4);
INSTMEM instmem(IF_Addr,IF_Inst);
REGifid ifid(IF_PCadd4,IF_Inst,En,Clk,Clrn,ID_PCadd4,ID_Inst,condep);


//ID段
CONUNIT conunit(E_Op,ID_Inst[31:26],ID_Inst[5:0],Z,Regrt,Se,Wreg,Aluqb,Aluc,Wmem,Pcsrc,Reg2reg,ID_Inst[25:21],ID_Inst[20:16],E_Rd,M_Rd,E_Wreg,M_Wreg,FwdA,FwdB,E_Reg2reg,condep);
MUX2X5 mux2x5(ID_Inst[15:11],ID_Inst[20:16],Regrt,ID_Wr);
EXT16T32 ext16t32(ID_Inst[15:0],Se,ID_EXTIMM);//将16位立即数扩展为32位
REGFILE regfile(ID_Inst[25:21],ID_Inst[20:16],D,W_Wr,W_Wreg,Clk,Clrn,ID_Qa,ID_Qb);
SHIFTER32_L2 shifter2(ID_EXTIMM,ID_EXTIMM_L2);//将32位数据左移两位
CLA_32 cla_32(ID_PCadd4,ID_EXTIMM_L2,0,ID_PC,Cout);//将pc+4和扩展后的立即数相加（即跳转地址）
REGidex idex(ID_PC,Wreg,Reg2reg,Wmem,ID_Inst[31:26],Aluc,Aluqb,ID_Qa,ID_Qb,ID_EXTIMM,ID_Wr,En,Clk,Clrn,E_Wreg,E_Reg2reg,E_Wmem,E_Op,E_Aluc,E_Aluqb,E_R1,E_R2,E_I,E_Rd,FwdA,FwdB,E_FwdA,E_FwdB,E_PC,condep);

//EX段
MUX4X32 mux4x32_ex_1(E_R1,D,M_R,0,E_FwdA,Alu_X);
MUX4X32 mux4x32_ex_2(E_R2,D,M_R,0,E_FwdB,E_NUM);
MUX2X32 mux2x321(E_I,E_NUM,E_Aluqb,Y);
ALU alu(Alu_X,Y,E_Aluc,E_R,Z);
REGexmem exmem(E_Wreg,E_Reg2reg,E_Wmem,E_PC,E_R,E_R2,E_Rd,En,Clk,Clrn,M_Wreg,M_Reg2reg,M_Wmem,M_PC,M_R,M_S,M_Rd);

//MEM段
DATAMEM datamem(M_R,M_S,Clk,M_Wmem,Dout);
REGmemwb memwb(M_Wreg,M_Reg2reg,M_R,Dout,M_Rd,En,Clk,Clrn,W_Wreg,W_Reg2reg,W_D,W_C,W_Wr);

//WB段
MUX2X32 mux2x322(W_C,W_D,W_Reg2reg,D);
endmodule