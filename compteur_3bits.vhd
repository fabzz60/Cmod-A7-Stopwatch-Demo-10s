
library IEEE;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all; 

--use UNISIM.VComponents.all;

entity compteur3bit is
    Port ( CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Sortie_compteur : out  STD_LOGIC_VECTOR (2 downto 0));
end compteur3bit;

architecture Behavioral of compteur3bit is
signal compte : std_logic_vector(2 downto 0);
begin


process(CLK,reset)
BEGIN 
if reset ='1' then
   compte <="000";
elsif rising_edge(CLK) then
   compte <= compte + 1; 
end if;
END PROCESS; 

Sortie_compteur <= compte;

end Behavioral;

