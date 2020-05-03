//Test simpliste d'une porte de Muller avec rst

module tbench;

timeunit  1ns;
timeprecision 1ns;

logic a = 1'b0;
logic b = 1'b0;
logic c;
logic rst;

c_element test(
 .rst(rst),
 .a(a),
 .b(b),
 .c(c)
);

  initial begin
	    #5 b = 1; rst = 0;
	    #5 b = 0;
	    #5 a = 1;
	    #5 b = 1;
	    #5 a = 0;
	    #(5) a = 1;
	    #5 b = 0;
	    #5 a = 0;

   	    #5 b = 1; rst = 1;
	    #5 b = 0;
	    #5 a = 1;
	    #5 b = 1;
	    #5 a = 0;
	    #(5) a = 1;
	    #5 b = 0;
	    #5 a = 0;
    end
    


endmodule
