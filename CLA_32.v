module CLA_32(X,Y,Cin,S,Cout);
    input [31:0] X, Y;
    input Cin;
    output[31:0]S;
    output Cout;
    assign Cout = 0;
    assign S = X+Y+Cin;
endmodule