transcript on
vlib work

vlog -sv +incdir+./ ../../rtl/tx/scrambler.sv 
vlog -sv +incdir+./ ../../rtl/tx/descrambler.sv 
vlog -sv +incdir+./ ../../rtl/tx/ecc_enc.sv 
vlog -sv +incdir+./ ../../rtl/tx/pts_reg.sv 
vlog -sv +incdir+./ ../../rtl/tx/stp_reg.sv 
vlog -sv +incdir+./ ../../rtl/tx/serializer.sv 
vlog -sv +incdir+./ ../../rtl/tx/deserializer.sv
vlog -sv +incdir+./ ../../rtl/tx/serdes.sv 
vlog -sv +incdir+./ ../../rtl/tx/manchester_encoder.sv
vlog -sv +incdir+./ ../../rtl/tx/manchester_decoder.sv
vlog -sv +incdir+./ ../../rtl/tx/tx_top.sv


vlog -sv +incdir+./ ../tb/tb_tx_top.sv

vsim -t 1ns -voptargs="+acc" tb_tx_top

run -all

