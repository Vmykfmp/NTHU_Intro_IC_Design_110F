*HW3_D_Filp_Flop_pre_sim
.protect
.lib 'cic018.l' TT
.unprotect
.temp 25
.option
+ post
*+ captab
+ measfile = 1

.param Vd = 1.8
.param Vs = 0

.param Wn  = 0.5u
.param Wnp = 0.7u

.param Wpi = 1.5u
.param Wpp = 1u
.param Wpt = 0.5u
.param Wpc = 0.5u

.param Dw = 5n
.param Dd = 13n

*setup time  0.0755ns
*hold  time -0.076ns
*operation voltage

*Voltage
VDD VDD gnd Vd
VSS VSS gnd Vs
VData D gnd pulse 0 Vd Dd 10p 10p Dw 50n

*Clock
VCLK  CLK  gnd pulse 0 Vd 5n 10p 10p 4.98n 10n
VCLK! CLK! gnd pulse Vd 0 5n 10p 10p 4.98n 10n

**MOSFET**
*inverter
MN1 n1 D  GND GND n_18 w=Wn  l=0.18u m=1
MN2 n3 n2 GND GND n_18 w=Wn  l=0.18u m=1
MN3 Q! n4 GND GND n_18 w=Wn  l=0.18u m=1
MN4 n5 n4 GND GND n_18 w=Wn  l=0.18u m=1
MN5 Q  n5 GND GND n_18 w=Wn  l=0.18u m=1

MP1 n1 D  VDD VDD p_18 w=Wpi l=0.18u m=1
MP2 n3 n2 VDD VDD p_18 w=Wpi l=0.18u m=1
MP3 Q! n4 VDD VDD p_18 w=Wpi l=0.18u m=1
MP4 n5 n4 VDD VDD p_18 w=Wpi l=0.18u m=1
MP5 Q  n5 VDD VDD p_18 w=Wpi l=0.18u m=1

*tri_state_inverter
MN6 n2  n3  tr1 GND n_18 w=Wn l=0.18u m=1
MN7 tr1 CLK GND GND n_18 w=Wn l=0.18u m=1
MN8 n4  n5  tr2 GND n_18 w=Wn l=0.18u m=1
MN9 tr2 CLK GND GND n_18 w=Wn l=0.18u m=1

MP6 n2  n3   tr3 VDD p_18 w=Wpt l=0.18u m=1
MP7 tr3 CLK! VDD VDD p_18 w=Wpc l=0.18u m=1
MP8 n4  n5   tr4 VDD p_18 w=Wpt l=0.18u m=1
MP9 tr4 CLK! VDD VDD p_18 w=Wpc l=0.18u m=1

*pass_transistor
MN10 n1 CLK! n2 GND n_18 w=Wnp l=0.18u m=1
MN11 n3 CLK  n4 GND n_18 w=Wnp l=0.18u m=1

MP10 n1 CLK  n3 VDD p_18 w=Wpp l=0.18u m=1
MP11 n3 CLK! n4 VDD p_18 w=Wpp l=0.18u m=1

*simulation setup
.op
.tran 0.01ps 30ns 
*SWEEP Dw 0.9239n 0.924n 0.0001n 
*.meas tran sweep_par param=('Wnp')
.meas tran tpR_CQ  trig V(CLK) val=0.9 td=12n rise=1 targ V(Q)  val=0.9 rise=1
.meas tran tpF_CQ  trig V(CLK) val=0.9 td=12n rise=2 targ V(Q)  val=0.9 fall=1
.meas tran tp_CQ  param=('(tpR_CQ  + tpF_CQ )/2')
.end
