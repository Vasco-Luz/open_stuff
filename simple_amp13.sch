v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 430 -10 500 -10 {
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
N 430 -210 460 -210 {
lab=GND}
N 430 -180 430 -160 {
lab=Vc}
N 430 -160 430 -40 {
lab=Vc}
N 430 20 430 50 {
lab=GND}
N -130 -360 -130 -340 {
lab=GND}
N -130 -460 -130 -420 {
lab=VB}
N 430 -560 430 -530 {
lab=VDD}
N 430 -530 430 -520 {
lab=VDD}
N 430 -520 430 -510 {
lab=VDD}
N 370 -210 390 -210 {
lab=VB}
N 430 -320 430 -240 {
lab=VOUT}
N 430 -350 490 -350 {
lab=VDD}
N -250 -360 -250 -340 {
lab=GND}
N -250 -460 -250 -420 {
lab=VB1}
N 360 -350 390 -350 {
lab=VIN}
N 430 -270 470 -270 {
lab=VOUT}
N 430 -510 430 -480 {
lab=VDD}
N 430 -420 430 -380 {
lab=#net2}
N 470 -270 530 -270 {
lab=VOUT}
N 530 -270 550 -270 {
lab=VOUT}
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

plot v(Vc)
plot v(VOUT) deriv(v(VOUT)) v(VIN) 
plot deriv(v(VOUT)) (v(VDD)-v(VG)) (v(VDD)-v(VOUT))
plot i(Vmeas) 
plot deriv(v(VOUT))
tran 1u 5m
plot (v(VOUT)-0.55415) (v(VIN)-2.465)
plot fft((v(VOUT))) fft((v(VIN)))
ac dec 20 1 50G
plot v(VOUT)
.endc
"}
C {devices/lab_pin.sym} 0 -460 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 500 -10 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 0 -400 0 0 {name=V1 value=3.3
}
C {devices/vsource.sym} 80 -400 0 0 {name=V2 value=2.465}
C {devices/gnd.sym} 0 -350 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 430 -560 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 80 -240 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 550 -270 2 0 {name=p5 sig_type=std_logic lab=VOUT}
C {devices/vsource.sym} 80 -300 0 0 {name=V3 value="ac 1.0 sin (0 100u 1k)"}
C {devices/lab_pin.sym} 80 -470 0 0 {name=p6 sig_type=std_logic lab=VIN}
C {devices/lab_pin.sym} 360 -350 0 0 {name=p3 sig_type=std_logic lab=VIN}
C {devices/vsource.sym} -130 -390 0 0 {name=V4 value=1.8
}
C {devices/gnd.sym} -130 -340 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} -130 -460 0 0 {name=p7 sig_type=std_logic lab=VB}
C {devices/gnd.sym} 430 50 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 460 -210 0 0 {name=l5 lab=GND}
C {devices/lab_pin.sym} 490 -350 2 0 {name=p4 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -250 -390 0 0 {name=V5 value=0.7
}
C {devices/gnd.sym} -250 -340 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} -250 -460 0 0 {name=p8 sig_type=std_logic lab=VB1}
C {devices/lab_pin.sym} 390 -10 0 0 {name=p9 sig_type=std_logic lab=VB1}
C {devices/lab_pin.sym} 370 -210 0 0 {name=p10 sig_type=std_logic lab=VB}
C {symbols/pfet_03v3.sym} 410 -350 0 0 {name=M4
L=1.5u
W=50u
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
C {symbols/nfet_03v3.sym} 410 -210 0 0 {name=M5
L=0.5u
W=40u
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
C {devices/lab_pin.sym} 430 -90 0 0 {name=p16 sig_type=std_logic lab=Vc}
C {symbols/nfet_03v3.sym} 410 -10 0 0 {name=M1
L=2u
W=20u
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
C {devices/ammeter.sym} 430 -450 0 0 {name=Vmeas}
