v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 430 -250 430 -220 {
lab=VS}
N 430 -340 430 -310 {
lab=#net1}
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
N 370 -280 410 -280 {
lab=GND}
N 80 -350 80 -330 {
lab=#net2}
N 80 -270 80 -240 {
lab=GND}
N 430 -160 430 -130 {
lab=VOUT}
N 430 -70 430 -30 {
lab=GND}
N 450 -100 480 -100 {
lab=GND}
N 370 -190 390 -190 {
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


plot v(VOUT) deriv(v(VOUT)) v(VIN) (v(VIN)-v(VOUT)) (v(VS)-v(VOUT))
plot v(VOUT) deriv(v(VOUT)) 
plot i(Vmeas) 
plot deriv(v(VOUT))
tran 10ns 20u
plot (v(VOUT)-1.01377) (v(VIN)-2)
plot fft((v(VOUT))) fft((v(VIN)))
ac dec 20 1 50G
plot v(VOUT)
.endc
"}
C {symbols/nfet_03v3.sym} 410 -190 0 0 {name=M1
L=0.28u
W=100u
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
C {devices/vsource.sym} 80 -400 0 0 {name=V2 value=2}
C {devices/gnd.sym} 0 -350 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 430 -430 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 80 -240 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 430 -150 2 0 {name=p5 sig_type=std_logic lab=VOUT}
C {symbols/nwell.sym} 430 -280 0 0 {name=R1
W=5e-6
L=5e-6
model=nwell
spiceprefix=X
m=10}
C {symbols/nwell.sym} 430 -100 2 0 {name=R2
W=5e-6
L=5e-6
model=nwell
spiceprefix=X
m=2
}
C {devices/gnd.sym} 370 -280 0 0 {name=l5 lab=GND}
C {devices/vsource.sym} 80 -300 0 0 {name=V3 value="ac 1.0 sin (0 20m 100k)"}
C {devices/lab_pin.sym} 80 -470 0 0 {name=p6 sig_type=std_logic lab=VIN}
C {devices/gnd.sym} 430 -30 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 370 -190 0 0 {name=p3 sig_type=std_logic lab=VIN}
C {devices/gnd.sym} 480 -100 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 430 -240 0 0 {name=p4 sig_type=std_logic lab=VS}
