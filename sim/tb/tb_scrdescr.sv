module tb_scrdescr();

logic clk;
logic start;
logic [31 : 0] data_in = 32'hDEADBEEF;
logic out;
logic in;

scrdescr dut (

    .clk(clk),
    .start(start),
    .in(in),
    .out(out)
);

initial begin
    $dumpfile("srcdescr.vcd");
    $dumpvars(0, tb_scrdescr);
end

initial begin
    clk = 'b0;
    start = 'b0;

    #10 start = 'b1;
    #10 start = 'b0;
end

always #10 clk = ~clk;

initial begin
    integer i;
    for(i = 0; i < 32; i++) begin
        #20 in = data_in[31 - i];
    end
end

initial #2000 $stop();

endmodule
