/*
*
* Serializer 32 to 4 bytes module
*
*/

module serializer (

    input   logic               clk,
    input   logic               rst_n,
    input   logic               Cin,
    input   logic   [31 : 0]    Din,

    output  logic   [7 : 0]     Dout,
    output  logic               Done

);

logic [31 : 0] tmp;
logic [1 : 0] cnt;
logic sending;

always_ff @(posedge clk) begin

    if (!rst_n) begin
        tmp <= 'b0;
        cnt <= 'b0;
        Done <= 'b0;
        sending <= 'b0;

    end else begin 
    if (cnt == 'b0) Done = 'b0;
    if (Cin) begin 
        tmp <= Din;
        cnt <= 'b0;
        sending <= 'b1;
        Done = 'b0;
    end

    else if (sending) begin 
        tmp <= (tmp << 8);
        cnt <= cnt + 'b1;

        if (cnt == 'b11) begin
            Done = 'b1;
            sending = 'b0;
            end
        end
    end
end


assign Dout = tmp[31 : 24];


endmodule
