module controler #(
	parameter DELAY = 5
) (
	input  logic rst_i,

	input  logic req_in_i,
	input  logic ack_out_i,

	output logic req_out_o,
	output logic ack_in_o	
);

timeunit  1ns;
timeprecision 1ns;

	c_element muller(
	 .rst(rst_i),
	 .a(req_in_i),
	 .b(~ack_out_i),
	 .c(ack_in_o)
	);

	assign #DELAY req_out_o =  ack_in_o;

endmodule
