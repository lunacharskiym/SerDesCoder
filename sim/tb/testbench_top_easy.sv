module testbench_top_easy;
  parameter K           = 26;  //Limitation $urandom is a 32bit number
  parameter P0_LSB      = 0;
  parameter DEC_LATENCY = 0;
  parameter RUNS        = 1;


  //-------------------------------------------------------
  // Functions
  function integer calculate_m;
    input integer k;

    integer m;
  begin
    m=1;
    while (2**m < m+k+1) m++;

    calculate_m = m;
  end
  endfunction //calculate_m


  //-------------------------------------------------------
  //
  // Variables
  //
  localparam int m = calculate_m(K);
  localparam int n = m + K;

  logic clk, rst_n;

  logic [K-1:0] enc_d,
                ch_enc_d,
                dec_q;
  logic [n  :0] enc_q,
                ch_q;
  logic         dec_sb_err,
                dec_db_err,
                dec_sb_fix;

  int           nflips, ch_nflips,
                flip1,  ch_flip1,
                flip2,  ch_flip2;

  //-------------------------------------------------------
  //
  // Testbench Body
  //

  //generate clock
  always #10 clk = ~clk;


  //testvector generator


  //instantiate encoder
  ecc_enc #(
    .K      ( K      ),
    .P0_LSB ( P0_LSB ) )
  dut_enc (
    .d_i  ( enc_d ),      //information bit vector input
    .q_o  ( enc_q ),      //encoded data word output

    .p_o  (       ),      //parity vector output
    .p0_o (       ));     //extended parity bit


  //delay data; same delay as channel
  always @(posedge clk) ch_enc_d <= enc_d;


  //instantiate decoder
  ecc_dec #(
    .K          ( K           ),
    .P0_LSB     ( P0_LSB      ),
    .LATENCY    ( DEC_LATENCY ))
  dut_dec (
    .rst_ni     ( rst_n      ),   //asynchronous reset
    .clk_i      ( clk        ),   //clock input
    .clkena_i   ( 1'b1       ),   //clock enable input

    //data ports
    .d_i        ( enc_q      ),   //encoded code word input
    .q_o        ( dec_q      ),   //information bit vector output
    .syndrome_o (            ),   //syndrome vector output

    //flags
    .sb_err_o   ( dec_sb_err ),   //single bit error detected
    .db_err_o   ( dec_db_err ),   //double bit error detected
    .sb_fix_o   ( dec_sb_fix ));  //repaired error in the information bits

initial begin
    $dumpfile("hamming.vcd");
    $dumpvars(0, testbench_top_easy);
end
  //Tests
  initial
  begin
      clk   = 0;
      enc_d = 26'b10001010111100000110011110;
    

      rst_n = 0;
      repeat (5) @(posedge clk);
      rst_n = 1;
      
      $stop();
  end


endmodule
