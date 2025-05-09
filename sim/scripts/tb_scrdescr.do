transcript on
vlib work

vlog -sv +incdir+./ ../../rtl/tx/scrambler.sv 
vlog -sv +incdir+./ ../../rtl/tx/descrambler.sv 
vlog -sv +incdir+./ ../../rtl/tx/scrdescr.sv 
vlog -sv +incdir+./ ../tb/tb_scrdescr.sv

vsim -t 1ns -voptargs="+acc" tb_scrdescr

run -all

