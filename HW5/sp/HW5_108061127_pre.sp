*HW5_sense_amp_pre_sim
.protect
.lib 'cic018.l' TT
.temp 25
.unprotect
.option
+ post
*+ captab
+ measfile = 1
+ measform = 3
 
.param Vd = 1.8
.param Vs = 0
.param Vp = 1.8
.param Vn = 'Vp - Vin_offset'
.param Vth = AGAUSS(0,0.072,6)
.param Vin_offset = 0.092
*TT25:0.092
*SF25:0.094
*FS25:0.087
*SS125:0.079
*FF-40:0.087

.param Wns = 0.47u
.param Wnt = 0.47u    $ negative corrlated to tp_snes
.param Wni = 0.47u
.param Wpe = 0.47u    $ best at 1.1u
.param Wpi = 0.47u

*Voltage
VDD VDD gnd Vd
VSS VSS gnd Vs
VVEN EN gnd   pulse 0 1.8 1n 0.1n 0.1n 0.9n 2n
VVINN INN gnd pulse 0 Vn  1n 0.1n 0.1n 0.9n 2n 
VVINP INP gnd pulse 0 Vp  1n 0.1n 0.1n 0.9n 2n 

*MOSFET
MN1 SO  SON X1  GND n_18 w=Wni l=0.18u m=1 delvto=VTH
MN3 SON SO  X2  GND n_18 w=Wni l=0.18u m=1 delvto=VTH
MN5 X1  INN COM GND n_18 w=Wns l=0.18u m=1 delvto=VTH
MN6 X2  INP COM GND n_18 w=Wns l=0.18u m=1 delvto=VTH
MN9 COM EN  GND GND n_18 w=Wnt l=0.18u m=1 delvto=VTH
MP2 SO  SON VDD VDD p_18 w=Wpi l=0.18u m=1 delvto=VTH
MP4 SON SO  VDD VDD p_18 w=Wpi l=0.18u m=1 delvto=VTH
MP7 SO  EN  VDD VDD p_18 w=Wpe l=0.18u m=1 delvto=VTH
MP8 SON EN  VDD VDD p_18 w=Wpe l=0.18u m=1 delvto=VTH

*simulation setup
.op
.tran 0.01ps 4ns SWEEP monte=1024
.meas tran Vi_offset param('Vp-Vn')
.meas tran power avg p(vdd) from=1n to=3n
.meas tran tpR_sens  trig V(EN) val=0.9 td=0n rise=1 targ V(SON) val=0.9 fall=1
.meas tran tpF_sens  trig V(EN) val=0.9 td=0n fall=1 targ V(SON) val=0.9 rise=1
.meas tran tp_sens param=('(tpR_sens + tpF_sens )/2')
.end
