//////////////////////////////////////////////////////////////////////
//    Implementación en Verilog de un Encoder de 4 entradas         //
//                                                                  //
//               A,B,C,D: entradas del Encoder                      //
//                                                                  //
//               S_0,S_1,E: salidas del Encoder                     //
//                                                                  //
//////////////////////////////////////////////////////////////////////

module Codificador(S_1,S_0,E);

    reg A,B,C,D;   //entradas a codificar
    reg dummy;
    output reg S_0,S_1;  //salida codificada
    output reg E;        //salida de Error

    initial begin
        dummy = $value$plusargs("A=%b", A);
        dummy = $value$plusargs("B=%b", B);
        dummy = $value$plusargs("C=%b", C);
        dummy = $value$plusargs("D=%b", D);
        E=1;   //Pongo error en 1
    end

    initial begin
        $display ("Entradas: A=%b B=%b C=%b D=%b", A, B, C, D);

    end
    //Si hay un cambio en las entradas chequeo como afecta al circuito
    //Aclaración: Como solo me interesan 4 entradas de las 16 posibles, busco esos valores en particular
    // de no encontrarlos implica que el valor de las entradas no se corresponde con un valor codificable
    // y aviso de un error

    always @(A or B or C or D) begin 

        if (A == 1) begin
                if(B == 0) begin
                        if(C == 0) begin   
                                if(D == 0) begin
                                    S_1 = 0;
                                    S_0 = 0;
                                    E=0;
                                    //Imprimo en pantalla la salida codificada
                                    $display ("Para una entrada con A=%b B=%b C=%b D=%b, la salida codifica es %b%b \n", A, B, C, D, S_1, S_0);
                                    $finish;
                                end
                        end

                end
        end

        if (A == 0) begin
            if (B==1) 
                begin
                    if(C==0)
                        begin   
                            if(D==0)
                                begin
                                S_1=0;
                                S_0=1;
                                E=0;
                                //Imprimo en pantalla la salida codificada
                                $display ("Para una entrada con A=%b B=%b C=%b D=%b, la salida codifica es %b%b \n", A, B, C, D, S_1, S_0);
                                $finish;
                                end
                        end

                end
        end

        if (A==0)        
            begin
                if(B==0) 
                    begin
                        if(C==1)
                            begin   
                                if(D==0)
                                    begin
                                        S_1=1;
                                        S_0=0;
                                        E=0;
                                        //Imprimo en pantalla la salida codificada
                                        $display ("Para una entrada con A=%b B=%b C=%b D=%b, la salida codifica es %b%b \n", A, B, C, D, S_1, S_0);
                                        $finish;
                                end
                            end

                    end
            end
        if (A==0)        
            begin
                if(B==0) 
                    begin
                        if(C==0)
                            begin   
                                if(D==1)
                                    begin
                                        S_1=1;
                                        S_0=1;
                                        E=0;
                                        //Imprimo en pantalla la salida codificada
                                        $display ("Para una entrada con A=%b B=%b C=%b D=%b, la salida codifica es %b%b \n", A, B, C, D, S_1, S_0);
                                        $finish;
                                    end
                            end

                    end
            end
        if(E==1)
            begin
            $display ("ERROR, la entrada A=%b B=%b C=%b D=%b no es válida para ser codificada \n", A, B, C, D, S_0, S_1);
            $finish;
            end
    end


endmodule


