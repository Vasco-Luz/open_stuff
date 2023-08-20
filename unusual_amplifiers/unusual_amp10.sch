v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {An cascode stage.
it has a really high gain in the cost of pacience to make. the game is so big that it creates distortion even with the smallest inputs
VB should be chosen so all transistors stay in saturation in the gain range pretended. then after the VBIAS are chosen
THe gain is directly dependent on GM1 and GM2 and inversely dependent on GM3. Them smaller the current source, the bigger the varitations. At a cost
the stage i made, i made it with too mutch gain.
NGsoice cant handle this type of simulations} 880 -260 0 0 0.4 0.4 {}
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
N 180 -330 180 -310 {
lab=GND}
N 50 460 50 490 {
lab=GND}
N 600 -260 640 -260 {
lab=VOUT}
N 430 -260 600 -260 {
lab=VOUT}
N 600 -200 600 -180 {
lab=GND}
N 50 380 100 380 {
lab=VINT}
N 50 380 50 400 {
lab=VINT}
N 160 380 230 380 {
lab=#net1}
N 230 380 270 380 {
lab=#net1}
N 220 300 220 380 {
lab=#net1}
N 220 220 220 240 {
lab=VIN}
N 690 250 730 250 {
lab=VOUTT}
N 690 310 690 330 {
lab=GND}
N 650 250 690 250 {
lab=VOUTT}
N -60 -320 -60 -310 {
lab=GND}
N -60 -410 -60 -380 {
lab=VB1}
N 430 -100 430 -90 {
lab=GND}
N 430 -190 430 -160 {
lab=VA}
N 430 -270 430 -250 {
lab=VOUT}
N 370 -130 390 -130 {
lab=VIN}
N 430 -220 470 -220 {
lab=GND}
N 430 -130 480 -130 {
lab=GND}
N 430 -340 430 -330 {
lab=#net2}
N 360 -300 390 -300 {
lab=VB1}
N 430 -300 470 -300 {
lab=VDD}
N -150 -320 -150 -310 {
lab=GND}
N -150 -410 -150 -380 {
lab=VB2}
N 360 -220 390 -220 {
lab=VB2}
N 420 70 420 110 {
lab=VDD}
N 420 410 420 420 {
lab=GND}
N 420 320 420 350 {
lab=VA}
N 420 240 420 260 {
lab=#net3}
N 360 380 380 380 {
lab=#net1}
N 420 290 460 290 {
lab=GND}
N 420 380 470 380 {
lab=GND}
N 420 170 420 180 {
lab=#net4}
N 350 210 380 210 {
lab=VB1}
N 420 210 460 210 {
lab=VDD}
N 350 290 380 290 {
lab=VB2}
N 270 380 360 380 {
lab=#net1}
N 420 250 590 250 {
lab=#net3}
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
dc V2 0 6 0.01 
*dc simulation
plot v(VOUT) v(VIN) deriv(v(VOUT)) v(VA)
plot v(VA)
*ploting VIN VOUT and the voltage gain
plot i(Vmeas) 
*ploting the current for curiosity
tran 1us 2m 
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
C {devices/ammeter.sym} 430 -370 0 0 {name=Vmeas}
C {devices/lab_pin.sym} 100 -440 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 100 -380 0 0 {name=V1 value=6
}
C {devices/vsource.sym} 180 -380 0 0 {name=V2 value=0.680}
C {devices/gnd.sym} 100 -330 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 430 -430 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 50 490 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 180 -440 0 0 {name=p3 sig_type=std_logic lab=VIN
}
C {devices/lab_pin.sym} 640 -260 2 0 {name=p5 sig_type=std_logic lab=VOUT}
C {devices/vsource.sym} 50 430 0 0 {name=V3 value="ac 1.0 sin (0 100u 1k)"}
C {devices/lab_pin.sym} 370 -130 0 0 {name=p4 sig_type=std_logic lab=VIN
}
C {devices/gnd.sym} 180 -310 0 0 {name=l5 lab=GND}
C {devices/res.sym} 600 -230 0 0 {name=R2
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 600 -180 0 0 {name=l6 lab=GND}
C {devices/capa.sym} 130 380 3 0 {name=C1
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 220 220 0 0 {name=p6 sig_type=std_logic lab=VIN
}
C {devices/res.sym} 220 270 0 0 {name=R3
value=10M
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 620 250 3 0 {name=C2
m=1
value=1000m
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 690 280 0 0 {name=R5
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 690 330 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 730 250 2 0 {name=p8 sig_type=std_logic lab=VOUTT}
C {devices/lab_pin.sym} 60 380 1 0 {name=p9 sig_type=std_logic lab=VINT
}
C {devices/vsource.sym} -60 -350 0 0 {name=V4 value=5
}
C {devices/gnd.sym} -60 -310 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} -60 -410 0 0 {name=p10 sig_type=std_logic lab=VB1}
C {symbols/pfet_06v0.sym} 410 -300 0 0 {name=M1
L=1u
W=40u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_06v0
spiceprefix=X
}
C {symbols/nfet_06v0.sym} 410 -220 0 0 {name=M2
L=0.70u
W=100u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_06v0
spiceprefix=X
}
C {symbols/nfet_06v0.sym} 410 -130 0 0 {name=M3
L=0.70u
W=100u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_06v0
spiceprefix=X
}
C {devices/gnd.sym} 430 -90 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 480 -130 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 470 -220 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} 360 -300 0 0 {name=p7 sig_type=std_logic lab=VB1}
C {devices/lab_pin.sym} 470 -300 2 0 {name=p11 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -150 -350 0 0 {name=V5 value=1.4
}
C {devices/gnd.sym} -150 -310 0 0 {name=l8 lab=GND
value=2}
C {devices/lab_pin.sym} -150 -410 0 0 {name=p12 sig_type=std_logic lab=VB2
value=2}
C {devices/lab_pin.sym} 360 -220 0 0 {name=p13 sig_type=std_logic lab=VB2
value=2}
C {devices/lab_pin.sym} 430 -170 2 0 {name=p14 sig_type=std_logic lab=VA}
C {devices/ammeter.sym} 420 140 0 0 {name=Vmeas1}
C {devices/lab_pin.sym} 420 80 0 0 {name=p15 sig_type=std_logic lab=VDD}
C {symbols/pfet_06v0.sym} 400 210 0 0 {name=M4
L=1u
W=40u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_06v0
spiceprefix=X
}
C {symbols/nfet_06v0.sym} 400 290 0 0 {name=M5
L=0.70u
W=100u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_06v0
spiceprefix=X
}
C {symbols/nfet_06v0.sym} 400 380 0 0 {name=M6
L=0.70u
W=100u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_06v0
spiceprefix=X
}
C {devices/gnd.sym} 420 420 0 0 {name=l11 lab=GND}
C {devices/gnd.sym} 470 380 0 0 {name=l12 lab=GND}
C {devices/gnd.sym} 460 290 0 0 {name=l13 lab=GND}
C {devices/lab_pin.sym} 350 210 0 0 {name=p17 sig_type=std_logic lab=VB1}
C {devices/lab_pin.sym} 460 210 2 0 {name=p18 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 350 290 0 0 {name=p19 sig_type=std_logic lab=VB2
value=2}
C {devices/lab_pin.sym} 420 340 2 0 {name=p20 sig_type=std_logic lab=VA}
