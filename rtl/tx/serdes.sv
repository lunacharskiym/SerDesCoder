/*
*
*   Serializer -> deserializer loop for simulation
*
*/


module serdes (
    
    input   logic               clk,
    input   logic               rst_n,
    input   logic               Cin,
    input   logic   [31 : 0]    Din,

    output  logic   [31 : 0]    Dout,
    output  logic               Done

);

logic [7 : 0]Dout_ser;
logic Done_ser;

serializer serializer_inst (
    
    .clk(clk),
    .rst_n(rst_n),
    .Cin(Cin),
    .Din(Din),

    .Dout(Dout_ser),
    .Done(Done_ser)
 
);

deserializer deserializer_inst (
    
    .clk(clk),
    .rst_n(rst_n),
    .Cin(Cin),
    .Din(Dout_ser),

    .Dout(Dout),
    .Done(Done)
 
);


endmodule
