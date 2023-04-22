LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.bit_1164.all  ; 
USE ieee.bit_textio.all  ; 
USE ieee.bit_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY waveform_de_morgan  IS 
END ; 
 
ARCHITECTURE waveform_de_morgan_arch OF waveform_de_morgan IS
  SIGNAL x   :  BIT  ; 
  SIGNAL y   :  BIT  ; 
  SIGNAL a   :  BIT  ; 
  SIGNAL z   :  BIT  ; 
  SIGNAL b   :  BIT  ; 
  SIGNAL w   :  BIT  ; 
  COMPONENT de_morgan  
    PORT ( 
      x  : out BIT ; 
      y  : out BIT ; 
      a  : in BIT ; 
      z  : out BIT ; 
      b  : in BIT ; 
      w  : out BIT ); 
  END COMPONENT ; 
BEGIN
  DUT  : de_morgan  
    PORT MAP ( 
      x   => x  ,
      y   => y  ,
      a   => a  ,
      z   => z  ,
      b   => b  ,
      w   => w   ) ; 



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
-- Start Time = 0 ps, End Time = 1 ns, Period = 200 ps
  Process
	Begin
	 b  <= '0'  ;
	wait for 100 ps ;
-- 100 ps, single loop till start period.
	for Z in 1 to 4
	loop
	    b  <= '1'  ;
	   wait for 100 ps ;
	    b  <= '0'  ;
	   wait for 100 ps ;
-- 900 ps, repeat pattern in loop.
	end  loop;
	 b  <= '1'  ;
	wait for 100 ps ;
-- dumped values till 1 ns
	wait;
 End Process;
END;
