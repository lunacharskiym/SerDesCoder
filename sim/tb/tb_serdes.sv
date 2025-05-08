`timescale 1ns/1ps

module tb_serdes();

logic clk;
logic rst_n;
logic Cin;
logic [31 : 0] Din;

logic [31 : 0] Dout;
logic Done;

serdes dut (
    
    .clk(clk),
    .rst_n(rst_n),
    .Cin(Cin),
    .Din(Din),

    .Dout(Dout),
    .Done(Done)
 
);


initial begin
    clk = 'b0;
    rst_n = 'b0;
    Cin = 'b0;
end

always begin
    #10 clk = ~clk;
end

initial begin
    
    $display("Starting test...");
    Din = 32'hDEADBEEF;

    #20;
    rst_n = ~rst_n;
   
    #10 Cin = 'b1;
    #10 Cin = 'b0;

    #500;

    $finish;
end

initial begin
    $dumpfile("serdes.vcd");
    $dumpvars(0, tb_serdes);
end

endmodule
