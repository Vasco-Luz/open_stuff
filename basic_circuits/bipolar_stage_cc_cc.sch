v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Basicly the input impedance is reduced because of the first stage. the current source is to try to make the gain of the first stage equal to one.} 810 -210 0 0 0.4 0.4 {}
N 100 -350 100 -330 {
lab=GND}
N 100 -450 100 -410 {
lab=VDD}
N 430 -650 430 -610 {
lab=VDD}
N 180 -350 180 -330 {
lab=GND}
N 180 -450 180 -410 {
lab=VIN}
N 180 -330 180 -310 {
lab=GND}
N 270 430 270 460 {
lab=GND}
N 270 350 320 350 {
lab=VINT}
N 270 350 270 370 {
lab=VINT}
N 380 350 450 350 {
lab=#net1}
N 440 270 440 350 {
lab=#net1}
N 440 190 440 210 {
lab=VIN}
N -20 -360 -20 -350 {
lab=GND}
N -20 -450 -20 -420 {
lab=VB}
N 450 350 500 350 {
lab=#net1}
N 430 -340 470 -340 {
lab=GND}
N 360 -340 390 -340 {
lab=VIN}
N 430 -400 430 -370 {
lab=#net2}
N 430 -150 430 -130 {
lab=VOUT}
N 430 -550 430 -510 {
lab=#net2}
N 430 -450 430 -400 {
lab=#net2}
N 430 -510 430 -450 {
lab=#net2}
N 430 -220 430 -150 {
lab=VOUT}
N 430 -310 430 -220 {
lab=VOUT}
N 430 -240 550 -240 {
lab=VOUT}
N 430 -100 460 -100 {
lab=GND}
N 380 -100 390 -100 {
lab=VB}
N 430 -70 430 -50 {
lab=GND}
N 460 -100 470 -100 {
lab=GND}
N 550 -240 580 -240 {
lab=VOUT}
N 620 -240 670 -240 {
lab=GND}
N 620 -570 620 -400 {
lab=VDD}
N 500 350 530 350 {
lab=#net1}
N 690 450 720 450 {
lab=VOUTT}
N 660 450 690 450 {
lab=VOUTT}
N 600 450 660 450 {
lab=VOUTT}
N 620 -120 620 -70 {
lab=GND}
N 620 -190 650 -190 {
lab=VOUT1}
N 620 -190 620 -180 {
lab=VOUT1}
N 620 -190 620 -180 {
lab=VOUT1}
N 620 -210 620 -190 {
lab=VOUT1}
N 620 -400 620 -270 {
lab=VDD}
N 600 40 600 80 {
lab=VDD}
N 600 350 640 350 {
lab=GND}
N 530 350 560 350 {
lab=#net1}
N 600 290 600 320 {
lab=#net3}
N 600 540 600 560 {
lab=VOUTT}
N 600 140 600 180 {
lab=#net3}
N 600 240 600 290 {
lab=#net3}
N 600 180 600 240 {
lab=#net3}
N 600 470 600 540 {
lab=VOUTT}
N 600 380 600 470 {
lab=VOUTT}
N 600 590 630 590 {
lab=GND}
N 550 590 560 590 {
lab=VB}
N 600 620 600 640 {
lab=GND}
N 630 590 640 590 {
lab=GND}
N 720 450 750 450 {
lab=VOUTT}
N 790 450 840 450 {
lab=GND}
N 790 120 790 290 {
lab=VDD}
N 790 570 790 620 {
lab=GND}
N 790 500 820 500 {
lab=#net4}
N 790 500 790 510 {
lab=#net4}
N 790 500 790 510 {
lab=#net4}
N 790 480 790 500 {
lab=#net4}
N 790 290 790 420 {
lab=VDD}
N 940 500 980 500 {
lab=VOUTT1}
N 940 560 940 580 {
lab=GND}
N 900 500 940 500 {
lab=VOUTT1}
N 880 500 900 500 {
lab=VOUTT1}
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
plot v(VOUT) v(VIN) deriv(v(VOUT)) v(VOUT1)  
plot v(VOUT1)  deriv(v(VOUT1))
*ploting VIN VOUT and the voltage gain
plot i(Vmeas) 
*ploting the current for curiosity
tran 100ns 2m 
*transient simulation
plot (v(VINT)) (v(VOUTT)) (v(VOUTT1))
*simple plot to exemplify the gain
fft v(VOUTT) v(VINT) (v(VOUTT1))
*fast fourier transfor
plot mag(v(VOUTT)) mag(v(VINT)) mag(v(VOUTT1))
* analyse the frequency spectrum of the transient waves, to detect distortion
ac dec 20 1 50G 
*simple ac simulation
plot v(VOUTT1) 
plot v(VOUTT)
*gain in function of the input frequency
.endc
"}
C {devices/ammeter.sym} 430 -580 0 0 {name=Vmeas}
C {devices/lab_pin.sym} 100 -440 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 100 -380 0 0 {name=V1 value=6
}
C {devices/vsource.sym} 180 -380 0 0 {name=V2 value=3}
C {devices/gnd.sym} 100 -330 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 430 -640 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 270 460 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 180 -440 0 0 {name=p3 sig_type=std_logic lab=VIN
}
C {devices/lab_pin.sym} 550 -240 1 0 {name=p5 sig_type=std_logic lab=VOUT}
C {devices/vsource.sym} 270 400 0 0 {name=V3 value="ac 1.0 sin (0 10m 1k)"}
C {devices/lab_pin.sym} 360 -340 0 0 {name=p4 sig_type=std_logic lab=VIN
}
C {devices/gnd.sym} 180 -310 0 0 {name=l5 lab=GND}
C {devices/lab_pin.sym} 440 190 0 0 {name=p6 sig_type=std_logic lab=VIN
}
C {devices/res.sym} 440 240 0 0 {name=R3
value=10M
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 280 350 1 0 {name=p9 sig_type=std_logic lab=VINT
}
C {devices/vsource.sym} -20 -390 0 0 {name=V4 value=0.9}
C {devices/gnd.sym} -20 -350 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} -20 -450 0 0 {name=p11 sig_type=std_logic lab=VB}
C {devices/capa.sym} 350 350 3 0 {name=C1
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {symbols/npn_10p00x10p00.sym} 410 -340 0 0 {name=Q1
model=npn_10p00x10p00
spiceprefix=X
m=1}
C {devices/gnd.sym} 470 -340 0 0 {name=l1 lab=GND}
C {symbols/nfet_06v0.sym} 410 -100 0 0 {name=M1
L=3u
W=10u
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
C {devices/gnd.sym} 470 -100 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 380 -100 0 0 {name=p10 sig_type=std_logic lab=VB}
C {devices/gnd.sym} 430 -50 0 0 {name=l7 lab=GND}
C {symbols/npn_10p00x10p00.sym} 600 -240 0 0 {name=Q3
model=npn_10p00x10p00
spiceprefix=X
m=1}
C {devices/gnd.sym} 670 -240 0 0 {name=l11 lab=GND}
C {devices/gnd.sym} 620 -70 0 0 {name=l12 lab=GND}
C {devices/res.sym} 620 -150 0 0 {name=R1
value=10k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 620 -570 0 0 {name=p12 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 650 -190 2 0 {name=p13 sig_type=std_logic lab=VOUT1}
C {devices/lab_pin.sym} 600 470 0 0 {name=p14 sig_type=std_logic lab=VOUTT}
C {devices/ammeter.sym} 600 110 0 0 {name=Vmeas1}
C {devices/lab_pin.sym} 600 50 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {symbols/npn_10p00x10p00.sym} 580 350 0 0 {name=Q2
model=npn_10p00x10p00
spiceprefix=X
m=1}
C {devices/gnd.sym} 640 350 0 0 {name=l2 lab=GND}
C {symbols/nfet_06v0.sym} 580 590 0 0 {name=M2
L=3u
W=10u
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
C {devices/gnd.sym} 640 590 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} 550 590 0 0 {name=p15 sig_type=std_logic lab=VB}
C {devices/gnd.sym} 600 640 0 0 {name=l13 lab=GND}
C {symbols/npn_10p00x10p00.sym} 770 450 0 0 {name=Q4
model=npn_10p00x10p00
spiceprefix=X
m=1}
C {devices/gnd.sym} 840 450 0 0 {name=l14 lab=GND}
C {devices/gnd.sym} 790 620 0 0 {name=l15 lab=GND}
C {devices/res.sym} 790 540 0 0 {name=R2
value=10k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 790 120 0 0 {name=p16 sig_type=std_logic lab=VDD}
C {devices/res.sym} 940 530 0 0 {name=R6
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 940 580 0 0 {name=l17 lab=GND}
C {devices/lab_pin.sym} 980 500 2 0 {name=p8 sig_type=std_logic lab=VOUTT1}
C {devices/capa.sym} 850 500 3 0 {name=C2
m=1
value=100m
footprint=1206
device="ceramic capacitor"}
