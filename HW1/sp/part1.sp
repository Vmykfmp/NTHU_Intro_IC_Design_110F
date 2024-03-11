*HW1_Part1
.lib 'cic018.l' TT
.unprotect
.temp 25
.option
+ post
+ captab
+ measfile = 1

.param Vdd = 1.8
.param Vss = 0
.param Vi = 0.5*Vdd
.param Wn = 3u
.param Wp = 8.3626u

*Voltage
VDD D gnd Vdd
VSS S gnd Vss
*** DC VIN ***
*VVIN_DC Vin S Vi 
*** pulse VI ***
VVIN_pulse Vin S pulse 0 1.8 10n 1n 1n 4n 10n

*Capacitor
CL Vout S 0.1pF

*MOSFET
MN Vout Vin S S n_18 w=Wn l=0.18u m=1
MP Vout Vin D D p_18 w=Wp l=0.18u m=1

*simulation setup
.op 
*** part 1-1 ***
*.DC Wp 0.3u 50u 0.01u 
*.MEAS dc Wp_meas find par(Wp) when V(Vout)=0.9
.Tran 0.01ns 30ns
.MEAS tran pwr avg power from=20n to= 30n
.MEAS tran TpHL trig V(Vin) val=0.9 td=0 rise=1 targ V(Vout) val=0.9 fall=1
.MEAS tran TpLH trig V(Vin) val=0.9 td=0 fall=1 targ V(Vout) val=0.9 rise=1   

*** part 1-2 ***
*.ALTER
*.temp -40
*.param Wp = 10.5030u
*.ALTER
*.temp 120
*.param Wp = 7.4616u

*** part 1-3 ***
*.DC Vi 0 1.8 0.01
*.PROBE test = deriv('V(Vout)') 
*.MEAS dc VIL find V(Vin) when deriv('V(Vout)') = -1 fall=1
*.MEAS dc VOL find V(Vout) when deriv('V(Vout)') = -1 fall=1
*.MEAS dc VIH find V(Vin) when deriv('V(Vout)') = -1 rise=1
*.MEAs dc VOH find V(Vout) when deriv('V(Vout)') = -1 rise=1

.end
