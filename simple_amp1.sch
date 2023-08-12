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
N 430 -230 580 -230 {
lab=VOUT}
N 430 -160 430 -130 {
lab=GND}
N 430 -130 580 -130 {
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
lab=#net2}
N 180 -450 180 -410 {
lab=VB}
N 340 -190 390 -190 {
lab=VB}
N 580 -130 660 -130 {
lab=GND}
N 660 -160 660 -130 {
lab=GND}
N 660 -230 660 -220 {
lab=VOUT}
N 580 -230 660 -230 {
lab=VOUT}
N 370 -280 410 -280 {
lab=GND}
N 680 -190 720 -190 {
lab=GND}
N 180 -330 180 -310 {
lab=#net2}
N 180 -250 180 -220 {
lab=GND}
C {devices/code.sym} 10 -160 0 0 {name=spice only_toplevel=false
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.lib $::180MCU_MODELS/sm141064.ngspice bjt_typical
.lib $::180MCU_MODELS/sm141064.ngspice diode_typical
.lib $::180MCU_MODELS/sm141064.ngspice mimcap_typical

.control
save all
dc V2 0 3.3 0.01
plot v(VOUT) v(VB) deriv(v(VOUT))
plot i(Vmeas) 
plot deriv(v(VOUT))
tran 10ns 20u
plot (1.7-v(VB)) (1.43-v(VOUT))
ac dec 20 1 50G
plot v(VOUT)
.endc
"}
C {symbols/nfet_03v3.sym} 410 -190 0 0 {name=M1
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
C {devices/ammeter.sym} 430 -370 0 0 {name=Vmeas}
C {devices/lab_pin.sym} 100 -440 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 430 -110 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 500 -190 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 100 -380 0 0 {name=V1 value=3.3
}
C {devices/vsource.sym} 180 -380 0 0 {name=V2 value=1.7}
C {devices/gnd.sym} 100 -330 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 430 -430 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 180 -220 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 180 -440 0 0 {name=p3 sig_type=std_logic lab=VB
}
C {devices/lab_pin.sym} 340 -190 0 0 {name=p4 sig_type=std_logic lab=VB
}
C {devices/lab_pin.sym} 550 -230 1 0 {name=p5 sig_type=std_logic lab=VOUT}
C {symbols/nwell.sym} 430 -280 0 0 {name=R1
W=5e-6
L=5e-6
model=nwell
spiceprefix=X
m=4}
C {symbols/nwell.sym} 660 -190 2 0 {name=R2
W=5e-6
L=5e-6
model=nwell
spiceprefix=X
m=1
}
C {devices/gnd.sym} 370 -280 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} 720 -190 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} 180 -280 0 0 {name=V3 value="ac 1.0 sin (0 20m 100k)"}
