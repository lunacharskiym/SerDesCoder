transcript on
vlib work

vlog -sv +incdir+./ ../../rtl/tx/serializer.sv 
vlog -sv +incdir+./ ../tb/tb_serializer.sv

vsim -t 1ns -voptargs="+acc" tb_serializer

run -all

