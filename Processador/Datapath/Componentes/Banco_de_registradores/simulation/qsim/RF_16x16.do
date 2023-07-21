onerror {quit -f}
vlib work
vlog -work work RF_16x16.vo
vlog -work work RF_16x16.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.RF_16x16_vlg_vec_tst
vcd file -direction RF_16x16.msim.vcd
vcd add -internal RF_16x16_vlg_vec_tst/*
vcd add -internal RF_16x16_vlg_vec_tst/i1/*
add wave /*
run -all
