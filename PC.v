module PC(IF_Result,Clk,En,Clrn,IF_Addr);
input [31:0]IF_Result;
input Clk,En,Clrn;
output reg [31:0] IF_Addr;
reg [31:0]pc;
//初始化PC的值为0

initial begin
    pc = 32'b0;
end
//上升沿读出pc值
always @(posedge Clk) begin
    IF_Addr = pc;
end
//下降沿修改pc值
always @(negedge Clk) begin
    //Clrn == 0输出清0
    if (Clrn == 0) begin
        pc = 32'b0;
    end
    //En == 1在时钟上升沿打入数据
    else if(En == 1) begin
        pc = IF_Result;
    end
    //En == 0 不变即可
end
endmodule
