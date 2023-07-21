onerror {quit -f}
vlib work
vlog -work work controle.vo
vlog -work work controle.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.controle_vlg_vec_tst
vcd file -direction controle.msim.vcd
vcd add -internal controle_vlg_vec_tst/*
vcd add -internal controle_vlg_vec_tst/i1/*
add wave /*
run -all
