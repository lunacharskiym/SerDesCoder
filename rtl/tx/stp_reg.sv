module stp_reg (
   
    input   logic   clk, rst_n, start,
    output  logic   [31 : 0]    data,

    input   logic   in,
    output  logic   done

);

logic [31 : 0] shift_reg;
logic [4 : 0] shift_cnt = 'b0;

always_ff @(posedge clk) begin
    shift_reg <= {shift_reg[31:1], in};
    shift_reg <= shift_reg << 1;
    shift_cnt <= shift_cnt + 1;

    if (shift_cnt == 'b1) begin
        done <= 'b1;
    end
end 

endmodule
