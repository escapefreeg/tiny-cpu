`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/05 00:50:51
// Design Name: 
// Module Name: CONUNIT
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module CONUNIT(E_Op,Op,Func,Z,Regrt,Se,Wreg,Aluqb,Aluc,Wmem,Pcsrc,Reg2reg,Rs,Rt,E_Rd,M_Rd,E_Wreg,M_Wreg,FwdA,FwdB,E_Reg2reg,condep);
input [5:0]Op,Func,E_Op;
input Z;
input E_Wreg,M_Wreg,E_Reg2reg;
input [4:0]E_Rd,M_Rd,Rs,Rt;
output Regrt,Se,Wreg,Aluqb,Wmem,Reg2reg,condep;
output [1:0]Pcsrc,Aluc;
output reg [1:0]FwdA,FwdB;


//�жϱ���ָ�������
wire R_type=~|Op;
wire I_add=R_type&Func[5]&~Func[4]&~Func[3]&~Func[2]&~Func[1]&~Func[0];
wire I_sub=R_type&Func[5]&~Func[4]&~Func[3]&~Func[2]&Func[1]&~Func[0];
wire I_and=R_type&Func[5]&~Func[4]&~Func[3]&Func[2]&~Func[1]&~Func[0];
wire I_or=R_type&Func[5]&~Func[4]&~Func[3]&Func[2]&~Func[1]&Func[0];
wire I_addi=~Op[5]&~Op[4]&Op[3]&~Op[2]&~Op[1]&~Op[0];
wire I_andi=~Op[5]&~Op[4]&Op[3]&Op[2]&~Op[1]&~Op[0];
wire I_ori=~Op[5]&~Op[4]&Op[3]&Op[2]&~Op[1]&Op[0];
wire I_lw=Op[5]&~Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0];
wire I_sw=Op[5]&~Op[4]&Op[3]&~Op[2]&Op[1]&Op[0];
wire I_beq=~Op[5]&~Op[4]&~Op[3]&Op[2]&~Op[1]&~Op[0];
wire I_bne=~Op[5]&~Op[4]&~Op[3]&Op[2]&~Op[1]&Op[0];
wire E_beq=~E_Op[5]&~E_Op[4]&~E_Op[3]&E_Op[2]&~E_Op[1]&~E_Op[0];
wire E_bne=~E_Op[5]&~E_Op[4]&~E_Op[3]&E_Op[2]&~E_Op[1]&E_Op[0];
//����ָ���Ӧ��ָʾ�ź�
//Regrt=0����rd��Regrt=1������rd
assign Regrt = I_addi|I_andi|I_ori|I_lw|I_sw|I_beq|I_bne;
//se=0���߼���չ��se=1��������չ
assign Se = I_addi|I_lw|I_sw|I_beq|I_bne;
//Wreg=0����д�Ĵ�����Wreg=1��д�Ĵ���
assign Wreg = I_add|I_sub|I_and|I_or|I_addi|I_andi|I_ori|I_lw;
//Wmem=0����д�洢����Wmem=1��д�洢��
assign Wmem = I_sw;
//Aluqb=0���ڶ������������ǼĴ�����Aluqb=1���ڶ����������ǼĴ���
assign Aluqb = I_add|I_sub|I_and|I_or|I_beq|I_bne;
assign Aluc[1] = I_and|I_or|I_andi|I_ori;
assign Aluc[0] = I_sub|I_or|I_ori|I_beq|I_bne;
//pcֵ����Դ
assign Pcsrc[1] = (E_beq&Z)|(E_bne&~Z);
assign Pcsrc[0] = 0;//ԭ��׼��������������ת
//Reg2reg=0���Ĵ���ֵ���Դ洢����Reg2reg=1���Ĵ���ֵ�����Դ洢��
assign Reg2reg = ~I_lw;

//E_Instָʾrt�Ƿ���Դ�Ĵ���
wire E_Inst = I_add|I_sub|I_and|I_or|I_sw|I_beq|I_bne;

//condep = 1������������condepl = 0����������
assign condep=(E_beq&Z)|(E_bne&~Z);

always@(E_Rd,M_Rd,E_Wreg,M_Wreg,Rs)begin
    //��ǰ��
    FwdA=2'b00;
    //ǰ��ִ�жν��
    if((Rs==E_Rd)&(E_Rd!=0)&(E_Wreg==1))begin
        FwdA=2'b10;
    end 
    //ǰ�Ʒô�ν��
    else if ((Rs==M_Rd)&(M_Rd!=0)&(M_Wreg==1))begin
        FwdA=2'b01;
    end
end
always@(E_Rd,M_Rd,E_Wreg,M_Wreg,Rt)begin
    //��ǰ��
    FwdB=2'b00;
    //ǰ��ִ�жν��
    if((Rt==E_Rd)&(E_Rd!=0)&(E_Wreg==1))begin
        FwdB=2'b10;
    end 
    //ǰ�Ʒô�ν��
    else if((Rt==M_Rd)&(M_Rd!=0)&(M_Wreg==1))begin
        FwdB=2'b01;
    end
end

endmodule
