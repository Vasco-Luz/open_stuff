v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 430 -190 500 -190 {
lab=GND}
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
N 240 -190 390 -190 {
lab=VIN}
N 430 -390 460 -390 {
lab=VDD}
N 590 -400 630 -400 {
lab=GND}
N 430 -360 430 -340 {
lab=VOUT}
N 570 -370 570 -340 {
lab=VOUT}
N 430 -340 430 -220 {
lab=VOUT}
N 430 -160 430 -130 {
lab=GND}
N -130 -360 -130 -340 {
lab=GND}
N -130 -460 -130 -420 {
lab=VB}
N 330 -390 390 -390 {
lab=VB}
N 430 -340 570 -340 {
lab=VOUT}
N 430 -560 430 -530 {
lab=VDD}
N 570 -520 570 -510 {
lab=VDD}
N 570 -450 570 -430 {
lab=VDD}
N 430 -530 430 -520 {
lab=VDD}
N 430 -450 430 -420 {
lab=#net2}
N 430 -520 430 -510 {
lab=VDD}
N 430 -520 570 -520 {
lab=VDD}
N 570 -510 570 -450 {
lab=VDD}
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


plot v(VOUT) deriv(v(VOUT)) v(VIN) 
plot deriv(v(VOUT)) (v(VDD)-v(VB)) (v(VDD)-v(VOUT))
plot i(Vmeas) 
plot deriv(v(VOUT))
tran 10ns 20u
plot (v(VOUT)-1.348) (v(VIN)-1.2)
plot fft((v(VOUT))) fft((v(VIN)))
ac dec 20 1 50G
plot v(VOUT)
.endc
"}
C {symbols/nfet_03v3.sym} 410 -190 0 0 {name=M1
L=0.5u
W=50u
nf=10
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
C {devices/ammeter.sym} 430 -480 0 0 {name=Vmeas}
C {devices/lab_pin.sym} 0 -460 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 500 -190 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 0 -400 0 0 {name=V1 value=3.3
}
C {devices/vsource.sym} 80 -400 0 0 {name=V2 value=1.2}
C {devices/gnd.sym} 0 -350 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 430 -560 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 80 -240 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 430 -280 2 0 {name=p5 sig_type=std_logic lab=VOUT}
C {symbols/nwell.sym} 570 -400 2 0 {name=R2
W=5e-6
L=5e-6
model=nwell
spiceprefix=X
m=1
}
C {devices/vsource.sym} 80 -300 0 0 {name=V3 value="ac 1.0 sin (0 20m 100k)"}
C {devices/lab_pin.sym} 80 -470 0 0 {name=p6 sig_type=std_logic lab=VIN}
C {devices/lab_pin.sym} 240 -190 0 0 {name=p3 sig_type=std_logic lab=VIN}
C {symbols/pfet_03v3.sym} 410 -390 0 0 {name=M2
L=1u
W=30u
nf=5
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {devices/lab_pin.sym} 460 -390 2 0 {name=p4 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 630 -400 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 430 -130 0 0 {name=l5 lab=GND}
C {devices/vsource.sym} -130 -390 0 0 {name=V4 value=2.2
}
C {devices/gnd.sym} -130 -340 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} -130 -460 0 0 {name=p7 sig_type=std_logic lab=VB}
C {devices/lab_pin.sym} 330 -390 0 0 {name=p8 sig_type=std_logic lab=VB}
