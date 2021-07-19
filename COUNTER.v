module COUNTER(Clk,Clrn,rnum);

input Clk,Clrn;
output reg[5:0]rnum;
reg [5:0]num;


initial begin
    num = 6'b000001;
end

//上升沿读出值
always @(posedge Clk) begin
    rnum = num;
end
//下降沿修改值
always @(negedge Clk) begin
    if (Clrn == 1) begin
        num = num + 1;
    end
end
endmodule
