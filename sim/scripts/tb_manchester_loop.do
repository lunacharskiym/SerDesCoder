transcript on
vlib work

vlog -sv +incdir+./ ../../rtl/tx/manchester_encoder.sv 
vlog -sv +incdir+./ ../../rtl/tx/manchester_decoder.sv 
vlog -sv +incdir+./ ../../rtl/tx/manchester_loop.sv 
vlog -sv +incdir+./ ../tb/tb_manchester_loop.sv

vsim -t 1ns -voptargs="+acc" tb_manchester_loop

run -all
