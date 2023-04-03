
set labelCount 2                                             
set uniqueLabel 205644064
#################################################################################


##Editing for Signal sim:/or_gate/a
# "Clock Pattern" : dutyCycle = 50
# Start Time = 0 ps, End Time = 400 ns, Period = 200 ns
#################################################################################


noforce sim:/or_gate/a
force -freeze sim:/or_gate/a 0 0 ps,1 100000 ps  -repeat 200000 ps -cancel @400000 ps

when -label 205644064_1 {$now = @400 ps} {
        set whenArray(205644064_1) 205644064_1
        noforce sim:/or_gate/a
        force -freeze sim:/or_gate/a 0 0 ps
}


##Editing for Signal sim:/or_gate/b
# "Clock Pattern" : dutyCycle = 50
# Start Time = 0 ps, End Time = 400 ns, Period = 400 ns
#################################################################################


noforce sim:/or_gate/b
force -freeze sim:/or_gate/b 0 0 ps,1 200000 ps  -repeat 400000 ps -cancel @400000 ps

        noforce sim:/or_gate/b
        force -freeze sim:/or_gate/b  0 0 ps, 1 200000 ps

when -label 205644064_2 {$now = @400 ps} {
        set whenArray(205644064_2) 205644064_2
        noforce sim:/or_gate/b
        force -freeze sim:/or_gate/b 0 0 ps
}
