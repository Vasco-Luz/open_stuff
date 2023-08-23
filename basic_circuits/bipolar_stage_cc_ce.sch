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
N 940 400 980 400 {
lab=VOUTT1}
N 940 460 940 480 {
lab=GND}
N 900 400 940 400 {
lab=VOUTT1}
N -20 -360 -20 -350 {
lab=GND}
N -20 -450 -20 -420 {
lab=VB}
N 850 400 900 400 {
lab=VOUTT1}
N 450 350 500 350 {
lab=#net1}
N 820 400 850 400 {
lab=VOUTT1}
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
N 620 -210 620 -100 {
lab=GND}
N 620 -340 620 -270 {
lab=VOUT1}
N 620 -570 620 -400 {
lab=VDD}
N 570 40 570 80 {
lab=VDD}
N 570 350 610 350 {
lab=GND}
N 500 350 530 350 {
lab=#net1}
N 570 290 570 320 {
lab=#net3}
N 570 540 570 560 {
lab=#net4}
N 570 140 570 180 {
lab=#net3}
N 570 240 570 290 {
lab=#net3}
N 570 180 570 240 {
lab=#net3}
N 570 470 570 540 {
lab=#net4}
N 570 380 570 470 {
lab=#net4}
N 570 590 600 590 {
lab=GND}
N 520 590 530 590 {
lab=VB}
N 570 620 570 640 {
lab=GND}
N 600 590 610 590 {
lab=GND}
N 690 450 720 450 {
lab=#net4}
N 760 450 810 450 {
lab=GND}
N 760 480 760 590 {
lab=GND}
N 760 350 760 420 {
lab=#net5}
N 760 120 760 290 {
lab=VDD}
N 660 450 690 450 {
lab=#net4}
N 570 450 600 450 {
lab=#net4}
N 600 450 660 450 {
lab=#net4}
N 680 610 680 620 {
lab=GND}
N 680 530 680 550 {
lab=VOUTT}
N 680 450 680 470 {
lab=#net4}
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
C {devices/vsource.sym} 180 -380 0 0 {name=V2 value=1.530}
C {devices/gnd.sym} 100 -330 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 430 -640 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 270 460 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 180 -440 0 0 {name=p3 sig_type=std_logic lab=VIN
}
C {devices/lab_pin.sym} 550 -240 1 0 {name=p5 sig_type=std_logic lab=VOUT}
C {devices/vsource.sym} 270 400 0 0 {name=V3 value="ac 1.0 sin (0 1m 1k)"}
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
C {devices/res.sym} 940 430 0 0 {name=R5
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 940 480 0 0 {name=l9 lab=GND}
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
C {devices/capa.sym} 790 400 3 0 {name=C2
m=1
value=100m
footprint=1206
device="ceramic capacitor"}
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
C {devices/gnd.sym} 620 -100 0 0 {name=l12 lab=GND}
C {devices/res.sym} 620 -370 0 0 {name=R1
value=10k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 620 -570 0 0 {name=p12 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 620 -310 2 0 {name=p13 sig_type=std_logic lab=VOUT1}
C {devices/ammeter.sym} 570 110 0 0 {name=Vmeas1}
C {devices/lab_pin.sym} 570 50 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 680 540 2 0 {name=p14 sig_type=std_logic lab=VOUTT}
C {symbols/npn_10p00x10p00.sym} 550 350 0 0 {name=Q2
model=npn_10p00x10p00
spiceprefix=X
m=1}
C {devices/gnd.sym} 610 350 0 0 {name=l2 lab=GND}
C {symbols/nfet_06v0.sym} 550 590 0 0 {name=M2
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
C {devices/gnd.sym} 610 590 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} 520 590 0 0 {name=p16 sig_type=std_logic lab=VB}
C {devices/gnd.sym} 570 640 0 0 {name=l13 lab=GND}
C {symbols/npn_10p00x10p00.sym} 740 450 0 0 {name=Q4
model=npn_10p00x10p00
spiceprefix=X
m=1}
C {devices/gnd.sym} 810 450 0 0 {name=l14 lab=GND}
C {devices/gnd.sym} 760 590 0 0 {name=l15 lab=GND}
C {devices/res.sym} 760 320 0 0 {name=R2
value=10k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 760 120 0 0 {name=p17 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 980 400 2 0 {name=p18 sig_type=std_logic lab=VOUTT1}
C {devices/capa.sym} 680 500 0 0 {name=C3
m=1
value=100m
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 680 580 0 0 {name=R4
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 680 620 0 0 {name=l16 lab=GND}
