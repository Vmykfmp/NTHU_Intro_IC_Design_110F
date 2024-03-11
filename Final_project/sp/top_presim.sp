*Final_pre_sim
.prot
.lib "cic018.l" TT
.temp 25
.unprot
.inc "top.spi"
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

VDD2 VDD2 gnd 1

VCLK   CLK    gnd pulse 0 Vd 10n 0.01n 0.01n 5n 10n 
*VSAEN  SAENs   gnd pulse 0 Vd 10.7n 0.01n 0.01n 5n  10n
*VWLEN  WL_ENs  gnd pulse 0 Vd 10n 0.01n 0.01n 2n  10n
*VPreb  Pre_b  gnd pulse 0 Vd 10n 0.01n 0.01n 1n 10n

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
Xtop VDD VSS A<0> A<1> A<2> A<3> A<4> A<5> A<6> A<7> A<8>
+ Dout<0> Dout<1> VREF CLK / top

*ROM16x64
*XROM BL<0> BL<1> BL<2> BL<3> BL<4> BL<5> BL<6> BL<7> BL<8> BL<9> 
*+ BL<10> BL<11> BL<12> BL<13> BL<14> BL<15> VSS WL<0> WL<1> WL<2> WL<3> WL<4> 
*+ WL<5> WL<6> WL<7> WL<8> WL<9> WL<10> WL<11> WL<12> WL<13> WL<14> WL<15> 
*+ WL<16> WL<17> WL<18> WL<19> WL<20> WL<21> WL<22> WL<23> WL<24> WL<25> WL<26> 
*+ WL<27> WL<28> WL<29> WL<30> WL<31> WL<32> WL<33> WL<34> WL<35> WL<36> WL<37> 
*+ WL<38> WL<39> WL<40> WL<41> WL<42> WL<43> WL<44> WL<45> WL<46> WL<47> WL<48> 
*+ WL<49> WL<50> WL<51> WL<52> WL<53> WL<54> WL<55> WL<56> WL<57> WL<58> WL<59> 
*+ WL<60> WL<61> WL<62> WL<63> / ROM16x64

*XDecoder
*XXDec WL_EN VDD VSS X_sel_FF<0> X_sel_FF<1> X_sel_FF<2> X_sel_FF<3> X_sel_FF<4> 
*+ X_sel_FF<5> WL<0> WL<1> WL<2> WL<3> WL<4> 
*+ WL<5> WL<6> WL<7> WL<8> WL<9> WL<10> WL<11> WL<12> WL<13> WL<14> WL<15> 
*+ WL<16> WL<17> WL<18> WL<19> WL<20> WL<21> WL<22> WL<23> WL<24> WL<25> WL<26> 
*+ WL<27> WL<28> WL<29> WL<30> WL<31> WL<32> WL<33> WL<34> WL<35> WL<36> WL<37> 
*+ WL<38> WL<39> WL<40> WL<41> WL<42> WL<43> WL<44> WL<45> WL<46> WL<47> WL<48> 
*+ WL<49> WL<50> WL<51> WL<52> WL<53> WL<54> WL<55> WL<56> WL<57> WL<58> WL<59> 
*+ WL<60> WL<61> WL<62> WL<63> / D664

*YDecoder
*XYDec VDD VDD VSS Y_sel_FF<0> Y_sel_FF<1> Y_sel_FF<2>
*+ Y_sel<0> Y_sel<1> Y_sel<2> Y_sel<3> Y_sel<4> Y_sel<5> Y_sel<6> Y_sel<7> / D38

*Precharge
*Xprech BL<0> BL<1> BL<2> BL<3> BL<4> BL<5> BL<6> BL<7> BL<8> BL<9> 
*+ BL<10> BL<11> BL<12> BL<13> BL<14> BL<15> CLK VDD / prech

*mux8to1
*XMUX BL<0> BL<1> BL<2> BL<3> BL<4> BL<5> BL<6> BL<7> BL<8> BL<9> 
*+ BL<10> BL<11> BL<12> BL<13> BL<14> BL<15> Y_sel<0> Y_sel<1> 
*+ Y_sel<2> Y_sel<3> Y_sel<4> Y_sel<5> Y_sel<6> Y_sel<7> DL<0> DL<1> 
*+ VDD VSS / mux8to1

*Sensing Amplifier
*XSA DL<0> DL<1> Dout_SA<0> Dout_SA<1> SAEN VREF o0 o1 vdd vss / SA

*DFFs & Timing Control
*XDFF_Timing_control A<0> A<1> A<2> A<3> A<4> A<5> A<6> A<7> A<8> CLK SAEN VDD VSS WL_EN 
*+ X_sel_FF<0> X_sel_FF<1> X_sel_FF<2> X_sel_FF<3> X_sel_FF<4> X_sel_FF<5> Y_sel_FF<0> Y_sel_FF<1> Y_sel_FF<2>
*+ notused0 notused1 notused2 notused3 notused4 notused5 notused6 notused7 notused8 / DFF_tctl 

*SR_Latch
*XSRL SAEN Dout<0> Dout<1> Dout_SA<0> Dout_SA<1> QB<0> QB<1> VDD VSS / SRLx2


*simulation setup
.op
.tran 1ps 60ns $SWEEP L 0.8u 0.8u 0.2u
.meas tran tpR  trig V(CLK) val=0.9 td=0n rise=2 targ V(Dout<0>)  val=0.9 fall=1
.meas tran tpF  trig V(CLK) val=0.9 td=37.5n rise=1 targ V(Dout<0>)  val=0.9 rise=1
.meas tran power avg p(VDD) from=20n to=40n


.alter
.prot
.lib "cic018.l" SS
.unprot
.option post
.temp 25

.alter
.prot
.lib "cic018.l" FF
.unprot
.option post
.temp 25

.alter
.prot
.lib "cic018.l" SF
.unprot
.option post
.temp 25

.alter
.prot
.lib "cic018.l" FS
.unprot
.option post
.temp 25
.end



