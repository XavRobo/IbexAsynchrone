module c_element(
input  logic rst,
input  logic a,
input  logic b,
output logic c
);

logic yp,y;
assign yp = c & ~rst;

always_comb begin
  y = (a & b) | (yp & (a | b));
  c = y & ~rst;
end


endmodule
