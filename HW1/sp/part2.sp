*HW1_Part2
.lib 'cic018.l' TT
.unprotect
.global VDD GND
.temp 25
.option
+ post
+ captab
+ measfile = 1

.param Vd = 1.8
.param Vss = 0
.param Vi = 0.9
.param Wn = 0.5u
.param Wp = 1.8461u
.param M = 1

*Voltage
VDD VDD gnd Vd
VSS S gnd Vss
VVIN_pulse Vin S pulse 0 1.8 10n 1n 1n 4n 10n

*Capacitor
CL Vout S 10pF
Cg1 Vin S 0.1pF

.SUBCKT inv in out M=1
MN out in GND GND n_18 w=Wn l=0.18u m=M
MP out in VDD VDD p_18 w=Wp l=0.18u m=M
.ENDS
Xinv1 Vin n1 inv M=10
Xinv2 n1 n2 inv M=50
Xinv3 n2 Vout inv M=100

*simulation setup
.op 
*** part 2-1 ***
*.DC Wp 0.3u 50u 0.01u 
*.MEAS dc Wp_meas find par(Wp) when V(Vout)=0.9

.Tran 0.01ns 30ns

.MEAS tran TpHL_Vout trig V(Vin) val=0.9 td=0 rise=1 targ V(Vout) val=0.9 fall=1
.MEAS tran TpLH_Vout trig V(Vin) val=0.9 td=0 fall=1 targ V(Vout) val=0.9 rise=1   
   
.MEAS tran TpHL_n1 trig V(Vin) val=0.9 td=0 rise=1 targ V(n1) val=0.9 fall=1
.MEAS tran TpLH_n1 trig V(Vin) val=0.9 td=0 fall=1 targ V(n1) val=0.9 rise=1   

.MEAS tran TpLL_n2 trig V(Vin) val=0.9 td=0 rise=1 targ V(n2) val=0.9 rise=1
.MEAS tran TpHH_n2 trig V(Vin) val=0.9 td=0 fall=1 targ V(n2) val=0.9 fall=1   

*** part 2-2 ***   
*.ALTER
*.temp -40
*.param Wp = 10.5030u
*.ALTER
*.temp 120
*.param Wp = 7.4616u
.end
