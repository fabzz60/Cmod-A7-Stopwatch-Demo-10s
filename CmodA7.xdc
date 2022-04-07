
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports RX_Serial]
set_property IOSTANDARD LVCMOS33 [get_ports BTN1]
set_property IOSTANDARD LVCMOS33 [get_ports BTN0]
set_property IOSTANDARD LVCMOS33 [get_ports afficheur_5]
set_property IOSTANDARD LVCMOS33 [get_ports afficheur_4]
set_property IOSTANDARD LVCMOS33 [get_ports afficheur_3]
set_property IOSTANDARD LVCMOS33 [get_ports afficheur_2]
set_property IOSTANDARD LVCMOS33 [get_ports afficheur_1]
set_property IOSTANDARD LVCMOS33 [get_ports afficheur_0]

## 12 MHz Clock Signal master
set_property PACKAGE_PIN L17 [get_ports clk]
set_property PACKAGE_PIN W6 [get_ports afficheur_0]
set_property PACKAGE_PIN U3 [get_ports afficheur_1]
set_property PACKAGE_PIN U7 [get_ports afficheur_2]
set_property PACKAGE_PIN W7 [get_ports afficheur_3]
set_property PACKAGE_PIN U8 [get_ports afficheur_4]
set_property PACKAGE_PIN V8 [get_ports afficheur_5]
set_property PACKAGE_PIN A18 [get_ports BTN0]
set_property PACKAGE_PIN B18 [get_ports BTN1]
set_property PACKAGE_PIN J17 [get_ports RX_Serial]

#set_property PACKAGE_PIN B16 [get_ports {LD0[0]}]
#set_property PACKAGE_PIN C17 [get_ports {LD0[1]}]
#set_property PACKAGE_PIN B17 [get_ports {LD0[2]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {LD0[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LD0[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LD0[2]}]


#set_property PACKAGE_PIN U4 [get_ports {visu_compteur[0]}]
#set_property PACKAGE_PIN V4 [get_ports {visu_compteur[1]}]
#set_property PACKAGE_PIN W5 [get_ports {visu_compteur[2]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {visu_compteur[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {visu_compteur[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {visu_compteur[2]}]

#set_property PACKAGE_PIN V3 [get_ports {visu_divider}]
#set_property IOSTANDARD LVCMOS33 [get_ports {visu_divider}]

set_property PACKAGE_PIN U5 [get_ports affichage_100s]
#set_property PACKAGE_PIN U5 [get_ports {Leds_etat_1s[1]}]
#set_property PACKAGE_PIN W4 [get_ports {Leds_etat_1s[2]}]
#set_property PACKAGE_PIN V5 [get_ports {Leds_etat_1s[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports affichage_100s]
#set_property IOSTANDARD LVCMOS33 [get_ports {Leds_etat_1s[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {Leds_etat_1s[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {Leds_etat_1s[3]}]

#set_property DRIVE 4 [get_ports {Leds_etat_1s[3]}]
#set_property DRIVE 4 [get_ports {Leds_etat_1s[2]}]
#set_property DRIVE 4 [get_ports {Leds_etat_1s[1]}]
#set_property DRIVE 4 [get_ports {Leds_etat_1s[0]}]

set_property DRIVE 16 [get_ports afficheur_0]
set_property DRIVE 16 [get_ports afficheur_1]
set_property DRIVE 16 [get_ports afficheur_2]
set_property DRIVE 16 [get_ports afficheur_3]
set_property DRIVE 16 [get_ports afficheur_4]
set_property DRIVE 16 [get_ports afficheur_5]

set_property IOSTANDARD LVCMOS33 [get_ports data_send]
set_property IOSTANDARD LVCMOS33 [get_ports Empty]
set_property IOSTANDARD LVCMOS33 [get_ports Full]
set_property PACKAGE_PIN T1 [get_ports data_send]
set_property PACKAGE_PIN A17 [get_ports Empty]
set_property PACKAGE_PIN C16 [get_ports Full]


set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]

set_property PACKAGE_PIN M3 [get_ports {seg[0]}]
set_property PACKAGE_PIN L3 [get_ports {seg[1]}]
set_property PACKAGE_PIN A16 [get_ports {seg[2]}]
set_property PACKAGE_PIN K3 [get_ports {seg[3]}]
set_property PACKAGE_PIN C15 [get_ports {seg[4]}]
set_property PACKAGE_PIN H1 [get_ports {seg[5]}]
set_property PACKAGE_PIN A15 [get_ports {seg[6]}]
