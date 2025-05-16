module tx_top(

    input   logic   clk, rst_n, Cin,
    input   logic   [31 : 0] Din,

    output  logic   [31 : 0] Dout

);

// serializer
logic   [7 : 0] Dout_ser;
logic           Done_ser;

serializer ser_inst (
    
    .clk(clk),
    .rst_n(rst_n),
    .Cin(Cin),
    .Din(Din),

    .Dout(Dout_ser),
    .Done(Done_ser)
 
);

// scrambler
logic [7 : 0] done_scr;
logic [7 : 0] done_dscr;
logic [7 : 0] out_scr;
logic [7 : 0] data_out_me;
logic [7 : 0] data_out_md;
logic [7 : 0] out_dscr;

genvar i;
generate
    for (i = 0; i < 8; i++) begin: stage 
    scrambler scr_inst (
    
        .clk(clk),
        .in(Dout_ser[i]),
        .rst_n(rst_n),
        .start(Cin),
        .done(done_scr[i]),
        .out(out_scr[i])

    );
    // manchester

    manchester_encoder me_inst (

        .clk(clk),
        .data_in(out_scr[i]),
        .data_out(data_out_me[i])

    );
   
    manchester_decoder md_inst (

        .clk(clk),
        .data_in(data_out_me[i]),
        .data_out(data_out_md[i])

    );

    descrambler dscr_inst (
    
        .clk(clk),
        .in(data_out_md[i]),
        .rst_n(rst_n),
        .start(Cin),
        .out(out_dscr[i]),
        .done(done_dscr[i])

    );
    
    end

endgenerate

deserializer des_inst (
    
    .clk(clk),
    .rst_n(rst_n),
    .Cin(Cin),
    .Din(out_dscr),

    .Dout(Dout),
    .Done(Done)
 
);


//ecc_enc #(
//  .K(4),
//  .P0_LSB(1)
//)
// ecc_inst (
//    .d_i  ( Din ),      //information bit vector input
//    .q_o  ( enc_data ),      //encoded data word output
//
//    .p_o  (       ),      //parity vector output
//    .p0_o (       ));     //extended parity bit
//


endmodule
