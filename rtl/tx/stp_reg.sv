module stp_reg (
   
    input   logic   clk, rst_n, start,
    output  logic   [31 : 0]    data,

    input   logic   in,
    output  logic   done

);

logic [31 : 0] shift_reg;
logic [4 : 0] shift_cnt;
logic receiving;

always_ff @(posedge clk) begin
    done = 'b0;
    if (!rst_n) begin
        shift_cnt <= 'b0;
        shift_reg <= 'b0;
        receiving <= 'b0;
    end
    else if (start) begin
        receiving <= 'b1;
    end
    else if (receiving) begin 
//        shift_reg <= {shift_reg[31:1], in};
        shift_reg[0] <= in;
        shift_reg <= shift_reg << 1;
        shift_cnt <= shift_cnt + 1;
        if (shift_cnt == 5'd31) begin
            done <= 'b1;
            receiving = 'b0;
        end
    end
end 

endmodule
