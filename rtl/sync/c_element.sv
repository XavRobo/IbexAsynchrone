module c_element(
input  logic rst,
input  logic a,
input  logic b,
output logic c
);

reg yp;
assign yp = y;

always_comb begin
  y = (a & b) | (yp & (a | b));
  c = y & ~rst;
end


endmodule
