module PCAdd4(PC_o,PCadd4);
//��ǰpcֵ
input [31:0] PC_o;
//��һ��pcֵ(pc+4)
output [31:0] PCadd4;

assign PCadd4 = PC_o + 4;


//pcֵ����Խ�磬����Ҫ����
endmodule