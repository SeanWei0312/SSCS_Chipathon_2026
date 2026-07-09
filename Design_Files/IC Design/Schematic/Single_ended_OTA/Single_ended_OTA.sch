v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 600 -280 720 -280 {lab=#net1}
N 780 -280 820 -280 {lab=#net2}
N 720 -200 840 -200 {lab=#net1}
N 820 -520 840 -520 {lab=VB}
N 420 -520 440 -520 {lab=VB}
N 280 -520 420 -520 {lab=VB}
N 600 -400 600 -390 {lab=#net3}
N 360 -440 600 -440 {lab=#net3}
N 360 -400 360 -390 {lab=#net3}
N 240 -600 880 -600 {lab=DD}
N 360 -440 360 -400 {lab=#net3}
N 600 -440 600 -400 {lab=#net3}
N 480 -490 480 -440 {lab=#net3}
N 720 -280 720 -200 {lab=#net1}
N 880 -280 880 -230 {lab=OUT}
N 880 -490 880 -280 {lab=OUT}
N 360 -330 360 -230 {lab=#net4}
N 600 -330 600 -280 {lab=#net1}
N 600 -280 600 -230 {lab=#net1}
N 360 -170 360 -120 {lab=SS}
N 880 -170 880 -120 {lab=SS}
N 600 -170 600 -120 {lab=SS}
N 600 -120 880 -120 {lab=SS}
N 360 -120 600 -120 {lab=SS}
N 640 -360 660 -360 {lab=INP}
N 300 -360 320 -360 {lab=INN}
N 400 -200 560 -200 {lab=#net4}
N 480 -280 480 -200 {lab=#net4}
N 360 -280 480 -280 {lab=#net4}
N 240 -460 300 -460 {lab=VB}
N 300 -520 300 -460 {lab=VB}
N 240 -490 240 -460 {lab=VB}
N 240 -460 240 -440 {lab=VB}
N 240 -600 240 -550 {lab=DD}
N 480 -600 480 -550 {lab=DD}
N 880 -600 880 -550 {lab=DD}
N 880 -360 900 -360 {lab=OUT}
N 100 -600 120 -600 {lab=DD}
N 100 -560 120 -560 {lab=SS}
N 100 -520 120 -520 {lab=INP}
N 100 -480 120 -480 {lab=INN}
N 100 -440 120 -440 {lab=OUT}
N 220 -520 240 -520 {lab=DD}
N 220 -560 220 -520 {lab=DD}
N 220 -560 240 -560 {lab=DD}
N 480 -520 500 -520 {lab=DD}
N 500 -560 500 -520 {lab=DD}
N 480 -560 500 -560 {lab=DD}
N 880 -520 900 -520 {lab=DD}
N 900 -560 900 -520 {lab=DD}
N 880 -560 900 -560 {lab=DD}
N 880 -200 900 -200 {lab=SS}
N 900 -200 900 -160 {lab=SS}
N 880 -160 900 -160 {lab=SS}
N 600 -200 620 -200 {lab=SS}
N 620 -200 620 -160 {lab=SS}
N 600 -160 620 -160 {lab=SS}
N 340 -200 360 -200 {lab=SS}
N 340 -200 340 -160 {lab=SS}
N 340 -160 360 -160 {lab=SS}
N 360 -360 380 -360 {lab=DD}
N 380 -600 380 -360 {lab=DD}
N 580 -360 600 -360 {lab=DD}
N 580 -600 580 -360 {lab=DD}
C {title.sym} 160 -40 0 0 {name=l1 author="Yi-Hsiang Wei"}
C {symbols/nfet_03v3.sym} 580 -200 0 0 {name=M4
L=2u
W=4u
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
C {symbols/nfet_03v3.sym} 380 -200 0 1 {name=M3
L=2u
W=4u
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
C {symbols/pfet_03v3.sym} 340 -360 0 0 {name=M1
L=1u
W=4u
nf=16
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
C {symbols/pfet_03v3.sym} 620 -360 0 1 {name=M2
L=1u
W=4u
nf=16
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
C {symbols/pfet_03v3.sym} 860 -520 0 0 {name=M7
L=0.5u
W=4u
nf=28
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
C {res.sym} 750 -280 3 0 {name=Rz
value=0.5k
footprint=1206
device=resistor
m=1}
C {symbols/pfet_03v3.sym} 460 -520 0 0 {name=M5
L=2u
W=4u
nf=10
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
C {symbols/nfet_03v3.sym} 860 -200 0 0 {name=M6
L=0.5u
W=4u
nf=8
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
C {symbols/pfet_03v3.sym} 260 -520 0 1 {name=M8
L=2u
W=4u
nf=25
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
C {capa.sym} 850 -280 3 0 {name=Cc
m=1
value=2p
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} 480 -120 0 0 {name=p2 sig_type=std_logic lab=SS}
C {lab_wire.sym} 900 -360 0 1 {name=p3 sig_type=std_logic lab=OUT
}
C {lab_wire.sym} 820 -520 0 0 {name=p4 sig_type=std_logic lab=VB
}
C {lab_wire.sym} 360 -520 0 0 {name=p5 sig_type=std_logic lab=VB
}
C {lab_wire.sym} 660 -360 0 1 {name=p6 sig_type=std_logic lab=INP
}
C {lab_wire.sym} 300 -360 0 0 {name=p7 sig_type=std_logic lab=INN
}
C {iopin.sym} 100 -600 0 1 {name=p8 lab=DD}
C {iopin.sym} 100 -560 0 1 {name=p9 lab=SS}
C {lab_wire.sym} 480 -600 0 0 {name=p10 sig_type=std_logic lab=DD}
C {lab_wire.sym} 120 -600 0 1 {name=p11 sig_type=std_logic lab=DD}
C {lab_wire.sym} 120 -560 0 1 {name=p12 sig_type=std_logic lab=SS}
C {ipin.sym} 100 -520 0 0 {name=p13 lab=INP}
C {ipin.sym} 100 -480 0 0 {name=p14 lab=INN}
C {lab_wire.sym} 120 -520 0 1 {name=p15 sig_type=std_logic lab=INP}
C {lab_wire.sym} 120 -480 0 1 {name=p16 sig_type=std_logic lab=INN}
C {opin.sym} 100 -440 0 1 {name=p17 lab=OUT}
C {lab_wire.sym} 120 -440 0 1 {name=p18 sig_type=std_logic lab=OUT}
