v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {A unusual common Gate Amplifier configuration.
This is a strange variation of the common Gate amplifier stage.
a quirk about this amplifier is that by changing vb we can "shift the gain region"
this is caused, because by shifting VB the saturation region is being shifted too
and since the most gain happends when the NMOS is in saturation region. we can say
the gain is shifted in order of VIN.} 810 -210 0 0 0.4 0.4 {}
N 430 -400 430 -370 {
lab=#net1}
N 100 -350 100 -330 {
lab=GND}
N 100 -450 100 -410 {
lab=VDD}
N 430 -500 430 -460 {
lab=VDD}
N 180 -350 180 -330 {
lab=GND}
N 180 -450 180 -410 {
lab=VIN}
N 180 -330 180 -310 {
lab=GND}
N 250 490 250 520 {
lab=GND}
N 640 -260 680 -260 {
lab=VOUT}
N 250 410 300 410 {
lab=VINT}
N 250 410 250 430 {
lab=VINT}
N 360 410 430 410 {
lab=#net2}
N 420 330 420 410 {
lab=#net2}
N 420 250 420 270 {
lab=VIN}
N 720 150 760 150 {
lab=VOUTT}
N 720 210 720 230 {
lab=GND}
N 680 150 720 150 {
lab=VOUTT}
N 430 -370 430 -340 {
lab=#net1}
N 430 -270 430 -250 {
lab=VOUT}
N 430 -280 430 -270 {
lab=VOUT}
N 430 -260 530 -260 {
lab=VOUT}
N 530 -260 530 -250 {
lab=VOUT}
N 530 -260 640 -260 {
lab=VOUT}
N 580 -280 580 -260 {
lab=VOUT}
N 430 -190 430 -150 {
lab=VIN}
N 430 -150 530 -150 {
lab=VIN}
N 530 -190 530 -150 {
lab=VIN}
N 430 -220 470 -220 {
lab=GND}
N 450 -150 450 -140 {
lab=VIN}
N 360 -220 390 -220 {
lab=VB}
N 470 10 470 40 {
lab=#net3}
N 470 -90 470 -50 {
lab=VDD}
N 470 140 470 160 {
lab=#net4}
N 470 130 470 140 {
lab=#net4}
N 470 150 570 150 {
lab=#net4}
N 570 150 570 160 {
lab=#net4}
N 470 220 470 260 {
lab=#net2}
N 470 260 570 260 {
lab=#net2}
N 570 220 570 260 {
lab=#net2}
N 470 190 510 190 {
lab=GND}
N 490 260 490 270 {
lab=#net2}
N 570 150 580 150 {
lab=#net4}
N 640 150 680 150 {
lab=VOUTT}
N 450 -140 450 -120 {
lab=VIN}
N 0 -440 0 -410 {
lab=VB}
N 0 -350 0 -330 {
lab=GND}
N 490 270 490 410 {
lab=#net2}
N 430 410 490 410 {
lab=#net2}
N 400 190 430 190 {
lab=VB}
N 470 120 470 130 {
lab=#net4}
N 470 40 470 60 {
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
plot v(VOUT) v(VIN) deriv(v(VOUT))  
*ploting VIN VOUT and the voltage gain
plot i(Vmeas) 
*ploting the current for curiosity
tran 100ns 2m 
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
C {devices/ammeter.sym} 430 -430 0 0 {name=Vmeas}
C {devices/lab_pin.sym} 100 -440 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 100 -380 0 0 {name=V1 value=6
}
C {devices/vsource.sym} 180 -380 0 0 {name=V2 value=0.400}
C {devices/gnd.sym} 100 -330 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 430 -490 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 250 520 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 180 -440 0 0 {name=p3 sig_type=std_logic lab=VIN
}
C {devices/lab_pin.sym} 580 -280 1 0 {name=p5 sig_type=std_logic lab=VOUT}
C {devices/vsource.sym} 250 460 0 0 {name=V3 value="ac 1.0 sin (0 50m 1k)"}
C {devices/gnd.sym} 180 -310 0 0 {name=l5 lab=GND}
C {devices/lab_pin.sym} 420 250 0 0 {name=p6 sig_type=std_logic lab=VIN
}
C {devices/res.sym} 420 300 0 0 {name=R3
value=10M
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 720 180 0 0 {name=R5
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 720 230 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 760 150 2 0 {name=p8 sig_type=std_logic lab=VOUTT}
C {devices/lab_pin.sym} 260 410 1 0 {name=p9 sig_type=std_logic lab=VINT
}
C {devices/res.sym} 680 -230 0 0 {name=R1
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 680 -200 0 0 {name=l6 lab=GND}
C {devices/capa.sym} 330 410 3 0 {name=C1
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {symbols/nfet_06v0.sym} 410 -220 0 0 {name=M1
L=0.70u
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
C {devices/res.sym} 430 -310 0 0 {name=R2
value=10k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 530 -220 0 0 {name=R4
value=20k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 470 -220 0 0 {name=l1 lab=GND}
C {devices/ammeter.sym} 470 -20 0 0 {name=Vmeas1}
C {devices/lab_pin.sym} 470 -80 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {symbols/nfet_06v0.sym} 450 190 0 0 {name=M2
L=0.70u
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
C {devices/gnd.sym} 510 190 0 0 {name=l7 lab=GND}
C {devices/capa.sym} 610 150 3 0 {name=C2
m=1
value=1000m
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 450 -120 0 0 {name=p4 sig_type=std_logic lab=VIN
}
C {devices/vsource.sym} 0 -380 0 0 {name=V4 value=1.5}
C {devices/lab_pin.sym} 0 -440 0 0 {name=p10 sig_type=std_logic lab=VB}
C {devices/gnd.sym} 0 -330 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 360 -220 0 0 {name=p11 sig_type=std_logic lab=VB}
C {devices/lab_pin.sym} 400 190 0 0 {name=p12 sig_type=std_logic lab=VB}
C {devices/res.sym} 470 90 0 0 {name=R6
value=10k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 570 190 0 0 {name=R7
value=20k
footprint=1206
device=resistor
m=1}
