module c_element(
input a,
input b,
output reg c
);

reg s;
assign s = c;
always @ ( * ) begin
  c = (a && b) | (s && (a | b));
end
endmodule
