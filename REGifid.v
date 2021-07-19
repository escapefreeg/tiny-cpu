module REGifid(D0,D1,En,Clk,Clrn,Q0,Q1,condep);
input [31:0] D0,D1;
input En,Clk,Clrn;
input condep;
output reg [31:0] Q0,Q1;
//����reg
reg [31:0] reg0,reg1;
wire Clrn_C;


//ֻ��Clrn = 1��condep = 0ʱClrn_C�Ż�Ϊ1
//ֻ��Clrn = 0��condep = 1ʱClrn_CΪ0
assign Clrn_C=Clrn&~condep;

//��ʼ���Ĵ���������
initial begin
    reg0=32'b0;
    reg1=32'b0;
end

always @(posedge Clk) begin
    Q0 = reg0;
    Q1 = reg1;
end

always @(negedge Clk) begin
    //Clrn_C == 0�Ĵ�����0
    if (Clrn_C == 0) begin
        reg0=32'b0;
        reg1=32'b0;
    end
    //En == 1��ʱ���½��ش�������
    else if(En == 1) begin
        reg0 = D0;
        reg1 = D1;
    end
    //En == 0 ��ͣ����
end
endmodule