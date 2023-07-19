onerror {quit -f}
vlib work
vlog -work work Datapath.vo
vlog -work work Datapath.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Datapath_vlg_vec_tst
vcd file -direction Datapath.msim.vcd
vcd add -internal Datapath_vlg_vec_tst/*
vcd add -internal Datapath_vlg_vec_tst/i1/*
add wave /*
run -all
