module half_adder (x, y, sum, carry_out);
    input x, y;
    output sum, carry_out;
    and(carry_out, x, y);
    xor(sum, x, y);

endmodule

module full_adder (x, y, carry_in, sum, carry_out);
    // El full adder se puede armar con dos half adders y un or (ver circuito logico)
    input x,y,carry_in;
    output sum, carry_out, aux_carry_1, aux_carry_2; 
    wire aux_sum;

    half_adder First_hf(x,y, aux_sum, aux_carry_1);
    half_adder Second_hf(aux_sum, carry_in, sum, aux_carry_2);
    or(carry_out, aux_carry_1, aux_carry_2);
endmodule

module BCD_multiplier(x,y,product,bcd_1,bcd_2);
    
    // La funcion de este modulo es multiplicar dos numeros de 4 bits, devolver dicha multiplicacion en 8btis y descomponerla en dos numeros de 4bits para poder representarla en BCD

    // Inputs
    input [3:0] x; // Entrada de 4 bits 
    input [3:0] y; // Enrada de 4 bits

    //Outputs
    output [7:0] product; // Producto de a y b en 8 bits
    output [3:0] bcd_1; 
    output [3:0] bcd_2; 

    //Extras
    reg [7:0] bcd; // BCD de 8bits
    reg [15:0] temp;
    wire [20:0] aux;
    wire [6:0] out_carry;
    wire [3:0] aux_carry;
    wire [3:0] aux_sum;


    // Comienzo del multiplicador de 4bits, ver circuito logico
 
    // P[0]
    and(product[0], x[0], y[0]); 

    // P[1]
    and(aux[0], x[0], y[1]); 
    and(aux[1], x[1], y[0]); 
    half_adder ha0(aux[0], aux[1], product[1], out_carry[0]);
    
    //P[2]
    and(aux[2], x[0], y[2]); 
    and(aux[3], x[1], y[1]); 
    and(aux[4], x[2], y[0]); 

    full_adder fa1(aux[2], aux[3], out_carry[0], aux_sum[0], aux_carry[0]); 
    half_adder ha1(aux[4], aux_sum[0], product[2], out_carry[1]); 

    //P[3]
    and(aux[5], x[0], y[3]); 
    and(aux[6], x[1], y[2]); 
    and(aux[7], x[2], y[1]); 
    and(aux[8], x[3], y[0]); 

    or(aux[9],aux[5], aux[6]);
    or(aux[10],aux[7], aux[8]);

    full_adder fa3(aux[9], aux[10],aux_carry[0], aux_sum[1], aux_carry[1]); 
    half_adder ha2(aux_sum[1], out_carry[1], product[3], out_carry[2]); 

    //P[4]
    and(aux[11], x[1], y[3]); 
    and(aux[12], x[2], y[2]); 
    and(aux[13], x[3], y[1]); 
    or(aux[14], aux[11], aux[12],aux[13]);

    half_adder ha3(aux[14], aux_carry[1], aux_sum[2], aux_carry[2]); 
    half_adder ha4(aux_sum[2], out_carry[2], product[4], out_carry[3]); 

    //P[5]
    and(aux[15], x[2], y[3]); 
    and(aux[16], x[3], y[2]); 
    or(aux[17], aux[15], aux[16]);

    half_adder ha5(aux[17], aux_carry[2], aux_sum[3], aux_carry[3]); 
    half_adder ha6(aux_sum[3], out_carry[3], product[5], out_carry[4]); 

    //P[6]
    and(aux[18], x[3], y[3]); 
    or(product[6], out_carry[4], aux[18], aux_carry[3]);
 
    //P[7]
    assign product[7] = 0;

    // Al tener el producto de 8bits, se pasa al algoritmo de Double Dabble para pasar de binario a BCD
    // Comienzo del algoritmo Double Dabble

    integer i; //Para el contador.  
    always @(product)
        begin
            bcd = 0; // Se inicializa en 0
            temp = {bcd[7:0], product}; //Se concatena el producto con el BCD de 8 bits
            for (i = 0; i < 8; i++) // Son 8 iteraciones ya que el producto es de 8 bits.
            begin 
                // Evaluo si las dos 'partes' del BCD son mayores a 4
                if(temp[11:8] > 4) 
                    temp[11:8] = temp[11:8] + 3; // Le sumo 3 
                    
                if(temp[15:12] > 4)
                    temp[15:12] = temp[15:12] + 3; // Le sumo 3
                temp = temp << 1; // Shift para la izquierda            
            end

        bcd[7:0] = temp[15:8];
        end    

    // Al tener el BCD de 8 bits completo armo las dos 'partes' bcd_1, bcd_2' para poder mostrarlo
    assign bcd_1[3] = bcd[7];
    assign bcd_1[2] = bcd[6];
    assign bcd_1[1] = bcd[5];
    assign bcd_1[0] = bcd[4];

    assign bcd_2[3] = bcd[3];
    assign bcd_2[2] = bcd[2];
    assign bcd_2[1] = bcd[1];
    assign bcd_2[0] = bcd[0];
         

endmodule



 

