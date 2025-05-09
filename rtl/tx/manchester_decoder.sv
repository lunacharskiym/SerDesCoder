module manchester_decoder (

    input logic data_in,
    input logic clk,

    output logic data_out

);

assign data_out = data_in ^ clk;

endmodule
