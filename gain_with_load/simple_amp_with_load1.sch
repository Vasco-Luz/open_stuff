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
N 0 -370 0 -350 {
lab=GND}
N 0 -470 0 -430 {
lab=VDD}
N 430 -440 430 -400 {
lab=VDD}
N 80 -370 80 -350 {
lab=#net2}
N 80 -470 80 -430 {
lab=VIN}
N 80 -350 80 -330 {
lab=#net2}
N 80 -270 80 -240 {
lab=GND}
N 430 -110 430 -70 {
lab=GND}
N 280 -190 390 -190 {
lab=VIN}
N 230 -190 280 -190 {
lab=VIN}
N 300 -260 350 -260 {
lab=VOUT}
N 350 -260 350 -240 {
lab=VOUT}
N 350 -240 430 -240 {
lab=VOUT}
N 300 -200 300 -190 {
lab=VIN}
N 650 -240 650 -230 {
lab=VOUT}
N 650 -170 650 -150 {
lab=GND}
N 540 -240 650 -240 {
lab=VOUT}
N 430 -240 480 -240 {
lab=VOUT}
N 480 -240 540 -240 {
lab=VOUT}
N 390 170 390 200 {
lab=#net3}
N 390 80 390 110 {
lab=#net4}
N 390 260 390 290 {
lab=GND}
N 390 290 390 310 {
lab=GND}
N 390 230 460 230 {
lab=GND}
N 390 -20 390 20 {
lab=VDD}
N 390 310 390 350 {
lab=GND}
N 240 230 350 230 {
lab=VIN}
N 190 230 240 230 {
lab=VIN}
N 260 160 310 160 {
lab=#net3}
N 310 160 310 180 {
lab=#net3}
N 310 180 390 180 {
lab=#net3}
N 260 220 260 230 {
lab=VIN}
N 610 180 610 190 {
lab=VOUTT}
N 610 250 610 270 {
lab=GND}
N 500 180 610 180 {
lab=VOUTT}
N 390 180 440 180 {
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


plot v(VOUT) deriv(v(VOUT)) v(VIN)
plot v(VOUT) deriv(v(VOUT)) 
plot i(Vmeas) 
plot deriv(v(VOUT))
tran 10ns 20u
plot (v(VOUTT)) (v(VIN)-1.2)
plot fft((v(VOUTT))) fft((v(VIN)))
ac dec 20 1 50G
plot v(VOUT)
.endc
"}
C {symbols/nfet_03v3.sym} 410 -190 0 0 {name=M1
L=0.5u
W=60u
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
C {devices/ammeter.sym} 430 -370 0 0 {name=Vmeas}
C {devices/lab_pin.sym} 0 -460 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 500 -190 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 0 -400 0 0 {name=V1 value=3.3
}
C {devices/vsource.sym} 80 -400 0 0 {name=V2 value=1.2}
C {devices/gnd.sym} 0 -350 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 430 -430 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 80 -240 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 610 -240 1 0 {name=p5 sig_type=std_logic lab=VOUT}
C {devices/vsource.sym} 80 -300 0 0 {name=V3 value="ac 1.0 sin (0 20m 100k)"}
C {devices/lab_pin.sym} 80 -470 0 0 {name=p6 sig_type=std_logic lab=VIN}
C {devices/gnd.sym} 430 -70 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 230 -190 0 0 {name=p3 sig_type=std_logic lab=VIN}
C {devices/res.sym} 430 -280 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 300 -230 0 0 {name=R2
value=5k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 650 -200 0 0 {name=R3
value=10k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 650 -150 0 0 {name=l5 lab=GND}
C {symbols/nfet_03v3.sym} 370 230 0 0 {name=M2
L=0.5u
W=60u
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
C {devices/ammeter.sym} 390 50 0 0 {name=Vmeas1}
C {devices/gnd.sym} 460 230 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 390 -10 0 0 {name=p4 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 570 180 1 0 {name=p7 sig_type=std_logic lab=VOUTT}
C {devices/gnd.sym} 390 350 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} 190 230 0 0 {name=p8 sig_type=std_logic lab=VIN}
C {devices/res.sym} 390 140 0 0 {name=R4
value=1k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 260 190 0 0 {name=R5
value=5k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 610 220 0 0 {name=R6
value=10k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 610 270 0 0 {name=l8 lab=GND}
C {devices/capa.sym} 470 180 3 0 {name=C1
m=1
value=100m
footprint=1206
device="ceramic capacitor"}
