module REGidex(D13,D0,D1,D2,D3,D4,D5,D7,D8,D9,D10,En,Clk,Clrn,Q0,Q1,Q2,Q3,Q4,Q5,Q7,Q8,Q9,Q10,D11,D12,Q11,Q12,Q13,condep);
input D0,D1,D2,D5;
input [31:0] D7,D8,D9,D13;
input [5:0]D3;
input [4:0]D10;
input [1:0]D4,D11,D12;
input En,Clk,Clrn,condep;

output reg Q0,Q1,Q2,Q5;
output reg [31:0] Q7,Q8,Q9,Q13;
output reg [5:0] Q3;
output reg [4:0]Q10;
output reg [1:0]Q4,Q11,Q12;

reg reg0,reg1,reg2,reg5;
reg [31:0] reg7,reg8,reg9,reg13;
reg [5:0] reg3;
reg [4:0] reg10;
reg [1:0] reg4,reg11,reg12;

wire Clrn_SC;
//Clrn = 0或condep = 1时清零
assign Clrn_SC=Clrn&~condep;



initial begin
    reg0= 0;reg1= 0;reg2= 0;
    reg3= 0;reg4= 0;reg5= 0;
    reg7= 0;reg8= 0;reg9= 0;
    reg10= 0;reg11= 0;reg12= 0;reg13= 0;
end

always @(posedge Clk) begin
    Q0= reg0;Q1= reg1;
    Q2= reg2;Q3= reg3;
    Q4= reg4;Q5= reg5;
    Q7= reg7;Q8= reg8;
    Q9= reg9;Q10= reg10;
    Q11= reg11;Q12= reg12;
    Q13= reg13;
end

always @(negedge Clk) begin
    //Clrn == 0输出清0
    if (Clrn_SC == 0) begin
        reg0= 0;reg1= 0;reg2= 0;
        reg3= 0;reg4= 0;reg5= 0;
        reg7= 0;reg8= 0;reg9= 0;
        reg10= 0;reg11= 0;reg12= 0;reg13= 0;
    end
    //En == 1在时钟上升沿打入数据
    else if(En == 1) begin
        reg0= D0;reg1= D1;reg2= D2;
        reg3= D3;reg4= D4;reg5= D5;
        reg7= D7;reg8= D8;reg9= D9;
        reg10= D10;reg11= D11;reg12= D12;reg13= D13;
    end
    //En == 0 不变即可
end
endmodule