*Final_pre_sim
.prot
.lib "cic018.l" TT
.temp 25
.unprot
.inc "top.pex.spi"
.option
+ post
*+ measfile = 1
*+ captab

.param Vd = 1.8
.param Vs = 0
.param Vr = 1.4
.param Dw = 5n
.param Dd = 0n
.param L = 0.6u

*Voltage
VDD VDD gnd Vd
VSS VSS gnd Vs
VVREF VREF gnd Vr

VCLK CLK gnd pulse 0 Vd 10n 0.01n 0.01n 5n 10n 

VVA<0> A<0> gnd pulse 0 Vd 15n  0.1n 0.1n 10n  20n
VVA<1> A<1> gnd pulse 0 Vd 15n  0.1n 0.1n 10n  20n
VVA<2> A<2> gnd pulse 0 Vd 15n  0.1n 0.1n 10n  20n 
VVA<3> A<3> gnd pulse 0 Vd 15n  0.1n 0.1n 10n  20n  
VVA<4> A<4> gnd pulse 0 Vd 15n  0.1n 0.1n 10n  20n 
VVA<5> A<5> gnd pulse 0 Vd 15n  0.1n 0.1n 10n  20n 
VVA<6> A<6> gnd pulse 0 Vd 25n  0.1n 0.1n 20n  40n
VVA<7> A<7> gnd pulse 0 Vd 25n  0.1n 0.1n 20n  40n
VVA<8> A<8> gnd pulse 0 Vd 25n  0.1n 0.1n 20n  40n

*Circuit
Xtop CLK VREF VDD VSS Dout<0> Dout<1> 
+ A<2> A<5> A<6> A<7> A<8> A<1> A<0> A<3> A<4> / top

*simulation setup
.op
.tran 1ps 60ns $SWEEP L 0.8u 0.8u 0.2u
.meas tran tp0  trig V(CLK) val=0.9 td=12n rise=1 targ V(Dout<0>)  val=0.9 fall=1
.meas tran tp1  trig V(CLK) val=0.9 td=37n rise=1 targ V(Dout<0>)  val=0.9 rise=1
.meas tran power avg p(VDD) from=20n to=40n

.end



