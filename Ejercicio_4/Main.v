module Main;
    //Entrada y salida
    reg [3:0] x;
    wire [3:0] y;

    reg dummy;
    gray Gray(x,y);
    initial begin
        //Tomo la entrada y se guarda en x[0] el primero and the last in x[3]
        dummy = $value$plusargs("x=%b", x);
        //Show result
        #5;
        $display("Normal: %b", x);
        $display("Gray: %b", y);
    end
endmodule