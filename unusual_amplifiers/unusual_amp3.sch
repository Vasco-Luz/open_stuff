v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {A unusual common Source Amplifier configuration.
In this configuration in the beggining there is a small positive gain the it rapidly shifts to a negative gain.
the gain curve has a zone where is relatively linear yeat it doenst offer a great gain, only by adding big ohmic resistances.
Vout initial is dependent on the relation between RD and RF. VOUT initial = VDD *(RF)/(RF+RD)
} 810 -210 0 0 0.4 0.4 {}
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
N 100 270 100 300 {
lab=GND}
N 640 -260 680 -260 {
lab=VOUT}
N 100 190 150 190 {
lab=VINT}
N 100 190 100 210 {
lab=VINT}
N 210 190 280 190 {
lab=#net2}
N 270 110 270 190 {
lab=#net2}
N 270 30 270 50 {
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
N 530 -260 640 -260 {
lab=VOUT}
N 580 -280 580 -260 {
lab=VOUT}
N 430 -220 470 -220 {
lab=GND}
N 360 -220 390 -220 {
lab=VIN}
N 470 10 470 40 {
lab=#net3}
N 470 -90 470 -50 {
lab=VDD}
N 640 150 680 150 {
lab=VOUTT}
N 240 -220 310 -220 {
lab=VIN}
N 310 -220 360 -220 {
lab=VIN}
N 310 -280 430 -280 {
lab=VOUT}
N 430 -190 430 -170 {
lab=GND}
N 470 40 470 70 {
lab=#net3}
N 470 140 470 160 {
lab=#net4}
N 470 130 470 140 {
lab=#net4}
N 470 190 510 190 {
lab=GND}
N 400 190 430 190 {
lab=#net2}
N 350 190 400 190 {
lab=#net2}
N 350 130 470 130 {
lab=#net4}
N 470 220 470 240 {
lab=GND}
N 280 190 350 190 {
lab=#net2}
N 470 150 580 150 {
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
C {devices/vsource.sym} 180 -380 0 0 {name=V2 value=1.450}
C {devices/gnd.sym} 100 -330 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 430 -490 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 100 300 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 180 -440 0 0 {name=p3 sig_type=std_logic lab=VIN
}
C {devices/lab_pin.sym} 580 -280 1 0 {name=p5 sig_type=std_logic lab=VOUT}
C {devices/vsource.sym} 100 240 0 0 {name=V3 value="ac 1.0 sin (0 50m 1k)"}
C {devices/gnd.sym} 180 -310 0 0 {name=l5 lab=GND}
C {devices/lab_pin.sym} 270 30 0 0 {name=p6 sig_type=std_logic lab=VIN
}
C {devices/res.sym} 270 80 0 0 {name=R3
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
C {devices/lab_pin.sym} 110 190 1 0 {name=p9 sig_type=std_logic lab=VINT
}
C {devices/res.sym} 680 -230 0 0 {name=R1
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 680 -200 0 0 {name=l6 lab=GND}
C {devices/capa.sym} 180 190 3 0 {name=C1
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {symbols/nfet_06v0.sym} 410 -220 0 0 {name=M1
L=0.70u
W=50u
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
value=2k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 310 -250 0 0 {name=R4
value=20k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 470 -220 0 0 {name=l1 lab=GND}
C {devices/ammeter.sym} 470 -20 0 0 {name=Vmeas1}
C {devices/lab_pin.sym} 470 -80 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {devices/capa.sym} 610 150 3 0 {name=C2
m=1
value=1000m
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 240 -220 0 0 {name=p4 sig_type=std_logic lab=VIN
}
C {devices/gnd.sym} 430 -170 0 0 {name=l2 lab=GND}
C {symbols/nfet_06v0.sym} 450 190 0 0 {name=M2
L=0.70u
W=50u
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
C {devices/res.sym} 470 100 0 0 {name=R6
value=2k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 350 160 0 0 {name=R7
value=20k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 510 190 0 0 {name=l7 lab=GND}
C {devices/gnd.sym} 470 240 0 0 {name=l8 lab=GND}
