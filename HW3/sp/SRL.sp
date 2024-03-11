*HW3_SRlatch_pre_sim
.protect
.lib 'cic018.l' TT
.temp 25
.unprotect
.option
+ post
*+ captab
+ measfile = 1

.param Vd = 1.8
.param Vs = 0
.param Wnt = 3.38u
.param Wni = 0.5u
.param Wpi = 0.5u

.param Dw = 3n
.param Dd = 16n

*setup time  0.0192ns
*hold  time -0.0291ns
*operation voltage

*Voltage
VDD VDD gnd Vd
VSS VSS gnd Vs
VR R gnd pulse Vd 0 Dd 10p 10p Dw 50n 
VS S gnd pulse 0 Vd Dd 10p 10p Dw 50n 

*Clock
VCLK CLK gnd pulse 0 Vd 5n 10p 10p 4.98n 10n

*MOSFET
MN1 R CLK QB  GND n_18 w=Wnt l=0.18u m=1
MN2 S CLK Q   GND n_18 w=Wnt l=0.18u m=1
MN3 Q  QB GND GND n_18 w=Wni l=0.18u m=1
MN4 QB  Q GND GND n_18 w=Wni l=0.18u m=1
MP3 Q  QB VDD VDD p_18 w=Wpi l=0.18u m=1
MP4 QB  Q VDD VDD p_18 w=Wpi l=0.18u m=1

*simulation setup
.op
.tran 0.01ps 30ns 
*SWEEP Vd 0.52 0.6 0.01
*.meas tran sweep_par param=('Wnt')
.meas tran tpR_SQ  trig V(S) val=0.9 td=15n rise=1 targ V(Q)  val=0.9 rise=1
.meas tran tpR_RQB trig V(R) val=0.9 td=15n rise=1 targ V(QB) val=0.9 rise=1
.meas tran tpF_SQ  trig V(S) val=0.9 td=15n fall=1 targ V(Q)  val=0.9 fall=1
.meas tran tpF_RQB trig V(R) val=0.9 td=15n fall=1 targ V(QB) val=0.9 fall=1
.meas tran tp_SQ  param=('(tpR_SQ  + tpF_SQ )/2')
.meas tran tp_RQB param=('(tpR_RQB + tpF_RQB)/2')
.end
