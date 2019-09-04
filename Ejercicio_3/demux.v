//////////////////////////////////////////////////////////////////////
//    Implementación en Verilog de un Demultiplexor de 4 salidas    //
//                                                                  //
//          S_0, S_1: las líneas de selección                       //
//                                                                  //
//          I: información a transportar (entrada)                  //
//                                                                  //
//          A,B,C,D: salidas del multiplexor                        //
//                                                                  //
//////////////////////////////////////////////////////////////////////

module Demultiplexor(A,B,C,D);
    reg I;  //entrada de información
    reg S_0,S_1; //líneas de selección
    output reg A,B,C,D;  //salidas
    reg dummy;

initial begin
    dummy = $value$plusargs("I=%b", I);
    dummy = $value$plusargs("S_1=%b", S_1);
    dummy = $value$plusargs("S_0=%b", S_0);
end

    initial begin
        $display ("Entradas: I=%b, S_1=%b S_0=%b", I, S_1, S_0);
    end

    //Si hay un cambio en la entrada o en las líneas de selección chequeo como afecta al circuito
    always @(I or S_1 or S_0) begin 
        if(S_1==0) 
        begin
            if(S_0==0) //selecciono la salida A
                begin 
                    A=I;
                    //Imprimo en pantalla los nuevos valores de mis variables (entrada, líneas de selección y salidas)
                    $display ("Con una entrada de %b, con las líneas de selección en S_1=%b S_0=%b, tengo las siguientes salidas A=%b B=%b C=%b D=%b\n", I, S_1, S_0, A, B, C, D);
                    $finish;
                    end
            else        //selecciono la salida B
                begin 
                    B=I; 
                    //Imprimo en pantalla los nuevos valores de mis variables (entrada, líneas de selección y salidas)
                    $display ("Con una entrada de %b, con las líneas de selección en S_1=%b S_0=%b, tengo las siguientes salidas A=%b B=%b C=%b D=%b\n", I, S_1, S_0, A, B, C, D);
                    $finish;    
                end
            end
        else        //S_1==1
            begin
                if(S_0==0) //selecciono la salida C
                    begin 
                    C=I;
                    //Imprimo en pantalla los nuevos valores de mis variables (entrada, líneas de selección y salidas)
                    $display ("Con una entrada de %b, con las líneas de selección en S_1=%b S_0=%b, tengo las siguientes salidas A=%b B=%b C=%b D=%b\n", I, S_1, S_0, A, B, C, D);
                    $finish;
                    end
            else        //selecciono la salida D
                begin      
                    D=I;
                    //Imprimo en pantalla los nuevos valores de mis variables (entrada, líneas de selección y salidas)
                    $display ("Con una entrada de %b, con las líneas de selección en S_1=%b S_0=%b, tengo las siguientes salidas A=%b B=%b C=%b D=%b\n", I, S_1, S_0, A, B, C, D);
                    $finish;
                end
        end

    end

endmodule



