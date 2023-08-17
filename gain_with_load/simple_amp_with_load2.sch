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
N 430 -440 430 -400 {
lab=VDD}
N 80 -370 80 -350 {
lab=#net1}
N 80 -470 80 -430 {
lab=VIN}
N 80 -350 80 -330 {
lab=#net1}
N 80 -270 80 -240 {
lab=GND}
N 250 -60 300 -60 {
lab=VIN}
N 430 -340 430 -310 {
lab=#net2}
N 430 -310 430 -300 {
lab=#net2}
N 370 -140 370 -60 {
lab=VIN}
N 300 -60 370 -60 {
lab=VIN}
N 370 -200 430 -200 {
lab=VOUT}
N 430 -240 430 -200 {
lab=VOUT}
N 490 -200 490 -170 {
lab=VOUT}
N 430 -200 490 -200 {
lab=VOUT}
N 370 -60 490 -60 {
lab=VIN}
N 490 -110 490 -60 {
lab=VIN}
N 420 -140 490 -140 {
lab=GND}
N 530 -140 570 -140 {
lab=#net3}
N 570 -80 570 -70 {
lab=GND}
N 420 -10 420 30 {
lab=VDD}
N 240 370 290 370 {
lab=VIN}
N 420 90 420 120 {
lab=#net4}
N 420 120 420 130 {
lab=#net4}
N 360 290 360 370 {
lab=VIN}
N 290 370 360 370 {
lab=VIN}
N 360 230 420 230 {
lab=#net5}
N 420 190 420 230 {
lab=#net5}
N 480 230 480 260 {
lab=#net5}
N 420 230 480 230 {
lab=#net5}
N 360 370 480 370 {
lab=VIN}
N 480 320 480 370 {
lab=VIN}
N 410 290 480 290 {
lab=GND}
N 520 290 560 290 {
lab=#net6}
N 560 350 560 360 {
lab=GND}
N 480 230 550 230 {
lab=#net5}
N 610 230 700 230 {
lab=VOUTT}
N 490 -200 710 -200 {
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


plot v(VOUT) deriv(v(VOUT)) v(VIN)
plot v(VOUT) deriv(v(VOUT)) 
plot i(Vmeas) 
plot deriv(v(VOUT))
tran 10ns 20u
plot (v(VOUTT)) (v(VIN)-0.160)
plot fft((v(VOUTT))) fft((v(VIN)))
ac dec 20 1 50G
plot v(VOUT)
.endc
"}
C {devices/ammeter.sym} 430 -370 0 0 {name=Vmeas}
C {devices/lab_pin.sym} 0 -460 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 0 -400 0 0 {name=V1 value=3.3
}
C {devices/vsource.sym} 80 -400 0 0 {name=V2 value=0.160}
C {devices/gnd.sym} 0 -350 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 430 -430 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 80 -240 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} 80 -300 0 0 {name=V3 value="ac 1.0 sin (0 20m 100k)"}
C {devices/lab_pin.sym} 80 -470 0 0 {name=p6 sig_type=std_logic lab=VIN}
C {devices/lab_pin.sym} 250 -60 0 0 {name=p3 sig_type=std_logic lab=VIN}
C {devices/res.sym} 370 -170 0 0 {name=R1
value=8k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 430 -270 0 0 {name=R2
value=1k
footprint=1206
device=resistor
m=1}
C {symbols/nfet_03v3.sym} 510 -140 2 0 {name=M1
L=0.5u
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
C {devices/gnd.sym} 420 -140 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 570 -110 0 0 {name=V4 value=1.3
}
C {devices/gnd.sym} 570 -70 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 490 -200 2 0 {name=p4 sig_type=std_logic lab=VOUT}
C {devices/res.sym} 710 -170 0 0 {name=R3
value=10k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 710 -140 0 0 {name=l5 lab=GND}
C {devices/ammeter.sym} 420 60 0 0 {name=Vmeas1}
C {devices/lab_pin.sym} 420 0 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 240 370 0 0 {name=p7 sig_type=std_logic lab=VIN}
C {devices/res.sym} 360 260 0 0 {name=R4
value=8k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 420 160 0 0 {name=R5
value=1k
footprint=1206
device=resistor
m=1}
C {symbols/nfet_03v3.sym} 500 290 2 0 {name=M2
L=0.5u
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
C {devices/gnd.sym} 410 290 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} 560 320 0 0 {name=V5 value=1.3
}
C {devices/gnd.sym} 560 360 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} 650 230 1 0 {name=p8 sig_type=std_logic lab=VOUTT}
C {devices/res.sym} 700 260 0 0 {name=R6
value=10k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 700 290 0 0 {name=l8 lab=GND}
C {devices/capa.sym} 580 230 3 0 {name=C1
m=1
value=100m
footprint=1206
device="ceramic capacitor"}
