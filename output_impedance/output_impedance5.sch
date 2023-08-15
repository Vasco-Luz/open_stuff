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
N 500 -330 570 -330 {
lab=GND}
N 680 -180 680 -160 {
lab=VIN}
N 680 -250 680 -240 {
lab=#net2}
N 500 -100 500 -60 {
lab=GND}
N 500 -300 500 -260 {
lab=#net2}
N 570 -250 670 -250 {
lab=#net2}
N 570 -270 570 -250 {
lab=#net2}
N 500 -270 570 -270 {
lab=#net2}
N 390 -330 460 -330 {
lab=#net3}
N 390 -270 390 -260 {
lab=GND}
N 670 -250 680 -250 {
lab=#net2}
N 500 -120 500 -100 {
lab=GND}
N 500 -260 500 -180 {
lab=#net2}
N 500 -150 540 -150 {
lab=GND}
N 420 -90 420 -70 {
lab=GND}
N 420 -150 460 -150 {
lab=#net4}
N 500 -530 500 -490 {
lab=VDD}
N 500 -460 580 -460 {
lab=VDD}
N 500 -430 500 -360 {
lab=VA}
N 400 -460 460 -460 {
lab=#net5}
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
plot v(Va)

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
C {devices/vsource.sym} 80 -400 0 0 {name=V2 value=2}
C {devices/gnd.sym} 0 -350 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 500 -530 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 80 -240 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 80 -470 0 0 {name=p6 sig_type=std_logic lab=VIN}
C {devices/ammeter.sym} 680 -210 2 0 {name=Vmeas}
C {devices/vsource.sym} 80 -300 0 0 {name=V3 value="ac 1.0 sin (0 100m 100k)"}
C {devices/lab_pin.sym} 680 -160 3 0 {name=p5 sig_type=std_logic lab=VIN}
C {devices/gnd.sym} 570 -330 0 0 {name=l1 lab=GND}
C {symbols/nfet_03v3.sym} 480 -330 0 0 {name=M1
L=0.5u
W=90u
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
C {devices/gnd.sym} 500 -60 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 390 -300 0 0 {name=V4 value=2.5}
C {devices/gnd.sym} 390 -260 0 0 {name=l5 lab=GND}
C {symbols/nfet_03v3.sym} 480 -150 0 0 {name=M2
L=0.7u
W=70u
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
C {devices/gnd.sym} 540 -150 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} 420 -120 0 0 {name=V5 value=1}
C {devices/gnd.sym} 420 -70 0 0 {name=l7 lab=GND}
C {symbols/pfet_03v3.sym} 480 -460 0 0 {name=M3
L=1u
W=80u
nf=1
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
C {devices/lab_pin.sym} 580 -460 2 0 {name=p3 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 400 -430 0 0 {name=V6 value=1.7}
C {devices/gnd.sym} 400 -400 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} 500 -400 0 0 {name=p4 sig_type=std_logic lab=VA}
