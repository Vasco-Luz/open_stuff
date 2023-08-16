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
N 660 -400 660 -380 {
lab=VIN}
N 660 -470 660 -460 {
lab=#net2}
N 470 -470 660 -470 {
lab=#net2}
N 470 -470 470 -440 {
lab=#net2}
N 470 -380 470 -280 {
lab=Va}
N 470 -220 470 -200 {
lab=GND}
N 470 -250 480 -250 {
lab=GND}
N 480 -250 480 -210 {
lab=GND}
N 470 -210 480 -210 {
lab=GND}
N 470 -410 480 -410 {
lab=GND}
N 340 -390 340 -350 {
lab=Va}
N 340 -350 470 -350 {
lab=Va}
N 340 -480 340 -450 {
lab=VDD}
N 370 -250 430 -250 {
lab=#net3}
N 410 -410 410 -340 {
lab=#net4}
N 410 -410 430 -410 {
lab=#net4}
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
C {devices/gnd.sym} 80 -240 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 80 -470 0 0 {name=p6 sig_type=std_logic lab=VIN}
C {devices/ammeter.sym} 660 -430 2 0 {name=Vmeas}
C {devices/vsource.sym} 80 -300 0 0 {name=V3 value="ac 1.0 sin (0 100m 100k)"}
C {devices/lab_pin.sym} 660 -380 3 0 {name=p5 sig_type=std_logic lab=VIN}
C {symbols/nfet_03v3.sym} 450 -410 0 0 {name=M1
L=0.5u
W=80u
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
C {symbols/nfet_03v3.sym} 450 -250 0 0 {name=M2
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
model=nfet_03v3
spiceprefix=X
}
C {devices/lab_pin.sym} 470 -330 2 0 {name=p2 sig_type=std_logic lab=Va}
C {devices/gnd.sym} 470 -200 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 480 -410 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 340 -480 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 370 -220 0 0 {name=V4 value=1}
C {devices/gnd.sym} 370 -190 0 0 {name=l5 lab=GND}
C {devices/vsource.sym} 410 -310 0 0 {name=V5 value=1.8}
C {devices/gnd.sym} 410 -280 0 0 {name=l6 lab=GND}
C {devices/isource.sym} 340 -420 0 0 {name=I0 value=500u}
