module tbench;

timeunit  1ns;
timeprecision 1ns;

bit a = 1'b0;
bit b = 1'b0;
bit c;

c_element test(
 .a(a),
 .b(b),
 .c(c)
);

  initial begin
	    #5 b = 1;
	    #5 b = 0;
	    #5 a = 1;
	    #5 b = 1;
	    #5 a = 0;
	    #(5) a = 1;
	    #5 b = 0;
	    #5 a = 0;
    end
    


endmodule
