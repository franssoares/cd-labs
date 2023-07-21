onerror {quit -f}
vlib work
vlog -work work ffd.vo
vlog -work work ffd.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.ffd_vlg_vec_tst
vcd file -direction ffd.msim.vcd
vcd add -internal ffd_vlg_vec_tst/*
vcd add -internal ffd_vlg_vec_tst/i1/*
add wave /*
run -all
