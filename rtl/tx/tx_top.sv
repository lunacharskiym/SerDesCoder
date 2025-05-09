module tx_top(

    input   logic   clk, rst_n, start,
    input   logic   [25 : 0] Din,

    output  logic   Dout

);

// hamming

logic [31 : 0] enc_data; // Hamming encoded data
logic s_hamming; // Hamming serial output
logic out_scr;
logic [31 : 0] scr_data;
logic scr_done;
logic [31 : 0] Dout_serdes;
logic Done_serdes;
logic out_serdes;

ecc_enc #(
  .K(26),
  .P0_LSB(1)
)
 ecc_inst (
    .d_i  ( Din ),      //information bit vector input
    .q_o  ( enc_data ),      //encoded data word output

    .p_o  (       ),      //parity vector output
    .p0_o (       ));     //extended parity bit



pts_reg pts_reg_inst_1 (

    .clk(clk),
    .rst_n(),
    .data(enc_data),
    .start(start),
    .out(s_hamming)

);

// scrambler
scrambler scr_inst (
    
    .clk(clk),
    .in(s_hamming),
    .out(out_scr)

);

stp_reg stp_reg_inst (

    .clk(clk),
    .rst_n(),
    .start(),
    .data(scr_data),
    .in(out_scr),
    .done(scr_done)

);


// serdes

serdes serdes_dut (
    
    .clk(clk),
    .rst_n(rst_n),
    .Cin(scr_done),
    .Din(scr_data),

    .Dout(Dout_serdes),
    .Done(Done_serdes)
 
);


pts_reg pts_reg_inst_2 (

    .clk(clk),
    .rst_n(),
    .data(Dout_serdes),
    .start(Done_serdes),
    .out(out_serdes)

);

// manchester

manchester_encoder me_inst (

    .clk(clk),
    .data_in(out_serdes),
    .data_out(Dout)

);



endmodule
