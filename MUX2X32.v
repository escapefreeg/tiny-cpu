module MUX2X32(A0,A1,S,Y);
input [31:0] A0,A1;
input S;
output reg [31:0] Y;

always @(*) begin
    case (S)
        0: Y = A0;
        1: Y = A1;
        //��������������ˣ����Բ���Ҫ����default
    endcase
end
endmodule