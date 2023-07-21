onerror {quit -f}
vlib work
vlog -work work cont_program.vo
vlog -work work cont_program.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.cont_program_vlg_vec_tst
vcd file -direction cont_program.msim.vcd
vcd add -internal cont_program_vlg_vec_tst/*
vcd add -internal cont_program_vlg_vec_tst/i1/*
add wave /*
run -all
