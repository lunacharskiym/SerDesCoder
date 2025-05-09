module scrdescr(

    input   logic   clk, rst_n, start,
    input   logic   in,
   
    output  logic   out

);

logic out_scr;

scrambler scr_inst (
    
    .clk(clk),
    .start(start),
    .in(in),
    .out(out_scr)

);

descrambler descr_inst (
    
    .clk(clk),
    .start(start),
    .in(out_scr),
    .out(out)

);

endmodule
