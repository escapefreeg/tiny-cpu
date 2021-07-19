module PC(IF_Result,Clk,En,Clrn,IF_Addr);
input [31:0]IF_Result;
input Clk,En,Clrn;
output reg [31:0] IF_Addr;
reg [31:0]pc;
//��ʼ��PC��ֵΪ0

initial begin
    pc = 32'b0;
end
//�����ض���pcֵ
always @(posedge Clk) begin
    IF_Addr = pc;
end
//�½����޸�pcֵ
always @(negedge Clk) begin
    //Clrn == 0�����0
    if (Clrn == 0) begin
        pc = 32'b0;
    end
    //En == 1��ʱ�������ش�������
    else if(En == 1) begin
        pc = IF_Result;
    end
    //En == 0 ���伴��
end
endmodule
