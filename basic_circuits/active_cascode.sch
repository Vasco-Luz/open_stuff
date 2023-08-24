v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {An active cascode stage} 880 -260 0 0 0.4 0.4 {}
N 430 -250 430 -220 {
lab=VA}
N 430 -500 430 -470 {
lab=#net1}
N 430 -160 430 -130 {
lab=GND}
N 430 -130 430 -110 {
lab=GND}
N 430 -190 500 -190 {
lab=GND}
N -150 -380 -150 -360 {
lab=GND}
N -150 -480 -150 -440 {
lab=VDD}
N 430 -600 430 -560 {
lab=VDD}
N -70 -380 -70 -360 {
lab=GND}
N -70 -480 -70 -440 {
lab=VIN}
N 340 -190 390 -190 {
lab=VIN}
N -70 -360 -70 -340 {
lab=GND}
N 60 520 60 550 {
lab=GND}
N 570 -410 610 -410 {
lab=VOUT}
N 570 -350 570 -330 {
lab=GND}
N 60 440 110 440 {
lab=VINT}
N 60 440 60 460 {
lab=VINT}
N 170 440 240 440 {
lab=#net2}
N 240 440 280 440 {
lab=#net2}
N 230 360 230 440 {
lab=#net2}
N 230 280 230 300 {
lab=VIN}
N 500 240 620 240 {
lab=#net3}
N 720 240 760 240 {
lab=VOUTT}
N 720 300 720 320 {
lab=GND}
N 680 240 720 240 {
lab=VOUTT}
N 430 -340 480 -340 {
lab=GND}
N 430 -410 430 -370 {
lab=VOUT}
N 430 -310 430 -250 {
lab=VA}
N 430 -410 570 -410 {
lab=VOUT}
N 270 -560 270 -470 {
lab=VDD}
N 270 -560 430 -560 {
lab=VDD}
N 230 -440 270 -440 {
lab=VDD}
N 30 -530 30 -510 {
lab=GND}
N 30 -630 30 -590 {
lab=VB}
N 30 -510 30 -490 {
lab=GND}
N 310 -440 330 -440 {
lab=VB}
N 270 -410 270 -310 {
lab=VC}
N 270 -250 270 -120 {
lab=GND}
N 260 -280 270 -280 {
lab=GND}
N 260 -280 260 -230 {
lab=GND}
N 260 -230 270 -230 {
lab=GND}
N 270 -340 390 -340 {
lab=VC}
N 310 -280 430 -280 {
lab=VA}
N 500 380 500 410 {
lab=VA}
N 500 130 500 160 {
lab=#net4}
N 500 470 500 500 {
lab=GND}
N 500 500 500 520 {
lab=GND}
N 500 440 570 440 {
lab=GND}
N 500 30 500 70 {
lab=VDD}
N 410 440 460 440 {
lab=#net2}
N 500 290 550 290 {
lab=GND}
N 500 220 500 260 {
lab=#net3}
N 500 320 500 380 {
lab=VA}
N 340 70 340 160 {
lab=VDD}
N 340 70 500 70 {
lab=VDD}
N 300 190 340 190 {
lab=VDD}
N 380 190 400 190 {
lab=VB}
N 340 220 340 320 {
lab=VC}
N 340 380 340 510 {
lab=GND}
N 330 350 340 350 {
lab=GND}
N 330 350 330 400 {
lab=GND}
N 330 400 340 400 {
lab=GND}
N 340 290 460 290 {
lab=VC}
N 380 350 500 350 {
lab=VA}
N 280 440 410 440 {
lab=#net2}
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
plot v(VOUT) v(VIN) deriv(v(VOUT)) v(VA) v(VC)
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
C {devices/ammeter.sym} 430 -530 0 0 {name=Vmeas}
C {devices/lab_pin.sym} -150 -470 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 430 -110 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 500 -190 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} -150 -410 0 0 {name=V1 value=6
}
C {devices/vsource.sym} -70 -410 0 0 {name=V2 value=0.860}
C {devices/gnd.sym} -150 -360 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 430 -590 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 60 550 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} -70 -470 0 0 {name=p3 sig_type=std_logic lab=VIN
}
C {devices/lab_pin.sym} 610 -410 2 0 {name=p5 sig_type=std_logic lab=VOUT}
C {devices/vsource.sym} 60 490 0 0 {name=V3 value="ac 1.0 sin (0 1m 100k)"}
C {devices/res.sym} 430 -440 0 0 {name=R1
value=20k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 340 -190 2 1 {name=p4 sig_type=std_logic lab=VIN
}
C {devices/gnd.sym} -70 -340 0 0 {name=l5 lab=GND}
C {devices/res.sym} 570 -380 0 0 {name=R2
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 570 -330 0 0 {name=l6 lab=GND}
C {devices/capa.sym} 140 440 3 0 {name=C1
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 230 280 0 0 {name=p6 sig_type=std_logic lab=VIN
}
C {devices/res.sym} 230 330 0 0 {name=R3
value=10M
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 650 240 3 0 {name=C2
m=1
value=100m
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 720 270 0 0 {name=R5
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 720 320 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 760 240 2 0 {name=p8 sig_type=std_logic lab=VOUTT}
C {devices/lab_pin.sym} 70 440 1 0 {name=p9 sig_type=std_logic lab=VINT
}
C {devices/gnd.sym} 480 -340 0 0 {name=l10 lab=GND}
C {symbols/pfet_06v0.sym} 290 -440 0 1 {name=M4
L=2u
W=20u
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
C {symbols/nfet_06v0.sym} 410 -340 0 0 {name=M5
L=0.7u
W=60u
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
C {symbols/nfet_06v0.sym} 410 -190 0 0 {name=M1
L=0.7u
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
C {devices/lab_pin.sym} 230 -440 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 30 -560 0 0 {name=V4 value=4.5}
C {devices/lab_pin.sym} 30 -620 0 0 {name=p11 sig_type=std_logic lab=VB
value=5}
C {devices/gnd.sym} 30 -490 0 0 {name=l11 lab=GND
value=5}
C {devices/lab_pin.sym} 330 -440 2 0 {name=p12 sig_type=std_logic lab=VB
value=5}
C {symbols/nfet_06v0.sym} 290 -280 0 1 {name=M3
L=1.2u
W=70u
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
C {devices/gnd.sym} 270 -120 0 0 {name=l12 lab=GND}
C {devices/lab_pin.sym} 430 -270 2 0 {name=p13 sig_type=std_logic lab=VA
value=5}
C {devices/lab_pin.sym} 270 -360 0 0 {name=p14 sig_type=std_logic lab=VC   
value=5}
C {devices/ammeter.sym} 500 100 0 0 {name=Vmeas1}
C {devices/gnd.sym} 500 520 0 0 {name=l7 lab=GND}
C {devices/gnd.sym} 570 440 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} 500 40 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {devices/res.sym} 500 190 0 0 {name=R4
value=20k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 550 290 0 0 {name=l13 lab=GND}
C {symbols/pfet_06v0.sym} 360 190 0 1 {name=M2
L=2u
W=20u
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
C {symbols/nfet_06v0.sym} 480 290 0 0 {name=M6
L=0.7u
W=60u
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
C {symbols/nfet_06v0.sym} 480 440 0 0 {name=M7
L=0.7u
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
C {devices/lab_pin.sym} 300 190 0 0 {name=p16 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 400 190 2 0 {name=p17 sig_type=std_logic lab=VB
value=5}
C {symbols/nfet_06v0.sym} 360 350 0 1 {name=M8
L=1.2u
W=70u
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
C {devices/gnd.sym} 340 510 0 0 {name=l14 lab=GND}
C {devices/lab_pin.sym} 500 360 2 0 {name=p18 sig_type=std_logic lab=VA
value=5}
C {devices/lab_pin.sym} 340 270 0 0 {name=p19 sig_type=std_logic lab=VC   
value=5}
