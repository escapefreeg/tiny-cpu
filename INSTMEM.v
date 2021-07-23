module INSTMEM(Addr,Inst);//指令存储器
input[31:0]Addr;
output[31:0]Inst;
wire[31:0]Rom[31:0];//load store
assign Rom[5'h00]=32'h20010008;//addi $1,$0,8 $1=8 001000 00000 00001 0000000000001000
assign Rom[5'h01]=32'h3402000C;//ori $2,$0,12 $2=12
assign Rom[5'h02]=32'h00221820;//add $3,$1,$2 $3=20//数据冒险
assign Rom[5'h03]=32'h00622022;//sub $4,$3,$2 $4=8//0000,00 00,011 0,0010, 0010,0 000,00 10,0010
assign Rom[5'h04]=32'h00644824;//and $5,$3,$4 $5=0//0000,00 00,011 0,0100, 0010,1 000,00 10,0100
assign Rom[5'h05]=32'h00223025;//or $6,$1,$2  $6=12
assign Rom[5'h06]=32'h14220006;//bne $1,$2,6//到13 0001,01 00,001 0,0010 0000,0 000,00 00,0110
assign Rom[5'h07]=32'h00221820;//add $3,$1,$2 $3=20
assign Rom[5'h08]=32'h00412022;//sub $4,$2,$1 $4=4
assign Rom[5'h09]=32'h10220002;//beq $1,$2,2
assign Rom[5'h0A]=32'h00222824;//and $5,$1,$2
assign Rom[5'h0B]=32'hXXXXXXXX;
assign Rom[5'h0C]=32'h10220006;//beq $1,$2,6 //0001,00 00,001 0,0010 0000,0 000,00 00,0110
assign Rom[5'h0D]=32'hAD02000C;//sw $2 12($8) memory[$8+10]=12//1010,11 01,000 0,0010 0000,0 000,00 00,1100
assign Rom[5'h0E]=32'h8D04000C;//lw $4 12($8) $4=12//1000,11 01,000 0,0100 0000,0 000,00 00,1100
assign Rom[5'h0F]=32'h30450004;//andi $5,$2,4//0011,00 00,010 0,0101, 0000,0 000,00 00,0100
assign Rom[5'h10]=32'h14460002;//bne $2,$6,2 0001,01 00,010 0,0110 0000,0 000,00 00,0010
assign Rom[5'h11]=32'h14460002;//bne $2,$6,2
assign Rom[5'h12]=32'h14460002;//bne $2,$6,2
assign Rom[5'h13]=32'h14460002;//bne $2,$6,2
assign Rom[5'h14]=32'h14460002;//bne $2,$6,2
assign Rom[5'h15]=32'hXXXXXXXX;
assign Rom[5'h16]=32'hXXXXXXXX;
assign Rom[5'h17]=32'hXXXXXXXX;
assign Rom[5'h18]=32'hXXXXXXXX;
assign Rom[5'h19]=32'hXXXXXXXX;
assign Rom[5'h1A]=32'hXXXXXXXX;
assign Rom[5'h1B]=32'hXXXXXXXX;
assign Rom[5'h1C]=32'hXXXXXXXX;
assign Rom[5'h1D]=32'hXXXXXXXX;
assign Rom[5'h1E]=32'hXXXXXXXX;
assign Rom[5'h1F]=32'hXXXXXXXX;
assign Inst=Rom[Addr[6:2]];
endmodule