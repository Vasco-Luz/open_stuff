v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 430 -250 430 -220 {
lab=VOUT}
N 430 -340 430 -310 {
lab=#net1}
N 430 -160 430 -130 {
lab=GND}
N 430 -130 430 -110 {
lab=GND}
N 430 -190 500 -190 {
lab=GND}
N 100 -350 100 -330 {
lab=GND}
N 100 -450 100 -410 {
lab=VDD}
N 430 -440 430 -400 {
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
N 650 -170 650 -150 {
lab=GND}
N 250 190 300 190 {
lab=VINT}
N 250 190 250 210 {
lab=VINT}
N 360 190 430 190 {
lab=#net2}
N 430 190 470 190 {
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
N 430 -240 480 -240 {
lab=VOUT}
N 360 -280 360 -190 {
lab=VIN}
N 360 -280 380 -280 {
lab=VIN}
N 380 -280 390 -280 {
lab=VIN}
N 480 -240 670 -240 {
lab=VOUT}
N 650 -240 650 -230 {
lab=VOUT}
N 540 170 540 200 {
lab=#net3}
N 540 80 540 110 {
lab=#net4}
N 540 260 540 290 {
lab=GND}
N 540 290 540 310 {
lab=GND}
N 540 230 610 230 {
lab=GND}
N 540 -20 540 20 {
lab=VDD}
N 540 180 590 180 {
lab=#net3}
N 470 140 470 230 {
lab=#net2}
N 470 140 490 140 {
lab=#net2}
N 490 140 500 140 {
lab=#net2}
N 470 230 500 230 {
lab=#net2}
N 590 180 630 180 {
lab=#net3}
N 630 130 630 180 {
lab=#net3}
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
plot v(VOUT) v(VIN) deriv(v(VOUT))
plot i(Vmeas) 
plot deriv(v(VOUT))
tran 10ns 20u
plot (v(VINT)) (v(VOUTT))
fft v(VOUTT) v(VINT)
plot mag(v(VOUTT)) mag(v(VINT))


ac dec 20 1 50G
plot v(VOUTT)
.endc
"}
C {symbols/nfet_03v3.sym} 410 -190 0 0 {name=M1
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
model=nfet_03v3
spiceprefix=X
}
C {devices/ammeter.sym} 430 -370 0 0 {name=Vmeas}
C {devices/lab_pin.sym} 100 -440 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 430 -110 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 500 -190 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 100 -380 0 0 {name=V1 value=3.3
}
C {devices/vsource.sym} 180 -380 0 0 {name=V2 value=2}
C {devices/gnd.sym} 100 -330 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 430 -430 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 250 300 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 180 -440 0 0 {name=p3 sig_type=std_logic lab=VIN
}
C {devices/lab_pin.sym} 670 -240 2 0 {name=p5 sig_type=std_logic lab=VOUT}
C {devices/vsource.sym} 250 240 0 0 {name=V3 value="ac 1.0 sin (0 10m 100k)"}
C {devices/lab_pin.sym} 340 -190 0 0 {name=p4 sig_type=std_logic lab=VIN
}
C {devices/gnd.sym} 180 -310 0 0 {name=l5 lab=GND}
C {devices/res.sym} 650 -200 0 0 {name=R2
value=10000k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 650 -150 0 0 {name=l6 lab=GND}
C {devices/capa.sym} 330 190 3 0 {name=C1
m=1
value=100m
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 420 30 0 0 {name=p6 sig_type=std_logic lab=VIN
}
C {devices/res.sym} 420 80 0 0 {name=R3
value=10M
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 660 130 3 0 {name=C2
m=1
value=100m
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 730 160 0 0 {name=R5
value=10000k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 730 210 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 770 130 2 0 {name=p8 sig_type=std_logic lab=VOUTT}
C {devices/lab_pin.sym} 260 190 1 0 {name=p9 sig_type=std_logic lab=VINT
}
C {symbols/nfet_03v3.sym} 410 -280 0 0 {name=M3
L=0.5u
W=100u
nf=20
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
C {symbols/nfet_03v3.sym} 520 230 0 0 {name=M2
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
model=nfet_03v3
spiceprefix=X
}
C {devices/ammeter.sym} 540 50 0 0 {name=Vmeas1}
C {devices/gnd.sym} 540 310 0 0 {name=l7 lab=GND}
C {devices/gnd.sym} 610 230 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} 540 -10 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {symbols/nfet_03v3.sym} 520 140 0 0 {name=M4
L=0.5u
W=100u
nf=20
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
