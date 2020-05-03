module tbench_asmodee;

timeunit  1ns;
timeprecision 1ns;

logic rst;
logic start;
logic boot;

asmodee asm(
	.rst_i(rst), //vide les mullers
	.start_i(start), //premiere requete pour lancer la boucle
	.boot_i(boot) //charge boot addr
);

initial begin
	// Sequence de boot
	rst = 1; start = 0; boot = 0;
	#10 boot  = 1;
	#5  boot  = 0; rst = 0;
	#5  start = 1;
	#1  start = 0;
	//boot end	
end

endmodule
