
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.numeric_std.all;

entity Chronometre_10s is
    Port ( clk : in STD_LOGIC;  --12MHz
           reset : in STD_LOGIC;
           BTN0 : in STD_LOGIC;
           --BTN1 : in STD_LOGIC;
           Full : out STD_LOGIC;
           Empty : out STD_LOGIC;
           affichage_100s : out STD_LOGIC;
           Rx_data_Uart : in STD_LOGIC_VECTOR (7 downto 0);
           BCD_U : out STD_LOGIC_VECTOR (3 downto 0);
           BCD_D : out STD_LOGIC_VECTOR (3 downto 0);
           BCD_M : out STD_LOGIC_VECTOR (3 downto 0);
           BCD_T : out STD_LOGIC_VECTOR (3 downto 0);
           BCD_DM : out STD_LOGIC_VECTOR (3 downto 0);
           BCD_CM : out STD_LOGIC_VECTOR (3 downto 0));
end Chronometre_10s;

architecture Behavioral of Chronometre_10s is
--déclaration des signaux et des variables
signal count1: INTEGER range 0 to 1200 := 0;
SIGNAL clock_int1: STD_LOGIC :='0';
CONSTANT M1: INTEGER := 1200; --100uHz
signal COUNTER_U: INTEGER range 0 to 9;	
signal COUNTER_D: INTEGER range 0 to 9;
signal COUNTER_M: INTEGER range 0 to 9;	
signal COUNTER_T: INTEGER range 0 to 9;
signal COUNTER_DM: INTEGER range 0 to 9;
signal COUNTER_CM: INTEGER range 0 to 9;
signal IS_999999: STD_LOGIC;
signal IS_000000: STD_LOGIC;
signal IS_100000: STD_LOGIC;
signal start_chrono_USB: STD_LOGIC;
signal start_chrono_bouton: STD_LOGIC;
signal bouton_0_in_memory: STD_LOGIC;
signal bouton_1_in_memory: STD_LOGIC;

begin
-- definition résolution horloge 100uHz
PROCESS
BEGIN
WAIT UNTIL CLK'EVENT and CLK = '1' ;
      IF count1 <= M1-1 THEN  
      count1 <= count1 + 1;
      ELSE
      count1 <= 0;
      END IF;
		--à la moitié du comptage on change la valeur de clock_1Hz_int (rapport cyclique = 1/2)
		IF count1 <= M1/2 THEN
      clock_int1 <= '1';
      ELSE
      clock_int1 <= '0';
      end if;
END PROCESS;

--FDCE  Flip-Flop with CE (BNT0) and Asynchronous Clear
process(clk,reset,BTN0) 
begin
if reset ='1' then
   bouton_0_in_memory <= '0';
elsif (clk'event and clk= '1') then
    if BTN0 = '1' then 
       bouton_0_in_memory <= '1';
    end if;
end if;
end process;

-- process recupération des données USB-sérial
start_chrono_USB <='1' when Rx_data_uart = X"73" else '0'; -- touche s du clavier

--compteur pour 6 afficheurs 7 segments
process(clock_int1,Reset,BTN0,start_chrono_USB,Rx_data_uart)
begin
if reset ='1' then
      COUNTER_U  <= 0;
      COUNTER_D  <= 0;
      COUNTER_M  <= 0;
      COUNTER_T  <= 0;
	  COUNTER_DM <= 0;
	  COUNTER_CM <= 0;
	
elsif clock_int1'event and clock_int1 ='1' then
		   if bouton_0_in_memory ='1' or start_chrono_USB ='1' then
		    if IS_999999 = '0' then 
		       if COUNTER_U = 9 then
	     	      COUNTER_U <= 0;
	     	   if COUNTER_D = 9 then
                  COUNTER_D <= 0;
               if COUNTER_M = 9 then
                  COUNTER_M <= 0;
               if COUNTER_T = 9 then
                  COUNTER_T <= 0;
			   if COUNTER_DM = 9 then
                  COUNTER_DM <= 0;
			   if COUNTER_CM = 9 then
                  COUNTER_CM <= 0;
			   else
               COUNTER_CM <= COUNTER_CM + 1;
               end if; 
			   else
               COUNTER_DM <= COUNTER_DM + 1;
               end if; 
               else
               COUNTER_T <= COUNTER_T + 1;
               end if; 
               else
               COUNTER_M <= COUNTER_M + 1;
               end if;  
               else
               COUNTER_D <= COUNTER_D + 1;
               end if;
               else
               COUNTER_U <= COUNTER_U + 1;
               end if;
              end if;
			end if;
			
			    if Rx_data_uart =X"72" then   -- touche r du clavier start chrono
			    COUNTER_U  <= 0;  
                COUNTER_D  <= 0;
                COUNTER_M  <= 0;
                COUNTER_T  <= 0;
		        COUNTER_DM <= 0;
		        COUNTER_CM <= 0;
		        end if;  
				
				if Rx_data_uart =X"53" then 	--S stop chrono
                COUNTER_U  <= COUNTER_U;
                COUNTER_D  <= COUNTER_D;
                COUNTER_M  <= COUNTER_M;
                COUNTER_T  <= COUNTER_T;
		        COUNTER_DM <= COUNTER_DM;
		        COUNTER_CM <= COUNTER_CM;
		        end if; 
			 
		    	if IS_100000 = '1' then 	-- chrono atteint
                COUNTER_U  <= COUNTER_U;
                COUNTER_D  <= COUNTER_D;
                COUNTER_M  <= COUNTER_M;
                COUNTER_T  <= COUNTER_T;
		        COUNTER_DM <= COUNTER_DM;
		        COUNTER_CM <= COUNTER_CM;
		        end if; 
    			
end if;
end process;

	BCD_U <= std_logic_vector(to_unsigned(COUNTER_U,4));
	BCD_D <= std_logic_vector(to_unsigned(COUNTER_D,4));
	BCD_M <= std_logic_vector(to_unsigned(COUNTER_M,4));
	BCD_T <= std_logic_vector(to_unsigned(COUNTER_T,4));
	BCD_DM <= std_logic_vector(to_unsigned(COUNTER_DM,4));
	BCD_CM <= std_logic_vector(to_unsigned(COUNTER_CM,4));

-- visu Led rouge pour secondes
affichage_100s <='1';

 --définition des bornes du chronometre 0 to 100s
  IS_100000 <= '1' when (COUNTER_U = 0 and COUNTER_D = 0 and COUNTER_M = 0 and COUNTER_T = 0 and COUNTER_DM = 0 and COUNTER_CM = 1) else '0'; 
  IS_999999 <= '1' when (COUNTER_U = 9 and COUNTER_D = 9 and COUNTER_M = 9 and COUNTER_T = 9 and COUNTER_DM = 9 and COUNTER_CM = 9) else '0';
  
end Behavioral;
