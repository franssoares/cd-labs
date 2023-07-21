onerror {quit -f}
vlib work
vlog -work work ula.vo
vlog -work work ula.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.ula_vlg_vec_tst
vcd file -direction ula.msim.vcd
vcd add -internal ula_vlg_vec_tst/*
vcd add -internal ula_vlg_vec_tst/i1/*
add wave /*
run -all
