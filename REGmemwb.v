module REGmemwb(D0,D1,D2,D3,D4,En,Clk,Clrn,Q0,Q1,Q2,Q3,Q4);
input D0,D1;
input [31:0] D2,D3;
input [4:0] D4;
input En,Clk,Clrn;

output reg Q0,Q1;
output reg [31:0] Q2,Q3;
output reg [4:0] Q4;

//reg
reg reg0,reg1;
reg [31:0] reg2,reg3;
reg [4:0] reg4;
//assign

//logical

initial begin
    reg0= 0;reg1= 0;reg2= 0;
    reg3= 0;reg4= 0;
end

always @(posedge Clk) begin
    Q0= reg0;Q1= reg1;
    Q2= reg2;Q3= reg3;
    Q4= reg4;
end


always @(negedge Clk) begin
    //Clrn == 0输出清0
    if (Clrn == 0) begin
        reg0= 0;reg1= 0;reg2= 0;
        reg3= 0;reg4= 0;
    end
    //En == 1在时钟上升沿打入数据
    else if(En == 1) begin
        reg0= D0;reg1= D1;reg2= D2;
        reg3= D3;reg4= D4;
    end
    //En == 0 不变即可
end
endmodule