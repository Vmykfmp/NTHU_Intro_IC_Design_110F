* SPICE NETLIST
***************************************
.lib "cic018.l" TT
.temp 25
.unprot
.inc "LC.pex.spi"
.option post

*Voltage
v1 VDD 0 1.8
v2 GND 0 0
VINA Va gnd pulse 1.8 0 10n 1n 1n 4n 10n
VINB Vb gnd 1.8
VINC Vc gnd 0

*Capacitor
CL Vout gnd 0.1pF

*Circuit
X1 Vc Vout Va Vdd Vb gnd LC

*Simulation setup
.tran 1p 50ns
.meas tran TpHL TRIG V(VA) val=0.9 td=0 rise=1 TARG V(Vout) val=0.9 fall=1
.meas tran TpLH TRIG V(VA) val=0.9 td=0 fall=1 TARG V(Vout) val=0.9 rise=1

.SUBCKT L POS NEG
.ENDS
.end
***************************************
.SUBCKT LC Vc Vout Va Vdd Vb gnd
** N=8 EP=6 IP=0 FDC=6
M0 Vout Vc gnd gnd N_18 L=1.8e-07 W=7e-06 AD=2.562e-12 AS=4.193e-12 PD=7.32e-07 PS=8.198e-06 $X=5748 $Y=-10100 $D=0
M1 4 Va Vout gnd N_18 L=1.8e-07 W=7e-06 AD=2.9295e-12 AS=2.562e-12 PD=8.37e-07 PS=7.32e-07 $X=6660 $Y=-10100 $D=0
M2 gnd Vb 4 gnd N_18 L=1.8e-07 W=7e-06 AD=4.151e-12 AS=2.9295e-12 PD=8.186e-06 PS=8.37e-07 $X=7677 $Y=-10100 $D=0
M3 8 Vc Vout Vdd P_18 L=1.8e-07 W=1.55e-05 AD=5.673e-12 AS=9.145e-12 PD=7.32e-07 PS=1.668e-05 $X=5748 $Y=-401 $D=1
M4 Vdd Va 8 Vdd P_18 L=1.8e-07 W=1.55e-05 AD=6.48675e-12 AS=5.673e-12 PD=8.37e-07 PS=7.32e-07 $X=6660 $Y=-401 $D=1
M5 8 Vb Vdd Vdd P_18 L=1.8e-07 W=1.55e-05 AD=9.2535e-12 AS=6.48675e-12 PD=1.6694e-05 PS=8.37e-07 $X=7677 $Y=-401 $D=1
.ENDS
***************************************
