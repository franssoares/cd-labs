LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY waveform_op_booleanas  IS 
END ; 
 
ARCHITECTURE waveform_op_booleanas_arch OF waveform_op_booleanas IS
  SIGNAL p   :  BIT  ; 
  SIGNAL a   :  BIT  ; 
  SIGNAL q   :  BIT  ; 
  SIGNAL b   :  BIT  ; 
  SIGNAL r   :  BIT  ; 
  SIGNAL c   :  BIT  ; 
  SIGNAL s   :  BIT  ; 
  SIGNAL t   :  BIT  ; 
  SIGNAL u   :  BIT  ; 
  SIGNAL v   :  BIT  ; 
  SIGNAL w   :  BIT  ; 
  SIGNAL x   :  BIT  ; 
  SIGNAL y   :  BIT  ; 
  SIGNAL z   :  BIT  ; 
  SIGNAL o   :  BIT  ; 
  COMPONENT op_booleanas  
    PORT ( 
      p  : out BIT ; 
      a  : in BIT ; 
      q  : out BIT ; 
      b  : in BIT ; 
      r  : out BIT ; 
      c  : in BIT ; 
      s  : out BIT ; 
      t  : out BIT ; 
      u  : out BIT ; 
      v  : out BIT ; 
      w  : out BIT ; 
      x  : out BIT ; 
      y  : out BIT ; 
      z  : out BIT ; 
      o  : out BIT ); 
  END COMPONENT ; 
BEGIN
  DUT  : op_booleanas  
    PORT MAP ( 
      p   => p  ,
      a   => a  ,
      q   => q  ,
      b   => b  ,
      r   => r  ,
      c   => c  ,
      s   => s  ,
      t   => t  ,
      u   => u  ,
      v   => v  ,
      w   => w  ,
      x   => x  ,
      y   => y  ,
      z   => z  ,
      o   => o   ) ; 



-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ps, End Time = 1 ns, Period = 100 ps
  Process
	Begin
	 a  <= '0'  ;
	wait for 50 ps ;
-- 50 ps, single loop till start period.
	for Z in 1 to 9
	loop
	    a  <= '1'  ;
	   wait for 50 ps ;
	    a  <= '0'  ;
	   wait for 50 ps ;
-- 950 ps, repeat pattern in loop.
	end  loop;
	 a  <= '1'  ;
	wait for 50 ps ;
-- dumped values till 1 ns
	wait;
 End Process;


-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ps, End Time = 1 ns, Period = 150 ps
  Process
	Begin
	 b  <= '0'  ;
	wait for 75 ps ;
-- 75 ps, single loop till start period.
	for Z in 1 to 6
	loop
	    b  <= '1'  ;
	   wait for 75 ps ;
	    b  <= '0'  ;
	   wait for 75 ps ;
-- 975 ps, repeat pattern in loop.
	end  loop;
	 b  <= '1'  ;
	wait for 25 ps ;
-- dumped values till 1 ns
	wait;
 End Process;


-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ps, End Time = 1 ns, Period = 200 ps
  Process
	Begin
	 c  <= '0'  ;
	wait for 100 ps ;
-- 100 ps, single loop till start period.
	for Z in 1 to 4
	loop
	    c  <= '1'  ;
	   wait for 100 ps ;
	    c  <= '0'  ;
	   wait for 100 ps ;
-- 900 ps, repeat pattern in loop.
	end  loop;
	 c  <= '1'  ;
	wait for 100 ps ;
-- dumped values till 1 ns
	wait;
 End Process;
END;
