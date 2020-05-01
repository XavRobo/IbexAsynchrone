module alu (
  input alu_pkg::alu_op operator, //TODO: modifier avec le package
  input logic [31:0] op_a,
  input logic [31:0] op_b,
  output logic [31:0] result
  );

  import alu_pkg::*;

  // ADD + SUB

  logic [31:0] add_result;          //resultat
  logic [32:0] add_a, add_b;        //operandes preparees (jsp pourquoi il faut faire ça)
  logic b_neg;                   //soustraction de b

  assign add_a = {op_a,1'b1};
  assign op_b_neg = (operator == SUB);      //on enleve b ?
  assign add_b = {op_a,1'b0}^{33{b_neg}}

  assign add_result = ($unsigned(add_a) + $unsigned(add_b))[32:1]

  //shift

  logic [31:0] shift_right_result;
  logic [31:0] shift_left_result;
  logic [31:0] shift_result;
  logic [31:0] shift_a;          //operande inversee ou non
  logic [32:0] shift_a_ext;      //operande a etendue pour shift arithmetique
  logic a_rev;                   //on inverse a si on shift vers la gauche
  logic arithmetic;              //shift est arithmetique ?
  logic [31:0] op_a_rev;         //a inversé

  for (genvar k = 0; k < 32; k++) begin : //calcul de l'inverse
    assign op_a_rev[k] = op_a[31-k];
  end

  assign a_rev = (operator == SL)   //on inverse a ?
  assign arithmetic = (operator == SRA) //arithmetique ?
  assign shift_a = a_rev ? op_a_rev : op_a;
  assign shift_a_ext = {arithmetic & shift_a[31],shift_a} //on duplique le msb de a si arithmetique

  assign shift_right_result = ($unsigned($signed(shift_a_ext) >>> op_b[4:0]))[31:0];

  for (genvar j = 0; j < 32; j++) begin : //calcul de l'inverse pour les LS
    assign shift_left_result[j] = shift_right_result[31-j];
  end

  assign shift_result = a_rev ? shift_left_result : shift_right_result;

  //comparaisons


  logic cmp_result;
  logic equal;
  logic greater_equal;
  logic cmp_signed;

  always_comb begin
    cmp_signed = 1'b0;
    unique case (operator)
    ALU_GE,
    ALU_LT,
    ALU_SLT: begin
      cmp_signed = 1'b1;
      end

      default:;
    endcase
  end

  assign equal = (add_result == 32'b0);

  always_comb begin
    if ((op_a[31] ^ op_b[31]) == 1'b0) begin
      greater_equal = (add_result[31] == 1'b0);
    end else begin
      greater_equal = op_a[31] ^ (cmp_signed);
    end
  end

always_comb begin
  cmp_result = is_equal;

  unique case (operator)
    EQ:            cmp_result =  equal;
    NE:            cmp_result = ~equal;
    GE,  GEU:  cmp_result = greater_equal;
    LT,  LTU,
    SLT, SLTU: cmp_result = ~greater_equal;

    default:;
  endcase
end

//resultat

always_comb begin
    result   = '0;

    unique case (operator)
      AND:  result = op_a & op_b;
      OR:   result = op_a | op_b;
      XOR:  result = op_a ^ op_b;

      ADD, SUB: result = add_result;

      SLL,
      SRL, SRA: result = shift_result;

      EQ,   NE,
      GE,   GEU,
      LT,   LTU,
      SLT,  SLTU: result = {31'h0,cmp_result};

      default:;
    endcase
  end

endmodule
