module ej5_test();
    reg [3:0]x;
	reg [3:0]y;

	output[3:0]bcd_1;
	output [3:0]bcd_2;
	output [7:0]product;

	BCD_multiplier dummy(x,y,product,bcd_1,bcd_2);
	integer i,j;
	initial begin	
		$display("***TEST***");
		$display("All posible results");
		for (i = 0;i < 10;i++) begin
			for (j = 0;j < 10;j++) begin
				x = i;
				y = j;
				#1 $display("(%d*%d) = %d = %b (Binary) = [%d%d] (BCD)", x,y,product,product, bcd_1,bcd_2);
			end
		end
	end	
endmodule


	