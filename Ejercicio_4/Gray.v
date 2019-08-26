module gray(x,y);
    //Outputs, inputs and wires
    input [3:0] x;
    output [3:0] y;
    wire not_1,not_2,not_3,not_4;
    wire conet_11,conet_12,conet_21,conet_22,conet_31,conet_32;

    not(not_1,x[0]);
    not(not_2,x[1]);
    not(not_3,x[2]);
    not(not_4,x[3]);
    //Bit LSB
    and(conet_11,x[0],not_2);
    and(conet_12,not_1,x[1]);
    or(y[0],conet_11,conet_12);

    and(conet_21,x[1],not_3);
    and(conet_22,not_2,x[2]);
    or(y[1],conet_21,conet_22);

    and(conet_31,x[2],not_4);
    and(conet_32,not_3,x[3]);
    or(y[2],conet_31,conet_32);
    //Bit MSB
    assign y[3]=x[3];
    //End
endmodule

