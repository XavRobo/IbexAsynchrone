//Tbench de la totalité du processeur
//fonctionne avec la version de la memoire t_insmem_test.sv
//ADDI r0, imm -> r1	 r0 = 0
//ADDI r0, imm -> r2 	 r0 = 0
//XOR  r1, r2  -> r3 

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
