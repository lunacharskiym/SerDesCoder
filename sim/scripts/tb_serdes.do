transcript on
vlib work

vlog -sv +incdir+./ ../../rtl/tx/serializer.sv 
vlog -sv +incdir+./ ../../rtl/tx/deserializer.sv 
vlog -sv +incdir+./ ../../rtl/tx/serdes.sv 
vlog -sv +incdir+./ ../tb/tb_serdes.sv

vsim -t 1ns -voptargs="+acc" tb_serdes

run -all

