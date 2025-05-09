transcript on
vlib work

vlog -sv +incdir+./ ../../rtl/tx/ecc_enc.sv 
vlog -sv +incdir+./ ../../rtl/tx/ecc_dec.sv 
vlog -sv +incdir+./ ../tb/ecc_tb_channel.sv
vlog -sv +incdir+./ ../tb/ecc_tb_checker.sv
vlog -sv +incdir+./ ../tb/testbench_top.sv

vsim -t 1ns -voptargs="+acc" testbench_top

run -all
