onerror {quit -f}
vlib work
vlog -work work controlador.vo
vlog -work work controlador.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.controlador_vlg_vec_tst
vcd file -direction controlador.msim.vcd
vcd add -internal controlador_vlg_vec_tst/*
vcd add -internal controlador_vlg_vec_tst/i1/*
add wave /*
run -all
