module tb_tx_top();

logic clk, rst_n, Cin;

logic [31 : 0] Din;
logic [31 : 0] Dout;

tx_top tx_top_dut (
    
    .clk(clk),
    .rst_n(rst_n),
    .Cin(Cin),
    .Din(Din),
    .Dout(Dout)

);

initial begin
    $dumpfile("tx_top.vcd");
    $dumpvars(0, tb_tx_top);
end

initial begin
    clk = 'b0;
    rst_n = 'b1;
    Cin = 'b0;
    #10 rst_n = 'b0;
    #20 rst_n = 'b1;
    Din = 32'hAEF1EF36; 
    #10 Cin = 'b1;
    #20 Cin = 'b0;
end

always #10 clk = ~clk;

initial #3000 $finish();

endmodule
