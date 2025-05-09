module tb_manchester_loop();

logic clk, data_in, data_out;

logic[32 : 0] data = 32'hDEADBEEF;

manchester_loop dut (
    .clk(clk),
    .data_in(data_in),
    .data_out(data_out)
);

initial begin
    $dumpfile("manchester.vcd");
    $dumpvars(0, tb_manchester_loop);
end

initial begin
    clk = 'b0;
    data_in = 'b0;
end

always #10 clk = ~clk;

initial begin
    int i;
    for(i = 0; i < 32; i++) begin
        #10 data_in = data[i];
    end

    $finish();
end

endmodule
