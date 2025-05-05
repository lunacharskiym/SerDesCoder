`timescale 1ns/1ps

module tb_serializer();

logic clk;
logic rst_n;
logic Cin;
logic [31 : 0] Din;

logic [7 : 0] Dout;
logic Done;

serializer dut (
    
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

    #300;

    $finish;
end

initial begin
    $dumpfile("serializer.vcd");
    $dumpvars(0, tb_serializer);
end

endmodule
