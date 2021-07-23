module MUX4X32 (A0, A1, A2, A3, S, Y);
input [31:0] A0, A1, A2, A3;
input [1:0] S;
output reg [31:0] Y;

always @(*) begin
    case (S)
        2'b00: Y = A0;
        2'b01: Y = A1;
        2'b10: Y = A2;
        2'b11: Y = A3;
        //所有情况都考虑了，所以不需要加入default
    endcase
end

endmodule