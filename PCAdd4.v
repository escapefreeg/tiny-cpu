module PCAdd4(PC_o,PCadd4);
//当前pc值
input [31:0] PC_o;
//下一个pc值(pc+4)
output [31:0] PCadd4;

assign PCadd4 = PC_o + 4;


//pc值可能越界，不需要考虑
endmodule