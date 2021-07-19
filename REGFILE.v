module REGFILE(Ra,Rb,D,Wr,We,Clk,Clrn,Qa,Qb);
input [4:0]Ra,Rb,Wr;
input [31:0]D;
input We,Clk,Clrn;
output [31:0]Qa,Qb;

reg [31:0]regs[0:31];
integer i;
initial begin
    for (i = 0; i<32; i=i+1) begin
        regs[i] = 32'b0;
    end
end
//Êä³öÊý¾Ý
assign Qa = regs[Ra];
assign Qb = regs[Rb];

always @(negedge Clk) begin
    if (Clrn == 0) begin
        for (i = 0; i<32; i=i+1) begin
        regs[i] = 32'b0;
        end
    end
    else if(We == 1)begin
        regs[Wr] = D;
    end
end

endmodule