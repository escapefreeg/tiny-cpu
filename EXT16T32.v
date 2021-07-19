module EXT16T32 (X, Se, Y);
input [15:0] X;
input Se;
output reg [31:0] Y;

//wire [15:0] e = {16{X[15]}};

always @(*) begin
    if (Se == 0) begin
        Y={16'b0,X};
    end
    else begin
        Y={{16{X[15]}},X};
    end
end
endmodule