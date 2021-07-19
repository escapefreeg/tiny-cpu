module MAIN_Sim;
reg Clk;
reg En;
reg Clrn;
wire Instnum;

MAIN uut(
.Clk(Clk),
.En(En),
.Clrn(Clrn),
.Instnum(Instnum)
);
always #20 Clk=~Clk;

initial begin
#0 Clk=0;Clrn=0;En=1;
#50 Clrn = 1;
#700 $finish;
end
endmodule