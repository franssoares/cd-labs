onerror {quit -f}
vlib work
vlog -work work processador.vo
vlog -work work processador.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.processador_vlg_vec_tst
vcd file -direction processador.msim.vcd
vcd add -internal processador_vlg_vec_tst/*
vcd add -internal processador_vlg_vec_tst/i1/*
add wave /*
run -all
