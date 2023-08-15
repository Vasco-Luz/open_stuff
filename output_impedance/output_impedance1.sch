v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 0 -370 0 -350 {
lab=GND}
N 0 -470 0 -430 {
lab=VDD}
N 80 -370 80 -350 {
lab=#net1}
N 80 -470 80 -430 {
lab=VIN}
N 80 -350 80 -330 {
lab=#net1}
N 80 -270 80 -240 {
lab=GND}
N 430 -210 460 -210 {
lab=GND}
N 430 -180 430 -160 {
lab=GND}
N -130 -360 -130 -340 {
lab=GND}
N -130 -460 -130 -420 {
lab=VB}
N 430 -560 430 -530 {
lab=VDD}
N 430 -530 430 -520 {
lab=VDD}
N 370 -210 390 -210 {
lab=VB}
N 430 -320 430 -240 {
lab=#net2}
N 430 -330 530 -330 {
lab=#net2}
N 430 -330 430 -320 {
lab=#net2}
N 430 -370 430 -330 {
lab=#net2}
N 430 -410 430 -370 {
lab=#net2}
N 430 -520 430 -470 {
lab=VDD}
N 590 -330 630 -330 {
lab=VIN}
C {devices/code.sym} 10 -160 0 0 {name=spice only_toplevel=false
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
*.lib $::180MCU_MODELS/sm141064.ngspice statistical
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.lib $::180MCU_MODELS/sm141064.ngspice bjt_typical
.lib $::180MCU_MODELS/sm141064.ngspice diode_typical
.lib $::180MCU_MODELS/sm141064.ngspice mimcap_typical
.TEMP 27

.param
+  sw_stat_global = 1
+  sw_stat_mism = 1
+ mc_skew = 3
+ res_mc_skew = 3
+ cap_mc_skew = 3
+ fnoicor = 1  



.control
save all
dc V2 0 3.3 0.01

plot i(Vmeas) 1/(deriv(i(Vmeas)))
plot i(Vmeas)
plot deriv(v(VOUT))
tran 100n 10u
plot i(Vmeas)
.endc
"}
C {devices/lab_pin.sym} 0 -460 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 0 -400 0 0 {name=V1 value=3.3
}
C {devices/vsource.sym} 80 -400 0 0 {name=V2 value=1}
C {devices/gnd.sym} 0 -350 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 430 -560 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 80 -240 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 80 -470 0 0 {name=p6 sig_type=std_logic lab=VIN}
C {devices/vsource.sym} -130 -390 0 0 {name=V4 value=1
}
C {devices/gnd.sym} -130 -340 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} -130 -460 0 0 {name=p7 sig_type=std_logic lab=VB}
C {devices/gnd.sym} 460 -210 0 0 {name=l5 lab=GND}
C {devices/lab_pin.sym} 370 -210 0 0 {name=p10 sig_type=std_logic lab=VB}
C {symbols/nfet_03v3.sym} 410 -210 0 0 {name=M5
L=0.5u
W=50u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {devices/ammeter.sym} 560 -330 1 0 {name=Vmeas}
C {devices/res.sym} 430 -440 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 430 -160 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 630 -330 2 0 {name=p3 sig_type=std_logic lab=VIN}
C {devices/vsource.sym} 80 -300 0 0 {name=V3 value="ac 1.0 sin (0 100m 100k)"}
