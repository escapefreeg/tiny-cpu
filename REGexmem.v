module REGexmem(D0,D1,D2,D3,D4,D5,D6,En,Clk,Clrn,Q0,Q1,Q2,Q3,Q4,Q5,Q6);
input [31:0] D3,D4,D5;
input [4:0] D6;
input D0,D1,D2;
input En,Clk,Clrn;

output reg [31:0] Q3,Q4,Q5;
output reg [4:0] Q6; 
output reg Q0,Q1,Q2;

reg [31:0] reg3,reg4,reg5;
reg [4:0] reg6; 
reg reg0,reg1,reg2;



initial begin
    reg0= 0;reg1= 0;reg2= 0;
    reg3= 0;reg4= 0;reg5= 0;
    reg6= 0;
end

always @(posedge Clk) begin
    Q0= reg0;Q1= reg1;
    Q2= reg2;Q3= reg3;
    Q4= reg4;Q5= reg5;
    Q6= reg6;
end

always @(negedge Clk) begin
    //Clrn == 0输出清0
    if (Clrn == 0) begin
        reg0= 0;reg1= 0;reg2= 0;
        reg3= 0;reg4= 0;reg5= 0;
        reg6= 0;
    end
    //En == 1在时钟下降沿打入数据
    else if(En == 1) begin
        reg0= D0;reg1= D1;reg2= D2;
        reg3= D3;reg4= D4;reg5= D5;
        reg6= D6;
    end
    //En == 0 不变即可
end
endmodule