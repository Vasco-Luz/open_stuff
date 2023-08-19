v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Basic Source follower with a current source amplifier stage.
As it can be observed the gain is smaller then 1.
Same thing as with an current source. this configuration is not very good, but it serves the purpose of testing.


} 880 -260 0 0 0.4 0.4 {}
N 430 -290 500 -290 {
lab=GND}
N 100 -350 100 -330 {
lab=GND}
N 100 -450 100 -410 {
lab=VDD}
N 430 -440 430 -400 {
lab=VDD}
N 180 -350 180 -330 {
lab=GND}
N 180 -450 180 -410 {
lab=VIN}
N 340 -290 390 -290 {
lab=VIN}
N 180 -330 180 -310 {
lab=GND}
N 250 270 250 300 {
lab=GND}
N 650 -230 690 -230 {
lab=VOUT}
N 480 -230 650 -230 {
lab=VOUT}
N 650 -170 650 -150 {
lab=GND}
N 250 190 300 190 {
lab=VINT}
N 250 190 250 210 {
lab=VINT}
N 360 190 430 190 {
lab=#net1}
N 430 190 470 190 {
lab=#net1}
N 420 110 420 190 {
lab=#net1}
N 420 30 420 50 {
lab=VIN}
N 690 250 730 250 {
lab=VOUTT}
N 690 310 690 330 {
lab=GND}
N 650 250 690 250 {
lab=VOUTT}
N 430 -340 430 -320 {
lab=#net2}
N 430 -260 430 -190 {
lab=VOUT}
N 430 -230 480 -230 {
lab=VOUT}
N 430 -130 430 -110 {
lab=GND}
N 510 190 580 190 {
lab=GND}
N 510 40 510 80 {
lab=VDD}
N 510 140 510 160 {
lab=#net3}
N 510 220 510 290 {
lab=#net4}
N 510 250 560 250 {
lab=#net4}
N 510 350 510 370 {
lab=GND}
N 560 250 590 250 {
lab=#net4}
N -60 -320 -60 -310 {
lab=GND}
N -60 -410 -60 -380 {
lab=VB}
N 370 -160 390 -160 {
lab=VB}
N 430 -160 510 -160 {
lab=GND}
N 510 350 510 370 {
lab=GND}
N 450 320 470 320 {
lab=VB}
N 510 320 590 320 {
lab=GND}
C {devices/code.sym} 10 -160 0 0 {name=spice only_toplevel=false
format="tcleval( @value )"
value="	
**************************************************************
**************************************************************
**************************************************************
**************************************************************
**************************************************************
*LIBs*********************************************************
**************************************************************
**************************************************************
**************************************************************
**************************************************************
**************************************************************
.include $::180MCU_MODELS/design.ngspice
*.lib $::180MCU_MODELS/sm141064.ngspice statistical *use statistical if you want global and parameter mismatch
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.lib $::180MCU_MODELS/sm141064.ngspice bjt_typical
.lib $::180MCU_MODELS/sm141064.ngspice diode_typical
.lib $::180MCU_MODELS/sm141064.ngspice mimcap_typical
**************************************************************
**************************************************************
**************************************************************
**************************************************************
**************************************************************
*Corners/montecarlo options***********************************
**************************************************************
**************************************************************
**************************************************************
**************************************************************
**************************************************************
.TEMP 27
.param
+  sw_stat_global = 1
+  sw_stat_mism = 1
+ mc_skew = 3
+ res_mc_skew = 3
+ cap_mc_skew = 3
+ fnoicor = 1
**************************************************************
**************************************************************
**************************************************************
**************************************************************  
*SIMULATION and Plots*****************************************
**************************************************************
**************************************************************
**************************************************************
**************************************************************
.control
save all
dc V2 0 3.3 0.01 
*dc simulation
plot v(VOUT) v(VIN) deriv(v(VOUT))  
*ploting VIN VOUT and the voltage gain
plot i(Vmeas) 
*ploting the current for curiosity
tran 1ns 20u 
*transient simulation
plot (v(VINT)) (v(VOUTT)) 
*simple plot to exemplify the gain
fft v(VOUTT) v(VINT) 
*fast fourier transfor
plot mag(v(VOUTT)) mag(v(VINT)) 
* analyse the frequency spectrum of the transient waves, to detect distortion
ac dec 20 1 50G 
*simple ac simulation
plot v(VOUTT) 
*gain in function of the input frequency
.endc
"}
C {symbols/nfet_03v3.sym} 410 -290 0 0 {name=M1
L=0.5u
W=80u
nf=20
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {devices/ammeter.sym} 430 -370 0 0 {name=Vmeas}
C {devices/lab_pin.sym} 100 -440 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 430 -110 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 500 -290 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 100 -380 0 0 {name=V1 value=3.3
}
C {devices/vsource.sym} 180 -380 0 0 {name=V2 value=1.5}
C {devices/gnd.sym} 100 -330 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 430 -430 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 250 300 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 180 -440 0 0 {name=p3 sig_type=std_logic lab=VIN
}
C {devices/lab_pin.sym} 690 -230 2 0 {name=p5 sig_type=std_logic lab=VOUT}
C {devices/vsource.sym} 250 240 0 0 {name=V3 value="ac 1.0 sin (0 1m 100k)"}
C {devices/lab_pin.sym} 340 -290 0 0 {name=p4 sig_type=std_logic lab=VIN
}
C {devices/gnd.sym} 180 -310 0 0 {name=l5 lab=GND}
C {devices/res.sym} 650 -200 0 0 {name=R2
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 650 -150 0 0 {name=l6 lab=GND}
C {devices/capa.sym} 330 190 3 0 {name=C1
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 420 30 0 0 {name=p6 sig_type=std_logic lab=VIN
}
C {devices/res.sym} 420 80 0 0 {name=R3
value=10M
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 620 250 3 0 {name=C2
m=1
value=100m
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 690 280 0 0 {name=R5
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 690 330 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 730 250 2 0 {name=p8 sig_type=std_logic lab=VOUTT}
C {devices/lab_pin.sym} 260 190 1 0 {name=p9 sig_type=std_logic lab=VINT
}
C {symbols/nfet_03v3.sym} 490 190 0 0 {name=M2
L=0.5u
W=80u
nf=20
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {devices/ammeter.sym} 510 110 0 0 {name=Vmeas1}
C {devices/gnd.sym} 510 370 0 0 {name=l7 lab=GND}
C {devices/gnd.sym} 580 190 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} 510 50 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {symbols/nfet_03v3.sym} 410 -160 0 0 {name=M3
L=2u
W=10u
nf=5
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {devices/vsource.sym} -60 -350 0 0 {name=V4 value=1
}
C {devices/gnd.sym} -60 -310 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} -60 -410 0 0 {name=p10 sig_type=std_logic lab=VB}
C {devices/lab_pin.sym} 370 -160 0 0 {name=p11 sig_type=std_logic lab=VB}
C {devices/gnd.sym} 510 -160 0 0 {name=l11 lab=GND}
C {symbols/nfet_03v3.sym} 490 320 0 0 {name=M4
L=2u
W=10u
nf=5
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {devices/lab_pin.sym} 450 320 0 0 {name=p12 sig_type=std_logic lab=VB}
C {devices/gnd.sym} 590 320 0 0 {name=l12 lab=GND}
