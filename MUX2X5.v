module MUX2X5(A0,A1,S,Y);
input [4:0] A0,A1;
input S;
output reg [4:0] Y;
always @(*) begin
    case (S)
        0: Y = A0;
        1: Y = A1;
        //��������������ˣ����Բ���Ҫ����default
    endcase
end
endmodule
