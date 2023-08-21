v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Basic common emitter stage 
The gain larguer then a cs stage
but the consumption outweights the gain} 810 -210 0 0 0.4 0.4 {}
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
N 340 -190 390 -190 {
lab=VIN}
N 180 -330 180 -310 {
lab=GND}
N 250 270 250 300 {
lab=GND}
N 650 -230 690 -230 {
lab=VOUT}
N 480 -230 650 -230 {
lab=VOUT}
N 250 190 300 190 {
lab=VINT}
N 250 190 250 210 {
lab=VINT}
N 360 190 430 190 {
lab=#net2}
N 420 110 420 190 {
lab=#net2}
N 420 30 420 50 {
lab=VIN}
N 730 130 770 130 {
lab=VOUTT}
N 730 190 730 210 {
lab=GND}
N 690 130 730 130 {
lab=VOUTT}
N 430 -370 430 -340 {
lab=#net1}
N -20 -360 -20 -350 {
lab=GND}
N -20 -450 -20 -420 {
lab=VB}
N 640 130 690 130 {
lab=VOUTT}
N 430 -280 430 -220 {
lab=VOUT}
N 430 -230 480 -230 {
lab=VOUT}
N 430 -160 430 -140 {
lab=GND}
N 430 -190 430 -160 {
lab=GND}
N 520 -20 520 10 {
lab=#net3}
N 520 -120 520 -80 {
lab=VDD}
N 430 190 480 190 {
lab=#net2}
N 520 10 520 40 {
lab=#net3}
N 520 100 520 160 {
lab=#net4}
N 520 220 520 240 {
lab=GND}
N 520 190 520 220 {
lab=GND}
N 520 130 550 130 {
lab=#net4}
N 610 130 640 130 {
lab=VOUTT}
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
C {devices/vsource.sym} 180 -380 0 0 {name=V2 value=0.870}
C {devices/gnd.sym} 100 -330 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 430 -490 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 250 300 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 180 -440 0 0 {name=p3 sig_type=std_logic lab=VIN
}
C {devices/lab_pin.sym} 580 -230 1 0 {name=p5 sig_type=std_logic lab=VOUT}
C {devices/vsource.sym} 250 240 0 0 {name=V3 value="ac 1.0 sin (0 10m 1k)"}
C {devices/lab_pin.sym} 340 -190 0 0 {name=p4 sig_type=std_logic lab=VIN
}
C {devices/gnd.sym} 180 -310 0 0 {name=l5 lab=GND}
C {devices/lab_pin.sym} 420 30 0 0 {name=p6 sig_type=std_logic lab=VIN
}
C {devices/res.sym} 420 80 0 0 {name=R3
value=10M
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 730 160 0 0 {name=R5
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 730 210 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 770 130 2 0 {name=p8 sig_type=std_logic lab=VOUTT}
C {devices/lab_pin.sym} 260 190 1 0 {name=p9 sig_type=std_logic lab=VINT
}
C {devices/vsource.sym} -20 -390 0 0 {name=V4 value=2.6}
C {devices/gnd.sym} -20 -350 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} -20 -450 0 0 {name=p11 sig_type=std_logic lab=VB}
C {devices/res.sym} 690 -200 0 0 {name=R1
value=10G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 690 -170 0 0 {name=l6 lab=GND}
C {devices/capa.sym} 330 190 3 0 {name=C1
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 430 -310 0 0 {name=R2
value=1k
footprint=1206
device=resistor
m=1}
C {symbols/npn_10p00x10p00.sym} 410 -190 0 0 {name=Q1
model=npn_10p00x10p00
spiceprefix=X
m=1}
C {devices/gnd.sym} 430 -140 0 0 {name=l1 lab=GND}
C {devices/ammeter.sym} 520 -50 0 0 {name=Vmeas1}
C {devices/lab_pin.sym} 520 -110 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {devices/res.sym} 520 70 0 0 {name=R4
value=1k
footprint=1206
device=resistor
m=1}
C {symbols/npn_10p00x10p00.sym} 500 190 0 0 {name=Q2
model=npn_10p00x10p00
spiceprefix=X
m=1}
C {devices/gnd.sym} 520 240 0 0 {name=l2 lab=GND}
C {devices/capa.sym} 580 130 3 0 {name=C2
m=1
value=1
footprint=1206
device="ceramic capacitor"}
