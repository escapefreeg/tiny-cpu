module ALU(X,Y,Aluc,R,Z);//ALU������Ԫ
input [31:0]X,Y;
input [1:0]Aluc;
output reg[31:0]R;
output Z;
assign Z=~|R;

always @(*) begin
    case(Aluc)
        //�ӷ�
        2'b00:R = X+Y;
        //����
        2'b01:R = X-Y;
        //�����
        2'b10:R = X&Y;
        //�����
        2'b11:R = X|Y;
    endcase
end
endmodule