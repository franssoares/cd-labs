onerror {quit -f}
vlib work
vlog -work work unid_control.vo
vlog -work work unid_control.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.unid_control_vlg_vec_tst
vcd file -direction unid_control.msim.vcd
vcd add -internal unid_control_vlg_vec_tst/*
vcd add -internal unid_control_vlg_vec_tst/i1/*
add wave /*
run -all
