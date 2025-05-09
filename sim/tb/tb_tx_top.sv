module tb_tx_top();

logic clk, rst_n, start;

logic [25 : 0] Din;
logic Dout;

tx_top tx_top_dut (
    
    .clk(clk),
    .rst_n(rst_n),
    .start(start),
    .Din(Din),
    .Dout(Dout)

);

initial begin
    $dumpfile("tx_top.vcd");
    $dumpvars(0, tb_tx_top);
end

initial begin
    clk = 'b0;
    start = 'b0;
    Din = 26'b0011_1100_0100_0100_0101_1111_10;
    #10 start = 'b1;
    #20 start = 'b0;
end

always #10 clk = ~clk;

initial #2000 $finish();

endmodule
