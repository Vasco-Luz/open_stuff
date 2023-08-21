v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {A cascode common gate amp. first the vbias were chosen so the transistors stay in saturation for the
the biggest gain region.
Then the w/l ratios and some vbias were changes.
It can be observed that it has a very high gain. common in cascode stages.

} 530 -30 0 0 0.4 0.4 {}
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
N 630 -330 670 -330 {
lab=VOUT}
N 630 -270 630 -250 {
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
N 630 230 670 230 {
lab=VOUTT}
N 630 290 630 310 {
lab=GND}
N 590 230 630 230 {
lab=VOUTT}
N 510 -580 510 -570 {
lab=#net2}
N 510 -570 510 -540 {
lab=#net2}
N 510 -230 530 -230 {
lab=GND}
N 510 -200 510 -180 {
lab=VIN}
N 510 -510 560 -510 {
lab=VDD}
N 460 -230 470 -230 {
lab=VB1}
N 510 -180 510 -170 {
lab=VIN}
N 370 230 530 230 {
lab=#net3}
N 510 -480 510 -430 {
lab=VA}
N 510 -370 510 -260 {
lab=VOUT}
N 510 -330 630 -330 {
lab=VOUT}
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
lab=VB2}
N 450 -510 470 -510 {
lab=VB3}
N 510 -400 520 -400 {
lab=VA}
N 520 -430 520 -400 {
lab=VA}
N 510 -430 520 -430 {
lab=VA}
N 370 -140 370 -100 {
lab=VDD}
N 370 -40 370 -30 {
lab=#net4}
N 370 -30 370 0 {
lab=#net4}
N 370 310 390 310 {
lab=GND}
N 370 340 370 360 {
lab=#net1}
N 370 30 420 30 {
lab=VDD}
N 320 310 330 310 {
lab=VB1}
N 370 360 370 370 {
lab=#net1}
N 370 60 370 110 {
lab=VA}
N 370 170 370 280 {
lab=#net3}
N 320 140 330 140 {
lab=VB2}
N 310 30 330 30 {
lab=VB3}
N 370 140 380 140 {
lab=VA}
N 380 110 380 140 {
lab=VA}
N 370 110 380 110 {
lab=VA}
N 270 380 370 380 {
lab=#net1}
N 370 370 370 380 {
lab=#net1}
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
C {devices/vsource.sym} 180 -380 0 0 {name=V2 value=0.125}
C {devices/gnd.sym} 100 -330 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 510 -670 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 50 490 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 180 -440 0 0 {name=p3 sig_type=std_logic lab=VIN
}
C {devices/lab_pin.sym} 670 -330 2 0 {name=p5 sig_type=std_logic lab=VOUT}
C {devices/vsource.sym} 50 430 0 0 {name=V3 value="ac 1.0 sin (0 100u 1k)"}
C {devices/gnd.sym} 180 -310 0 0 {name=l5 lab=GND}
C {devices/res.sym} 630 -300 0 0 {name=R2
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 630 -250 0 0 {name=l6 lab=GND}
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
C {devices/capa.sym} 560 230 3 0 {name=C2
m=1
value=1000m
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 630 260 0 0 {name=R5
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 630 310 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 670 230 2 0 {name=p8 sig_type=std_logic lab=VOUTT}
C {devices/lab_pin.sym} 60 380 1 0 {name=p9 sig_type=std_logic lab=VINT
}
C {symbols/nfet_06v0.sym} 490 -230 0 0 {name=M3
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
C {devices/lab_pin.sym} 510 -170 0 0 {name=p7 sig_type=std_logic lab=VIN
}
C {devices/gnd.sym} 530 -230 0 0 {name=l2 lab=GND}
C {symbols/pfet_06v0.sym} 490 -510 0 0 {name=M2
L=2u
W=60u
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
C {devices/lab_pin.sym} 510 -450 0 0 {name=p11 sig_type=std_logic lab=VA
}
C {symbols/pfet_06v0.sym} 490 -400 0 0 {name=M5
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
model=pfet_06v0
spiceprefix=X
}
C {devices/vsource.sym} -40 -400 0 0 {name=V4 value=4.6}
C {devices/gnd.sym} -40 -330 0 0 {name=l8 lab=GND}
C {devices/vsource.sym} -120 -410 0 0 {name=V5 value=3.8}
C {devices/gnd.sym} -120 -340 0 0 {name=l10 lab=GND}
C {devices/vsource.sym} -220 -400 0 0 {name=V6 value=1}
C {devices/lab_pin.sym} -220 -460 0 0 {name=p15 sig_type=std_logic lab=VB1
}
C {devices/gnd.sym} -220 -330 0 0 {name=l11 lab=GND}
C {devices/lab_pin.sym} 460 -230 0 0 {name=p16 sig_type=std_logic lab=VB1
}
C {devices/lab_pin.sym} -120 -470 0 0 {name=p12 sig_type=std_logic lab=VB2
}
C {devices/lab_pin.sym} -40 -470 0 0 {name=p14 sig_type=std_logic lab=VB3

}
C {devices/lab_pin.sym} 460 -400 0 0 {name=p17 sig_type=std_logic lab=VB2
}
C {devices/lab_pin.sym} 450 -510 0 0 {name=p18 sig_type=std_logic lab=VB3

}
C {devices/ammeter.sym} 370 -70 0 0 {name=Vmeas1}
C {devices/lab_pin.sym} 370 -130 0 0 {name=p4 sig_type=std_logic lab=VDD}
C {symbols/nfet_06v0.sym} 350 310 0 0 {name=M1
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
C {devices/gnd.sym} 390 310 0 0 {name=l1 lab=GND}
C {symbols/pfet_06v0.sym} 350 30 0 0 {name=M4
L=2u
W=60u
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
C {devices/lab_pin.sym} 420 30 0 1 {name=p19 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 370 90 0 0 {name=p20 sig_type=std_logic lab=VA
}
C {symbols/pfet_06v0.sym} 350 140 0 0 {name=M6
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
model=pfet_06v0
spiceprefix=X
}
C {devices/lab_pin.sym} 320 310 0 0 {name=p21 sig_type=std_logic lab=VB1
}
C {devices/lab_pin.sym} 320 140 0 0 {name=p22 sig_type=std_logic lab=VB2
}
C {devices/lab_pin.sym} 310 30 0 0 {name=p23 sig_type=std_logic lab=VB3

}
