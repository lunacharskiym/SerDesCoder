module pts_reg (
   
    input   logic   clk, rst_n, start,
    input   logic   [31 : 0]    data,

    output  logic   out,
    output  logic   done

);

logic [31 : 0] shift_reg;
logic [4 : 0] shift_cnt;
logic shifting = 'b0;

always_ff @(posedge clk) begin
    done = 'b0;
    if (start) begin
        shift_reg <= data; 
        shift_cnt <= 'b0;
        shifting <= 'b1;
    end
    else if (shifting) begin
        shift_reg <= shift_reg << 1;
        shift_cnt <= shift_cnt + 1'b1;

        if (shift_cnt == 5'd31) begin
            done <= 'b1;
            shifting = 'b0;
        end
    end
end 

assign out = shift_reg[31];

endmodule
