module descrambler (

    input   logic   clk, rst_n, start,
    input   logic   in,
   
    output  logic   out

);

logic [0 : 11] shift_reg = 12'h89F;
logic tmp_xor = 'b0;

always_ff @(posedge clk) begin

        tmp_xor <= shift_reg[1] ^ shift_reg[8] ^ shift_reg[11];
        shift_reg <= shift_reg >> 1;
        shift_reg[0] <= tmp_xor;

end

assign out = tmp_xor ^ in;

endmodule
