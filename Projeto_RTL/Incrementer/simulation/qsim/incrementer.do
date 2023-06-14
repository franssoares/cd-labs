onerror {quit -f}
vlib work
vlog -work work incrementer.vo
vlog -work work incrementer.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.counter_wload_6_vlg_vec_tst
vcd file -direction incrementer.msim.vcd
vcd add -internal counter_wload_6_vlg_vec_tst/*
vcd add -internal counter_wload_6_vlg_vec_tst/i1/*
add wave /*
run -all
