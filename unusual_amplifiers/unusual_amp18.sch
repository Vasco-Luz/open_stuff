v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {A CS degenerated source.
But here is an example how diode loads can make the gain more linear(at the sacrifice of a bigger gain)
Because diode loads work like variable resistances. post correcting some of the input transistor non-linearities
The gain can be easely be made more linear by reducing the overwall gain by half.} 530 -30 0 0 0.4 0.4 {}
N 100 -350 100 -330 {
lab=GND}
N 100 -450 100 -410 {
lab=VDD}
N 510 -680 510 -640 {
lab=VDD}
N 180 -350 180 -330 {
lab=GND}
N 180 -450 180 -410 {
lab=VIN}
N 180 -330 180 -310 {
lab=GND}
N 50 460 50 490 {
lab=GND}
N 630 -450 670 -450 {
lab=VOUT}
N 630 -390 630 -370 {
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
N 550 330 590 330 {
lab=VOUTT}
N 550 390 550 410 {
lab=GND}
N 510 330 550 330 {
lab=VOUTT}
N 510 -580 510 -570 {
lab=#net2}
N 510 -570 510 -540 {
lab=#net2}
N 510 -230 530 -230 {
lab=GND}
N 510 -200 510 -180 {
lab=GND}
N 510 -510 560 -510 {
lab=VDD}
N 460 -230 470 -230 {
lab=VA}
N 510 -180 510 -170 {
lab=GND}
N 510 -480 510 -430 {
lab=VOUT}
N 510 -370 510 -260 {
lab=VA}
N -40 -370 -40 -350 {
lab=GND}
N -40 -470 -40 -430 {
lab=VB3}
N -40 -350 -40 -330 {
lab=GND}
N -120 -380 -120 -360 {
lab=GND}
N -120 -480 -120 -440 {
lab=VB2}
N -120 -360 -120 -340 {
lab=GND}
N -220 -370 -220 -350 {
lab=GND}
N -220 -470 -220 -430 {
lab=VB1}
N -220 -350 -220 -330 {
lab=GND}
N 460 -400 470 -400 {
lab=VIN}
N 450 -510 470 -510 {
lab=VOUT}
N 510 -400 520 -400 {
lab=GND}
N 520 -400 550 -400 {
lab=GND}
N 460 -270 460 -230 {
lab=VA}
N 460 -270 510 -270 {
lab=VA}
N 450 -510 450 -480 {
lab=VOUT}
N 450 -480 510 -480 {
lab=VOUT}
N 510 -450 630 -450 {
lab=VOUT}
N 320 100 320 140 {
lab=VDD}
N 320 200 320 210 {
lab=#net3}
N 320 210 320 240 {
lab=#net3}
N 320 550 340 550 {
lab=GND}
N 320 580 320 600 {
lab=GND}
N 320 270 370 270 {
lab=VDD}
N 270 550 280 550 {
lab=#net4}
N 320 600 320 610 {
lab=GND}
N 320 300 320 350 {
lab=#net5}
N 320 410 320 520 {
lab=#net4}
N 270 380 280 380 {
lab=#net1}
N 260 270 280 270 {
lab=#net5}
N 320 380 330 380 {
lab=GND}
N 330 380 360 380 {
lab=GND}
N 270 510 270 550 {
lab=#net4}
N 270 510 320 510 {
lab=#net4}
N 260 270 260 300 {
lab=#net5}
N 260 300 320 300 {
lab=#net5}
N 320 330 450 330 {
lab=#net5}
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
C {devices/ammeter.sym} 510 -610 0 0 {name=Vmeas}
C {devices/lab_pin.sym} 100 -440 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 100 -380 0 0 {name=V1 value=6
}
C {devices/vsource.sym} 180 -380 0 0 {name=V2 value=2.25}
C {devices/gnd.sym} 100 -330 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 510 -670 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 50 490 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 180 -440 0 0 {name=p3 sig_type=std_logic lab=VIN
}
C {devices/lab_pin.sym} 670 -450 2 0 {name=p5 sig_type=std_logic lab=VOUT}
C {devices/vsource.sym} 50 430 0 0 {name=V3 value="ac 1.0 sin (0 100u 1k)"}
C {devices/gnd.sym} 180 -310 0 0 {name=l5 lab=GND}
C {devices/res.sym} 630 -420 0 0 {name=R2
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 630 -370 0 0 {name=l6 lab=GND}
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
C {devices/capa.sym} 480 330 3 0 {name=C2
m=1
value=1000m
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 550 360 0 0 {name=R5
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 550 410 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 590 330 2 0 {name=p8 sig_type=std_logic lab=VOUTT}
C {devices/lab_pin.sym} 60 380 1 0 {name=p9 sig_type=std_logic lab=VINT
}
C {symbols/nfet_06v0.sym} 490 -230 0 0 {name=M3
L=0.7u
W=80u
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
C {devices/lab_pin.sym} 460 -400 0 0 {name=p7 sig_type=std_logic lab=VIN
}
C {devices/gnd.sym} 530 -230 0 0 {name=l2 lab=GND}
C {symbols/pfet_06v0.sym} 490 -510 0 0 {name=M2
L=2u
W=10u
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
C {devices/lab_pin.sym} 560 -510 0 1 {name=p10 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 510 -330 0 0 {name=p11 sig_type=std_logic lab=VA
}
C {devices/vsource.sym} -40 -400 0 0 {name=V4 value=4.6}
C {devices/gnd.sym} -40 -330 0 0 {name=l8 lab=GND}
C {devices/vsource.sym} -120 -410 0 0 {name=V5 value=3.8}
C {devices/gnd.sym} -120 -340 0 0 {name=l10 lab=GND}
C {devices/vsource.sym} -220 -400 0 0 {name=V6 value=1}
C {devices/lab_pin.sym} -220 -460 0 0 {name=p15 sig_type=std_logic lab=VB1
}
C {devices/gnd.sym} -220 -330 0 0 {name=l11 lab=GND}
C {devices/lab_pin.sym} -120 -470 0 0 {name=p12 sig_type=std_logic lab=VB2
}
C {devices/lab_pin.sym} -40 -470 0 0 {name=p14 sig_type=std_logic lab=VB3

}
C {devices/gnd.sym} 510 -170 0 0 {name=l7 lab=GND}
C {symbols/nfet_06v0.sym} 490 -400 0 0 {name=M5
L=1u
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
C {devices/gnd.sym} 550 -400 0 0 {name=l12 lab=GND}
C {devices/ammeter.sym} 320 170 0 0 {name=Vmeas1}
C {devices/lab_pin.sym} 320 110 0 0 {name=p4 sig_type=std_logic lab=VDD}
C {symbols/nfet_06v0.sym} 300 550 0 0 {name=M1
L=0.7u
W=80u
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
C {devices/gnd.sym} 340 550 0 0 {name=l1 lab=GND}
C {symbols/pfet_06v0.sym} 300 270 0 0 {name=M4
L=2u
W=10u
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
C {devices/lab_pin.sym} 370 270 0 1 {name=p16 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 320 610 0 0 {name=l13 lab=GND}
C {symbols/nfet_06v0.sym} 300 380 0 0 {name=M6
L=1u
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
C {devices/gnd.sym} 360 380 0 0 {name=l14 lab=GND}
