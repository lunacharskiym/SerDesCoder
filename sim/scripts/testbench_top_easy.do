transcript on
vlib work

vlog -sv +incdir+./ ../../rtl/tx/ecc_enc.sv 
vlog -sv +incdir+./ ../../rtl/tx/ecc_dec.sv 
vlog -sv +incdir+./ ../tb/testbench_top_easy.sv

vsim -t 1ns -voptargs="+acc" testbench_top_easy

run -all
