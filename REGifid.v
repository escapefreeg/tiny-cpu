module REGifid(D0,D1,En,Clk,Clrn,Q0,Q1,condep);
input [31:0] D0,D1;
input En,Clk,Clrn;
input condep;
output reg [31:0] Q0,Q1;
//两个reg
reg [31:0] reg0,reg1;
wire Clrn_C;


//只有Clrn = 1，condep = 0时Clrn_C才会为1
//只有Clrn = 0或condep = 1时Clrn_C为0
assign Clrn_C=Clrn&~condep;

//初始化寄存器内数据
initial begin
    reg0=32'b0;
    reg1=32'b0;
end

always @(posedge Clk) begin
    Q0 = reg0;
    Q1 = reg1;
end

always @(negedge Clk) begin
    //Clrn_C == 0寄存器清0
    if (Clrn_C == 0) begin
        reg0=32'b0;
        reg1=32'b0;
    end
    //En == 1在时钟下降沿打入数据
    else if(En == 1) begin
        reg0 = D0;
        reg1 = D1;
    end
    //En == 0 暂停即可
end
endmodule