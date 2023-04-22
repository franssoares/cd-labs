LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.bit_1164.all  ; 
USE ieee.bit_textio.all  ; 
USE ieee.bit_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY waveform_postulados  IS 
END ; 
 
ARCHITECTURE waveform_postulados_arch OF waveform_postulados IS
  SIGNAL x   :  BIT  ; 
  SIGNAL y   :  BIT  ; 
  SIGNAL a   :  BIT  ; 
  SIGNAL z   :  BIT  ; 
  COMPONENT postulados  
    PORT ( 
      x  : out BIT ; 
      y  : out BIT ; 
      a  : in BIT ; 
      z  : out BIT ); 
  END COMPONENT ; 
BEGIN
  DUT  : postulados  
    PORT MAP ( 
      x   => x  ,
      y   => y  ,
      a   => a  ,
      z   => z   ) ; 



-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ps, End Time = 1 ns, Period = 100 ps
  Process
	Begin
	for Z in 1 to 10
	loop
	    a  <= '1'  ;
	   wait for 50 ps ;
	    a  <= '0'  ;
	   wait for 50 ps ;
-- 1 ns, repeat pattern in loop.
	end  loop;
	wait;
 End Process;
END;
