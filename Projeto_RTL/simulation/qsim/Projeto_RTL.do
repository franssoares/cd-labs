onerror {quit -f}
vlib work
vlog -work work Projeto_RTL.vo
vlog -work work Projeto_RTL.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.timer_vlg_vec_tst
vcd file -direction Projeto_RTL.msim.vcd
vcd add -internal timer_vlg_vec_tst/*
vcd add -internal timer_vlg_vec_tst/i1/*
add wave /*
run -all
