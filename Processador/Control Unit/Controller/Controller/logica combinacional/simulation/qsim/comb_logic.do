onerror {quit -f}
vlib work
vlog -work work comb_logic.vo
vlog -work work comb_logic.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.comb_logic_vlg_vec_tst
vcd file -direction comb_logic.msim.vcd
vcd add -internal comb_logic_vlg_vec_tst/*
vcd add -internal comb_logic_vlg_vec_tst/i1/*
add wave /*
run -all
