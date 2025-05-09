module manchester_loop(
    
    input logic clk, data_in, 
    output logic data_out

);

logic data_out_enc;

manchester_encoder me_inst (
    .clk(clk),
    .data_in(data_in),
    .data_out(data_out_enc)
);


manchester_decoder md_inst (
    .clk(clk),
    .data_in(data_out_enc),
    .data_out(data_out)
);


endmodule
