onerror {quit -f}
vlib work
vlog -work work LatchD.vo
vlog -work work LatchD.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.LatchD_vlg_vec_tst
vcd file -direction LatchD.msim.vcd
vcd add -internal LatchD_vlg_vec_tst/*
vcd add -internal LatchD_vlg_vec_tst/i1/*
add wave /*
run -all
