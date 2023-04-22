LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.bit_1164.all  ; 
USE ieee.bit_textio.all  ; 
USE ieee.bit_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY \waveform_and_gate.vhd\  IS 
END ; 
 
ARCHITECTURE \waveform_and_gate.vhd_arch\   OF \waveform_and_gate.vhd\   IS
  SIGNAL a   :  BIT  ; 
  SIGNAL z   :  BIT  ; 
  SIGNAL b   :  BIT  ; 
  COMPONENT and_gate  
    PORT ( 
      a  : in BIT ; 
      z  : out BIT ; 
      b  : in BIT ); 
  END COMPONENT ; 
BEGIN
  DUT  : and_gate  
    PORT MAP ( 
      a   => a  ,
      z   => z  ,
      b   => b   ) ; 



-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ps, End Time = 400 ns, Period = 200 ns
  Process
	Begin
	 a  <= '0'  ;
	wait for 400 ps ;
-- dumped values till 400 ps
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 400 ns, Period = 0 ps
  Process
	Begin
	 b  <= '0'  ;
	wait for 400 ps ;
-- dumped values till 400 ps
	wait;
 End Process;
END;
