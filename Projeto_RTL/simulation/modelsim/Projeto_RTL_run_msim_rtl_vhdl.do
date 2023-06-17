transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/altera/13.0sp1/Projeto_RTL/Timer/Contadores/Relogio/Dias/counter_days_5.vhd}
vcom -93 -work work {C:/altera/13.0sp1/Projeto_RTL/Timer/timer.vhd}
vcom -93 -work work {C:/altera/13.0sp1/Projeto_RTL/Timer/Registradores/Registrador 1x6/reg_1x6.vhd}
vcom -93 -work work {C:/altera/13.0sp1/Projeto_RTL/Timer/Registradores/Registrador 1x5/reg_1x5.vhd}
vcom -93 -work work {C:/altera/13.0sp1/Projeto_RTL/Timer/Registradores/Registrador 1x5/Flip Flop tipo D/ffd_5.vhd}
vcom -93 -work work {C:/altera/13.0sp1/Projeto_RTL/Timer/Multiplexador/mux_2x1_6.vhd}
vcom -93 -work work {C:/altera/13.0sp1/Projeto_RTL/Timer/Multiplexador/mux_2x1_5.vhd}
vcom -93 -work work {C:/altera/13.0sp1/Projeto_RTL/Timer/Multiplexador/mux_2x1.vhd}
vcom -93 -work work {C:/altera/13.0sp1/Projeto_RTL/Timer/Contadores/counter.vhd}
vcom -93 -work work {C:/altera/13.0sp1/Projeto_RTL/Timer/Contadores/Somadores/half_adder5.vhd}
vcom -93 -work work {C:/altera/13.0sp1/Projeto_RTL/Timer/Contadores/Somadores/half_adder_6.vhd}
vcom -93 -work work {C:/altera/13.0sp1/Projeto_RTL/Timer/Contadores/Relogio/Segundos/counter_seg_6.vhd}
vcom -93 -work work {C:/altera/13.0sp1/Projeto_RTL/Timer/Contadores/Relogio/Minutos/counter_min_6.vhd}
vcom -93 -work work {C:/altera/13.0sp1/Projeto_RTL/Timer/Contadores/Relogio/Horas/counter_hours_5.vhd}
vcom -93 -work work {C:/altera/13.0sp1/Projeto_RTL/Timer/Contadores/Incrementador/incrementer5.vhd}
vcom -93 -work work {C:/altera/13.0sp1/Projeto_RTL/Timer/Contadores/Incrementador/incrementer_6.vhd}
vcom -93 -work work {C:/altera/13.0sp1/Projeto_RTL/Timer/Comparador/comparator_6.vhd}
vcom -93 -work work {C:/altera/13.0sp1/Projeto_RTL/Timer/Comparador/comparator_5.vhd}
vcom -93 -work work {C:/altera/13.0sp1/Projeto_RTL/Banco de registreadores/Banco de registradores 1x8/Registradores 8x1/LatchD/LatchD.vhd}

