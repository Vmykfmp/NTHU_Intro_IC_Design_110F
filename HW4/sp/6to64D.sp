*HW4_6_t0_64_Decoder_pre_sim
.prot
.lib "cic018.l" TT
.temp 25
.unprot
.inc "D664.spi"
.option
+ post
+ measfile = 1
*+ captab

.param Vd = 1.8
.param Vs = 0
*.param Wn  = 0.5u
*.param Wnp = 0.7u
*.param Wpi = 1.5u
*.param Wpp = 1u
*.param Wpt = 0.5u
*.param Wpc = 0.5u
.param Dw = 5n
.param Dd = 0n

*setup time  0.1051ns
*hold  time -0.0849ns
*operation voltage

*Voltage
VDD VDD gnd Vd
VSS VSS gnd Vs
VEN    EN gnd pulse 0 Vd 5n   0.1n 0.1n 500n 500n
VVin1 in0 gnd pulse 0 Vd 10n  0.1n 0.1n 5n  10n
VVin2 in1 gnd pulse 0 Vd 15n  0.1n 0.1n 10n  20n
VVin3 in2 gnd pulse 0 Vd 25n  0.1n 0.1n 20n  40n
VVin4 in3 gnd pulse 0 Vd 45n  0.1n 0.1n 40n  80n
VVin5 in4 gnd pulse 0 Vd 85n  0.1n 0.1n 80n  160n
VVin6 in5 gnd pulse 0 Vd 165n 0.1n 0.1n 160n 320n

*Circuit
X1 EN VDD VSS in0 in1 in2 in3 in4 in5 
+ out0  out1  out2  out3  out4  out5  out6  out7
+ out8  out9  out10 out11 out12 out13 out14 out15
+ out16 out17 out18 out19 out20 out21 out22 out23
+ out24 out25 out26 out27 out28 out29 out30 out31
+ out32 out33 out34 out35 out36 out37 out38 out39
+ out40 out41 out42 out43 out44 out45 out46 out47
+ out48 out49 out50 out51 out52 out53 out54 out55
+ out56 out57 out58 out59 out60 out61 out62 out63
+ / D664

*simulation setup
.op
.tran 0.01ps 50ns
*SWEEP Dw 0.915n 0.916n 0.0001n
*.meas tran sweep_par param=('Dw')
.meas tran tpR  trig V(in0) val=0.9 td=0n rise=3 targ V(out5)  val=0.9 rise=1
.meas tran tpF  trig V(in0) val=0.9 td=0n fall=3 targ V(out5)  val=0.9 fall=1
.meas tran tp  param=('(tpR  + tpF )/2')

.SUBCKT L POS NEG
.ENDS
.end



