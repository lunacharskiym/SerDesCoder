module scrambler (

    input   logic   clk, rst_n, start,
    input   logic   in,
  
    output  logic   done,
    output  logic   out

);

logic [0 : 11] shift_reg = 12'h89F;
logic tmp_xor = 'b0;
logic [4 : 0] count;
logic shifting;

always_ff @(posedge clk) begin
    done <= 'b1;
    if (!rst_n) begin
        shift_reg = 12'h89F;
        tmp_xor = 'b0;
        count = 'b0;
    end
    else if (start) begin
        shifting <= 'b1;
        done <= 'b0;
    end
    else if (shifting) begin
        tmp_xor <= shift_reg[1] ^ shift_reg[8] ^ shift_reg[11];
        shift_reg <= shift_reg >> 1;
        shift_reg[0] <= tmp_xor;
        count <= count + 1;
        if (count == 5'd31) begin
           done <= 'b1; 
           shifting = 'b0;
        end
    end
end

assign out = (shifting) ? tmp_xor ^ in : 'b0;

endmodule
