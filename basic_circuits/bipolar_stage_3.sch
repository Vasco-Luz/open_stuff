v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {emitter follower, has a very low output impedance. good to drive loads.} 810 -210 0 0 0.4 0.4 {}
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
N 270 430 270 460 {
lab=GND}
N 650 -230 690 -230 {
lab=VOUT}
N 480 -230 650 -230 {
lab=VOUT}
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
N 800 460 840 460 {
lab=VOUTT}
N 800 520 800 540 {
lab=GND}
N 760 460 800 460 {
lab=VOUTT}
N -20 -360 -20 -350 {
lab=GND}
N -20 -450 -20 -420 {
lab=VB}
N 710 460 760 460 {
lab=VOUTT}
N 450 350 500 350 {
lab=#net1}
N 680 460 710 460 {
lab=VOUTT}
N 430 -340 470 -340 {
lab=GND}
N 360 -340 390 -340 {
lab=VIN}
N 430 -400 430 -370 {
lab=#net2}
N 430 -310 430 -210 {
lab=VOUT}
N 430 -230 480 -230 {
lab=VOUT}
N 430 -150 430 -130 {
lab=GND}
N 570 190 570 230 {
lab=VDD}
N 570 350 610 350 {
lab=GND}
N 500 350 530 350 {
lab=#net1}
N 570 290 570 320 {
lab=#net3}
N 570 380 570 480 {
lab=#net4}
N 570 460 620 460 {
lab=#net4}
N 570 540 570 560 {
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
C {devices/vsource.sym} 180 -380 0 0 {name=V2 value=4}
C {devices/gnd.sym} 100 -330 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 430 -490 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 270 460 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 180 -440 0 0 {name=p3 sig_type=std_logic lab=VIN
}
C {devices/lab_pin.sym} 580 -230 1 0 {name=p5 sig_type=std_logic lab=VOUT}
C {devices/vsource.sym} 270 400 0 0 {name=V3 value="ac 1.0 sin (0 1 1k)"}
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
C {devices/res.sym} 800 490 0 0 {name=R5
value=1k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 800 540 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 840 460 2 0 {name=p8 sig_type=std_logic lab=VOUTT}
C {devices/lab_pin.sym} 280 350 1 0 {name=p9 sig_type=std_logic lab=VINT
}
C {devices/vsource.sym} -20 -390 0 0 {name=V4 value=1}
C {devices/gnd.sym} -20 -350 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} -20 -450 0 0 {name=p11 sig_type=std_logic lab=VB}
C {devices/res.sym} 690 -200 0 0 {name=R1
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 690 -170 0 0 {name=l6 lab=GND}
C {devices/capa.sym} 350 350 3 0 {name=C1
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 430 -180 0 0 {name=R2
value=1k
footprint=1206
device=resistor
m=1}
C {symbols/npn_10p00x10p00.sym} 410 -340 0 0 {name=Q1
model=npn_10p00x10p00
spiceprefix=X
m=1}
C {devices/capa.sym} 650 460 3 0 {name=C2
m=1
value=100m
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 470 -340 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 430 -130 0 0 {name=l7 lab=GND}
C {devices/ammeter.sym} 570 260 0 0 {name=Vmeas1}
C {devices/lab_pin.sym} 570 200 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {devices/res.sym} 570 510 0 0 {name=R4
value=1k
footprint=1206
device=resistor
m=1}
C {symbols/npn_10p00x10p00.sym} 550 350 0 0 {name=Q2
model=npn_10p00x10p00
spiceprefix=X
m=1}
C {devices/gnd.sym} 610 350 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 570 560 0 0 {name=l8 lab=GND}
